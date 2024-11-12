import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/screens/message/domain/chat_user_list_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../core/constants/app_urls.dart';
import '../../../core/infrastructure/hive_database.dart';
import '../../../core/infrastructure/network_api_services.dart';
import '../../../core/utils/app_log.dart';
import '../../../core/utils/toast.dart';
import '../domain/chat_created_model.dart';
import '../domain/chat_model_firebase.dart';
import 'chat_state.dart';

class ChatNotifier extends StateNotifier<ChatState> {
  ChatNotifier( this._hiveDataBase, this._networkApiService) : super( const ChatState());

  final HiveDatabase _hiveDataBase;
  final NetworkApiService _networkApiService;
  final DatabaseReference _db = FirebaseDatabase.instance.ref();

  String? get getUserId => _hiveDataBase.box.get(AppPreferenceKeys.userId);
  String? get getChatToken => _hiveDataBase.box.get(AppPreferenceKeys.chatToken);
  TextEditingController searchController = TextEditingController();

  Future<void> sendOnceMessage(String peopleId, ChatModel message) async {
    try {

      var (response, dioException) = await _networkApiService
          .postApiRequestWithToken(url: '${AppUrls.baseUrl}${AppUrls.chatTokenGenerate}', body: {
        "user_id": peopleId
      });
      state = state.copyWith(isLoading: false);

      if (response == null && dioException == null) {
        showConnectionWasInterruptedToastMessage();
        return;
      } else if (dioException != null) {
        showDioError(dioException);
        return;
      }

      ChatCreatedModel chatCreatedModel = ChatCreatedModel.fromJson(response.data);
      String? chatToken = chatCreatedModel.dataOfChat?.chatToken;

      if (chatToken == null) {
        AppLog.log('Chat token not found in response');
        return;
      }

      Map<String, dynamic> messageData = message.toJson();
      messageData['senderID'] = getUserId;
      messageData['receiverID'] = peopleId;

      final chatRef = _db.child('chat_dev/$chatToken').push();
      await chatRef.set(messageData);

      final databaseRef = FirebaseDatabase.instance.ref().child('chat_dev/$chatToken');
      await databaseRef.update({
        'lastMessage': message.message,
        'lastMessageTimestamp': ServerValue.timestamp,
        'lastAttachment': message.chatAttachment,
        'lastReaction': message.reaction,
        'read': false,
        'senderID': getUserId,
        'receiverID': peopleId,
      });

      AppLog.log('Message sent successfully!');
    } catch (e) {
      AppLog.log('Error sending message: $e');
      showToastMessage('Error sending message: $e');
    }
  }

  Stream<List<ChatModel>> getMessages(String peopleId, String chatToken) {
    final chatRef = _db.child('chat_dev/$chatToken');

    return chatRef.onValue.map((event) {
      final data = event.snapshot.value;

      AppLog.log('Data received: $data');

      if (data == null) {
        AppLog.log('No data available for this chat');
        return [];
      }

      if (data is! Map) {
        AppLog.log('Error: Data is not a map');
        return [];
      }

      try {
        final mapData = Map<String, dynamic>.from(data);

        final messages = mapData.entries
            .where((entry) => entry.value is Map)
            .map((entry) {
          final messageData = Map<String, dynamic>.from(entry.value as Map);
          return ChatModel.fromJson(messageData);
        })
            .toList();

        messages.sort((a, b) => a.createdAt.compareTo(b.createdAt));
        return messages;
      } catch (e) {
        AppLog.log('Error retrieving messages: $e');
        return [];
      }
    });
  }

  void selectChat(String chat) {
    state = state.copyWith(selectedChat: chat);
  }

  final RefreshController refreshController = RefreshController();

  void addChat(ChatCreatedModel chat) {
    if (mounted) {
      state = state.copyWith(
        // chat: [...state.allChatList, chat],
      );
    }
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


  Future<void> getChatList({bool isLoadMore = false, bool isSearch = false}) async {

    state = state.copyWith(isLoading: !isLoadMore && !isSearch);

    if (isLoadMore && (state.currentPage * 10 == state.allChatList.length)) {
      state = state.copyWith(currentPage: state.currentPage + 1);
    } else {
      state = state.copyWith(currentPage: 1);
    }

    try {
      var (response, dioException) = await _networkApiService.postApiRequestWithToken(
          url: '${AppUrls.baseUrl}${AppUrls.chatList}',
          body: {
            "generalSearch": searchController.text
          }
      );

      state = state.copyWith(isLoading: false);

      if (response == null && dioException == null) {
        showConnectionWasInterruptedToastMessage();
      } else if (dioException != null) {
        showDioError(dioException);
      } else {
        ChatUserListModel ccModel = ChatUserListModel.fromJson(response.data);

        if (ccModel.status == 200) {
          List<DataOfChatList> chatListData = ccModel.allChatList ?? [];

          state = state.copyWith(
            isLoading: false,
            allChatList: chatListData,
          );
        } else {
          showToastMessage(ccModel.message ?? 'An error occurred');
        }
      }
    } catch (error) {
      state = state.copyWith(isLoading: false);
      showConnectionWasInterruptedToastMessage();
    }
  }


  void searchChat() async {
    await getChatList(isSearch: true);
  }

  Future<void> initiateChatWithPeopleId(String peopleId) async {
    if (peopleId == getUserId) {
      showToastMessage("Can't chat with yourself!");
      return;
    }
    var (response, dioException) = await _networkApiService
        .postApiRequestWithToken(url: '${AppUrls.baseUrl}${AppUrls.chatTokenGenerate}', body: {
      "user_id": peopleId
    });
    state = state.copyWith(isLoading: false);

    if (response == null && dioException == null) {
      showConnectionWasInterruptedToastMessage();
    } else if (dioException != null) {
      showDioError(dioException);
    } else {

      ChatCreatedModel chatCreatedModel = ChatCreatedModel.fromJson(response.data);
      String? chatToken = chatCreatedModel.dataOfChat?.chatToken;
      _hiveDataBase.box.put(AppPreferenceKeys.chatToken, chatToken ?? '');
      AppLog.log("token : $getChatToken ");
      if (chatToken == null) {
        AppLog.log('Chat token not found in response');
        return;
      }

      getMessages(peopleId, chatToken);
      AppLog.log("Successfully started chatting");
    }
  }

}
