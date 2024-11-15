import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/screens/message/domain/chat_user_list_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../core/constants/app_urls.dart';
import '../../../core/infrastructure/hive_database.dart';
import '../../../core/infrastructure/network_api_services.dart';
import '../../../core/styles/app_text_styles.dart';
import '../../../core/utils/app_log.dart';
import '../../../core/utils/toast.dart';
import '../../../widgets/app_button.dart';
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

      if (message.chatAttachment.isNotEmpty) {
        File file = File(message.chatAttachment);
        String downloadUrl = await _uploadChatAttachment(file);
        messageData['chatAttachment'] = downloadUrl;
      }


      final chatRef = _db.child('chat_dev/$chatToken').push();
      await chatRef.set(messageData);

      final databaseRef = FirebaseDatabase.instance.ref().child('chat_dev/$chatToken');
      await databaseRef.update({
        // 'chatAttachment': message.chatAttachment,
        // 'createdAt': message.createdAt,
        // 'reaction': message.reaction,
        // 'message': message.message,
        // 'read': false,
        // 'senderID': getUserId,
        // 'receiverID': peopleId,
      });
      getChatList();
      AppLog.log('Message sent successfully!');
    } catch (e) {
      AppLog.log('Error sending message: $e');
      showToastMessage('Error sending message: $e');
    }
  }

  Future<String> _uploadChatAttachment(File attachment) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference storageRef = FirebaseStorage.instance.ref().child(fileName);

      TaskSnapshot snapshot = await storageRef.putFile(attachment);

      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      AppLog.log('Error uploading attachment: $e');
      throw Exception('Error uploading attachment');
    }
  }

  Stream<List<ChatModel>> getMessages(String peopleId, String chatToken) {
    if (chatToken.isEmpty) {
      initiateChatWithPeopleId(peopleId);
    }
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
        }).toList();

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
      markChatAsRead(peopleId);
      getChatList();
      AppLog.log("Successfully started chatting");
    }
  }

  final ImagePicker picker = ImagePicker();
  XFile? media;

  Future<void> checkPermissionForGallery(BuildContext context) async {
    PermissionStatus permission;

    if (Platform.isAndroid) {
      permission = await Permission.storage.request();
    } else {
      permission = await Permission.photos.request();
    }

    switch (permission) {
      case PermissionStatus.granted:
        if (!context.mounted) return;
        showOptionDialog(context);
        // pickImageOrVideo();
        break;
      case PermissionStatus.denied:
        final permissionAgain = await Permission.photos.request();
        if (permissionAgain == PermissionStatus.denied) {
          showToastMessage('Request Denied, please go to app settings to grant gallery permission');
          if (!context.mounted) return;
          _showPermissionDialog(context);
        } else if (permissionAgain == PermissionStatus.permanentlyDenied) {
          showToastMessage('Request Denied, please go to app settings to grant gallery permission');
          if (!context.mounted) return;
          _showPermissionDialog(context);
        } else if (permissionAgain == PermissionStatus.granted) {
          // pickImageOrVideo();
          if (!context.mounted) return;
          showOptionDialog(context);
        }
        break;
      case PermissionStatus.permanentlyDenied:
        final permissionAgain = await Permission.photos.request();
        if (permissionAgain == PermissionStatus.denied) {
          showToastMessage('Request Denied, please go to app settings to grant gallery permission');
          if (!context.mounted) return;
          _showPermissionDialog(context);
        } else if (permissionAgain == PermissionStatus.permanentlyDenied) {
          showToastMessage('Request Denied, please go to app settings to grant gallery permission');
          if (!context.mounted) return;
          _showPermissionDialog(context);
        } else if (permissionAgain == PermissionStatus.granted) {
          // pickImageOrVideo();
          if (!context.mounted) return;
          showOptionDialog(context);
        }
        break;
      case PermissionStatus.limited:
        break;
      case PermissionStatus.restricted:
        break;
      case PermissionStatus.provisional:
        break;
      default:
    }
  }

  void showOptionDialog(BuildContext context) {
    showDialog(
        context: (context),
        builder: (ctx) {
          return AlertDialog(
            title: Center(
                child: Text(
                  'Choose an option',
                  style: AppTextStyles.textStylePoppins.copyWith(fontSize: 17.sp),
                )),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppButton(
                  text: 'Pick Image',
                  onPressed: () {
                    pickImageOrVideo();
                    Navigator.pop(context);
                  },
                ),
                10.verticalSpace,
                AppButton(
                  text: 'Pick Video',
                  onPressed: () {
                    pickImageOrVideo(photo: false);
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          );
        });
  }


  XFile? pickedFile;
  Future<void> pickImageOrVideo({photo = true}) async {
    pickedFile = (photo)
        ? await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    )
        : await picker.pickVideo(
      source: ImageSource.gallery,
    );

    if (pickedFile == null) {
      return;
    }

    bool isVideo = !photo;
    state = state.copyWith(imageOrVideo: pickedFile, isVideo: isVideo);

    media = pickedFile;
  }


  void _showPermissionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Photos/Videos Permission Required'),
        content: const Text(
            'This app needs gallery permission to work properly. Please grant the permission in settings.'),
        actions: [
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              openAppSettings();
            },
            child: const Text('Open Settings'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  void clearImage() {
    state = state.copyWith(imageOrVideo: null);
    AppLog.log("Image path cleared.");
  }

  void deleteChatToken() {
    _hiveDataBase.box.delete(AppPreferenceKeys.chatToken);
    AppLog.log("Chat token deleted.");
  }

  void markChatAsRead(String peopleId) async {

      var (response, dioException) = await _networkApiService
          .postApiRequestWithToken(url: '${AppUrls.baseUrl}${AppUrls.chatTokenGenerate}', body: {
        "user_id": peopleId
      });
      state = state.copyWith(isLoading: false);
      ChatCreatedModel chatCreatedModel = ChatCreatedModel.fromJson(response.data);
      String? chatToken = chatCreatedModel.dataOfChat?.chatToken;

      final chatRef = _db.child('chat_dev/$chatToken');

      try {
        final snapshot = await chatRef.get();
        if (snapshot.value != null) {
          final messages = snapshot.value as Map<dynamic, dynamic>;

          // Iterate through each message and update the read status
          for (var entry in messages.entries) {
            final messageRef = chatRef.child(entry.key);
            await messageRef.update({'read': true});
          }
        }
        getChatList();
        AppLog.log("All messages marked as read.");
      } catch (e) {
        AppLog.log('Error marking messages as read: $e');
        showToastMessage('Error marking messages as read');
      }
    }




}
