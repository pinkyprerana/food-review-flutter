import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../core/constants/app_urls.dart';
import '../../../core/infrastructure/hive_database.dart';
import '../../../core/infrastructure/network_api_services.dart';
import '../../../core/utils/app_log.dart';
import '../../../core/utils/toast.dart';
import '../domain/chat_create_model.dart';
import '../domain/chat_model.dart';
import 'chat_state.dart';

class ChatNotifier extends StateNotifier<ChatState> {
  ChatNotifier(this._dio, this._hiveDataBase, this._networkApiService)
      : super(const ChatState());

  final HiveDatabase _hiveDataBase;
  final Dio _dio;
  final NetworkApiService _networkApiService;
  final DatabaseReference _db = FirebaseDatabase.instance.ref();

  String? get getUserId => _hiveDataBase.box.get(AppPreferenceKeys.userId);

  Future<void> initializeChat(String chatId, String peopleId) async {
    int retryCount = 0;
    const maxRetries = 3;

    while (retryCount < maxRetries) {
      try {
        final chatDoc = FirebaseFirestore.instance.collection('chat_dev').doc(chatId);
        final docSnapshot = await chatDoc.get();
        if (!docSnapshot.exists) {
          await chatDoc.set({
            'userIds': [getUserId, peopleId],
            'createdAt': FieldValue.serverTimestamp(),
          });
        }
        return;
      } on FirebaseException catch (e) {
        if (e.code == 'unavailable') {
          final delay = Duration(seconds: pow(2, retryCount).toInt());
          await Future.delayed(delay);
          retryCount++;
        } else {
          rethrow;
        }
      }
    }

    showToastMessage('Failed to initialize chat. Please try again later.');
  }

  Future<void> sendMessage(String peopleId, ChatModel message) async {
    state = state.copyWith(isSending: true);

    try {
      final chatRef = _db.child('chat_dev/$peopleId');
      await chatRef.push().set(message.toJson());
      final chatDoc = FirebaseFirestore.instance.collection('chat_dev').doc(peopleId);
      await chatDoc.update({
        'lastMessage': message.message,
        'lastMessageTimestamp': FieldValue.serverTimestamp(),
        'lastAttachment': message.chatAttachment,
        'lastReaction': message.reaction,
        'read': false,
      });
      AppLog.log('Message sent successfully!');
      state = state.copyWith(isSending: false);
    } catch (e) {
      state = state.copyWith(isSending: false);
      showToastMessage('Error sending message: $e');
    }
  }

  Future<void> sendMessageWithRetry(String peopleId, ChatModel message) async {
    int retryCount = 0;
    const maxRetries = 3;

    while (retryCount < maxRetries) {
      try {

        var (response, dioException) = await _networkApiService
            .postApiRequestWithToken(url: '${AppUrls.baseUrl}${AppUrls.chatTokenGenerate}',
            body: {
              "user_id": peopleId
            });
        state = state.copyWith(isLoading: false);

        if (response == null && dioException == null) {
          showConnectionWasInterruptedToastMessage();
        } else if (dioException != null) {
          showDioError(dioException);
        } else {
          ChatCreateModel ccModel = ChatCreateModel.fromJson(response.data);
          if (ccModel.status == 200) {
            state = state.copyWith(isLoading: false);
          } else {
            showToastMessage(ccModel.message.toString());
          }
        }

        await sendMessage(peopleId, message);
        final chatDoc = FirebaseFirestore.instance.collection('chat_dev').doc(peopleId);
        await chatDoc.update({
          'lastMessage': message.message,
          'lastMessageTimestamp': FieldValue.serverTimestamp(),
          'lastAttachment': message.chatAttachment,
          'lastReaction': message.reaction,
          'read': false,
        });
        return; // Exit if successful
      } catch (e) {
        retryCount++;
        final delay = Duration(seconds: pow(2, retryCount).toInt());
        AppLog.log('Retrying in ${delay.inSeconds} seconds...');
        await Future.delayed(delay);
      }
    }

    showToastMessage('Failed to send message. Please try again later.');
  }

  Stream<List<ChatModel>> getMessages(String chatId) {
    final chatRef = _db.child('chat_dev/$chatId');

    return chatRef.onValue.map((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;

      if (data == null) return [];

      try {
        return data.entries.map((entry) {
          final messageData = Map<String, dynamic>.from(entry.value as Map);
          AppLog.log('Received message: ${messageData['message']}');
          return ChatModel.fromJson(messageData);
        }).toList()
          ..sort((a, b) => a.createdAt.compareTo(b.createdAt));
      } catch (e) {
        AppLog.log('Error retrieving messages: $e');
        return [];
      }
    });
  }


  // Future<List<ChatModel>> getChatList(String currentUserId) async {
  //   try {
  //     final chatRef = _db.child('chat_dev/');
  //     final snapshot = await chatRef.get();
  //
  //     if (!snapshot.exists) return [];
  //
  //     final chatList = snapshot.children.map((chatData) {
  //       final chatValue = chatData.value as Map<String, dynamic>?;
  //       final participants = (chatValue?['participants'] as List<dynamic>?)?.cast<String>();
  //
  //       if (participants == null || !participants.contains(currentUserId)) return null;
  //
  //       final otherUserId = participants.firstWhere((id) => id != currentUserId);
  //
  //       final lastMessage = chatValue?['lastMessage'] ?? "";
  //       final lastMessageTimestamp = chatValue?['lastMessageTimestamp'] as int? ?? DateTime.now().millisecondsSinceEpoch ~/ 1000;
  //
  //       return ChatModel(
  //         chatAttachment: chatValue?['lastAttachment'] ?? "",
  //         createdAt: lastMessageTimestamp,
  //         message: lastMessage,
  //         reaction: chatValue?['lastReaction'] ?? "",
  //         read: chatValue?['read'] ?? false,
  //         receiverID: otherUserId,
  //         senderID: currentUserId,
  //       );
  //     }).whereType<ChatModel>().toList();
  //
  //     return chatList;
  //   } catch (e) {
  //     AppLog.log('Error fetching chat list: $e');
  //     return [];
  //   }
  // }

  Future<void> fetchAParticularChat() async {
    state = state.copyWith(isLoading: true);

    try {
      final userId = getUserId;
      if (userId == null) {
        throw Exception("User ID is null.");
      }

      final chatDataList = await getChatList(userId);
      state = state.copyWith(isLoading: false, allChatList: chatDataList);

    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
      AppLog.log('Error fetching chats: $e');
    }
  }

  void selectChat(String chat) {
    state = state.copyWith(selectedChat: chat);
  }


  final RefreshController refreshController = RefreshController();

  void addChat(ChatCreateModel notification) {
    // if (mounted) {
    //   state = state.copyWith(
    //     chat: [...state.allChatList, chat],
    //   );
    // }
  }

  void loadMoreChats() async {
    if (state.currentPage > state.totalPages) {
      showToastMessage('No new chat to display');
      refreshController.loadComplete();
      return;
    }

    await getChatList(isLoadMore: true);
    refreshController.loadComplete();
  }



  Future<void> getChatList(String s, {bool isLoadMore = false}) async {
    state = state.copyWith(isLoading: !isLoadMore);
    if (isLoadMore && (state.currentPage * 10 == state.allChatList.length)) {
      state = state.copyWith(currentPage: state.currentPage + 1);
    } else {
      state = state.copyWith(currentPage: 1);
    }
    try {
      var (response, dioException) = await _networkApiService.postApiRequestWithToken(
          url: '${AppUrls.baseUrl}${AppUrls.chatList}',
          body: {
              "generalSearch": "string"
          }
      );
      state = state.copyWith(isLoading: false);

      if (response == null && dioException == null) {
        showConnectionWasInterruptedToastMessage();
      } else if (dioException != null) {
        showDioError(dioException);
      } else {
        ChatCreateModel ccModel = ChatCreateModel.fromJson(response.data);
        if (ccModel.status == 200) {
            state = state.copyWith(
              isLoading: false,
              allChatList: ccModel.chat,
              totalPages: ccModel.pages ?? state.totalPages,
            );

        } else {
          showToastMessage(ccModel.message.toString());
        }
      }
    } catch (error) {
      state = state.copyWith(isLoading: false);
      showConnectionWasInterruptedToastMessage();
    }
  }


}
