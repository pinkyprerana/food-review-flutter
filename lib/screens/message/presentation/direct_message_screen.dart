import 'dart:async';
import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/utils/common_util.dart';
import 'package:for_the_table/screens/message/shared/providers.dart';
import 'package:for_the_table/screens/profile/shared/providers.dart';
import 'package:intl/intl.dart';
import '../../../core/constants/app_urls.dart';
import '../../../core/constants/assets.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_text_styles.dart';
import '../../../core/utils/app_log.dart';
import '../../people_profile/domain/other_people_profile_model.dart';
import '../../people_profile/shared/providers.dart';
import '../../restaurant/presentation/widgets/video_widget.dart';
import '../domain/chat_model_firebase.dart';

@RoutePage()
class DirectMessageScreen extends ConsumerStatefulWidget {
  final String peopleId;
  const DirectMessageScreen({
    required this.peopleId,
    super.key
  });

  @override
  ConsumerState<DirectMessageScreen> createState() => _DirectMessageScreenState();
}

class _DirectMessageScreenState extends ConsumerState<DirectMessageScreen> {
  final TextEditingController _messageController = TextEditingController();
  DataOfOtherPeople? getDetails;
  StreamSubscription<List<ChatModel>>? _messageSubscription;
  final ScrollController _scrollController = ScrollController();
  bool _isEmojiVisible = false;
  // bool _isTyping = false;

  void _toggleEmojiPicker() {
    setState(() {
      _isEmojiVisible = !_isEmojiVisible;
    });
  }


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final stateNotifier = ref.read(chatNotifierProvider.notifier);
      final chatToken = stateNotifier.getChatToken;
      stateNotifier.initiateChatWithPeopleId(widget.peopleId);
      stateNotifier.getMessages(widget.peopleId, chatToken!);
      _messageSubscription = stateNotifier.getMessages(widget.peopleId, chatToken)
          .listen((messages) {
      });
      final followNotifier = ref.read(followNotifierProvider.notifier);
      await followNotifier.getOtherPeopleDetails(() {}, widget.peopleId);
      final profileNotifier = ref.read(profileNotifierProvider.notifier);
      await profileNotifier.getUserDetails();
      _scrollToBottom();
    });
  }

  @override
  void dispose() {
    _messageSubscription?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final state = ref.watch(chatNotifierProvider);
    final stateNotifier = ref.watch(chatNotifierProvider.notifier);
    final followNotifier = ref.watch(followNotifierProvider.notifier);
    final profileState = ref.watch(profileNotifierProvider);
    final userId = followNotifier.getUserId;
    bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    String formattedTimestamp(int timestamp) {
      try {
        DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
        return DateFormat('hh:mm a').format(dateTime);
      } catch (e) {
        return "Invalid time";
      }
    }

    getDetails = followNotifier.getUserById(widget.peopleId);
    String peopleName = getDetails?.fullName ?? '';
    final peopleImage = '${AppUrls.profilePicLocation}/${getDetails?.profileImage ?? ''}';

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        setState(() => _isEmojiVisible = false);
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: false,
          automaticallyImplyLeading: false,
          leading: GestureDetector(
            onTap: () {
              _messageController.clear();
              stateNotifier.deleteChatToken();
              Navigator.pop(context);
              },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 10, left: 20, right: 0, bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.colorPrimary.withOpacity(0.20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_back_ios, color: AppColors.colorPrimary, size: 15.h),
                ],
              ),
            ),
          ),
          title: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: SizedBox(
                  width: 45.w,
                  height: 43.h,
                  child: CachedNetworkImage(
                    imageUrl: peopleImage,
                    placeholder: (context, url) => const CircularProgressIndicator(color: AppColors.colorPrimary),
                    errorWidget: (context, url, error) => ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        Assets.avatar,
                        fit: BoxFit.cover,
                      ),
                    ),
                    imageBuilder: (context, imageProvider) => Container(
                      width: 50.w,
                      height: 47.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              8.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    peopleName,
                    style: AppTextStyles.textStylePoppinsSemiBold.copyWith(
                      fontSize: 14.sp,
                      color: AppColors.colorText2,
                    ),
                  ),
                  // if (_isTyping)
                  //   Text(
                  //     'Typing...',
                  //     style: TextStyle(fontSize: 10.sp, color: AppColors.colorText3),
                  //   ),
                ],
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: StreamBuilder<List<ChatModel>>(
                stream: stateNotifier.getMessages(widget.peopleId, stateNotifier.getChatToken ?? ''),
                builder: (context, snapshot) {
                  // if (snapshot.connectionState == ConnectionState.waiting) {
                  //   return const Center(child: CircularProgressIndicator(color: AppColors.colorPrimary));
                  // }
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                             "Initiate chat",
                              style: AppTextStyles.textStylePoppinsRegular.copyWith(
                                fontSize: 10.sp,
                                color: AppColors.colorText3,
                              ),
                            ),
                            5.verticalSpace,
                            Image.asset(Assets.initiateChat,
                              height: 40,
                              width: 50,
                            ),
                          ],
                        )
                    );
                  }
                  final messages = snapshot.data!;

                  return ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      AppLog.log("attachment received : ${message.chatAttachment}");
                      bool isSent = message.senderID == userId;

                      return Column(
                        children: [
                          //Todo: Show Today, Yesterday, Nov 11, 2024
                          // Text(
                          //   formattedChatDatestamp(message.createdAt),
                          //   style: AppTextStyles.textStylePoppinsRegular.copyWith(
                          //     fontSize: 10.sp,
                          //     color: AppColors.colorText3,
                          //   ),
                          // ),
                          if (message.message != null && message.message!.isNotEmpty)
                            Row(
                            mainAxisAlignment: isSent ? MainAxisAlignment.end : MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              isSent
                                  ? const SizedBox()
                                  : ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: SizedBox(
                                  width: 20.w,
                                  height: 18.h,
                                  child: CachedNetworkImage(
                                    imageUrl: peopleImage,
                                    placeholder: (context, url) => const CircularProgressIndicator(color: AppColors.colorPrimary),
                                    errorWidget: (context, url, error) => ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        Assets.avatar,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    imageBuilder: (context, imageProvider) => Container(
                                      width: 50.w,
                                      height: 47.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              isSent ? 0.horizontalSpace : 5.horizontalSpace,
                              Column(
                                crossAxisAlignment: isSent ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    constraints: BoxConstraints(
                                      maxWidth: MediaQuery.of(context).size.width * 0.7,
                                    ),
                                    padding: const EdgeInsets.all(12.0),
                                    margin: const EdgeInsets.symmetric(vertical: 4.0),
                                    decoration: BoxDecoration(
                                      color: isSent ? AppColors.colorGrey2 : AppColors.colorPrimary,
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(16),
                                        topRight: Radius.circular(16),
                                        bottomLeft: Radius.circular(16),
                                        bottomRight: Radius.circular(16),
                                      ),
                                    ),
                                    child: Text(
                                      message.message ?? '',
                                      style: TextStyle(
                                        color: isSent ? Colors.black : Colors.white,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4.0, left: 8.0, right: 8.0),
                                    child: Text(
                                      formattedTimestamp(message.createdAt),
                                      style: AppTextStyles.textStylePoppinsRegular.copyWith(
                                        fontSize: 10.sp,
                                        color: AppColors.colorText3,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              isSent ? 5.horizontalSpace : 0.horizontalSpace,
                              isSent
                              ? ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: SizedBox(
                                  width: 20.w,
                                  height: 18.h,
                                  child: CachedNetworkImage(
                                    imageUrl: profileState.profileImgPath,
                                    placeholder: (context, url) => const CircularProgressIndicator(color: AppColors.colorPrimary),
                                    errorWidget: (context, url, error) => ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        Assets.avatar,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    imageBuilder: (context, imageProvider) => Container(
                                      width: 50.w,
                                      height: 47.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              : const SizedBox(),
                            ],
                          ),

                          if (message.chatAttachment.isNotEmpty)
                            Column(
                              crossAxisAlignment: isSent ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                              children: [
                                isSent
                                    ? const SizedBox()
                                    : ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: SizedBox(
                                    width: 20.w,
                                    height: 18.h,
                                    child: CachedNetworkImage(
                                      imageUrl: peopleImage,
                                      placeholder: (context, url) => const CircularProgressIndicator(color: AppColors.colorPrimary),
                                      errorWidget: (context, url, error) => ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          Assets.avatar,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      imageBuilder: (context, imageProvider) => Container(
                                        width: 50.w,
                                        height: 47.h,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                isSent ? 0.horizontalSpace : 5.horizontalSpace,
                                Row(
                                  mainAxisAlignment: isSent ? MainAxisAlignment.end : MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: CachedNetworkImage(
                                        imageUrl: message.chatAttachment,
                                        placeholder: (context, url) => const Center(child: CircularProgressIndicator(color: AppColors.colorPrimary,)),
                                        errorWidget: (context, url, error) => const Icon(Icons.error),
                                      ),
                                    ),
                                    isSent ? 5.horizontalSpace : 0.horizontalSpace,
                                    isSent
                                        ? ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: SizedBox(
                                        width: 20.w,
                                        height: 18.h,
                                        child: CachedNetworkImage(
                                          imageUrl: profileState.profileImgPath,
                                          placeholder: (context, url) => const CircularProgressIndicator(color: AppColors.colorPrimary),
                                          errorWidget: (context, url, error) => ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: Image.asset(
                                              Assets.avatar,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          imageBuilder: (context, imageProvider) => Container(
                                            width: 50.w,
                                            height: 47.h,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(50),
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                        : const SizedBox(),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4.0, left: 8.0, right: 8.0),
                                  child: Text(
                                    formattedTimestamp(message.createdAt),
                                    style: AppTextStyles.textStylePoppinsRegular.copyWith(
                                      fontSize: 10.sp,
                                      color: AppColors.colorText3,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
            if (_isEmojiVisible)
              SizedBox(
                height: 250,
                child: EmojiPicker(
                  onEmojiSelected: (category, emoji) {
                    _messageController.text += emoji.emoji;
                  },
                ),
              ),
            _buildMessageInput(userId!),
            isSmallScreen ? 10.verticalSpace: 0.verticalSpace
          ],
        ),
      ),
    );
  }
  Widget _buildMessageInput(userId) {
    final stateNotifier = ref.watch(chatNotifierProvider.notifier);
    final state = ref.watch(chatNotifierProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        children: [
          if (stateNotifier.image != null)
            SizedBox(
                width: state.imageOrVideo == null ? 0:100,
                height: state.imageOrVideo == null ? 0:100,
                child: state.imageOrVideo == null
                    ? const SizedBox()
                    : state.isVideo
                    ? VideoWidget(file: File(state.imageOrVideo!.path))
                    : Image.file(File(state.imageOrVideo!.path))
            ),
          Container(
            height: 60,
            decoration: BoxDecoration(
                color: AppColors.colorWhite,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.colorGrey3)
            ),
            child: Row(
              children: [
                // Emoji Button
                IconButton(
                  icon: Image.asset(Assets.addEmoji,
                    width: 20.r,
                    height: 20.r,
                    fit: BoxFit.cover,
                  ),
                  onPressed: () {
                    _toggleEmojiPicker();
                  },
                ),
                // 8.horizontalSpace,
                // Message Input Field
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    // onChanged: (text) {
                    //   setState(() => _isTyping = text.isNotEmpty);
                    // },
                    decoration: InputDecoration(
                      hintText: 'Enter Message',
                      hintStyle: AppTextStyles.textStylePoppinsRegular.copyWith(
                        color: AppColors.colorGrey3,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      filled: true,
                      fillColor: AppColors.colorTransparent,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),

                8.horizontalSpace,

                // Attachment Icon
                IconButton(
                  icon: Image.asset(Assets.addAttachment,
                    width: 20.r,
                    height: 20.r,
                    fit: BoxFit.cover,
                  ),
                  onPressed: () {
                    stateNotifier.checkPermissionForGallery(context);
                  },
                ),
                8.horizontalSpace,
                // Send Button
                IconButton(
                  icon: Image.asset(Assets.sendMessage,
                    width: 20.r,
                    height: 20.r,
                    fit: BoxFit.cover,
                  ),
                  onPressed: () {
                    if(_messageController.text.isNotEmpty || stateNotifier.image!.path.isNotEmpty)
                    {
                      final chatModel = ChatModel(
                        chatAttachment: stateNotifier.image?.path ?? '',
                        createdAt: Timestamp.now().millisecondsSinceEpoch,
                        message: _messageController.text.isNotEmpty ? _messageController.text : null,
                        reaction: '',
                        read: false,
                        receiverID: widget.peopleId,
                        senderID: userId,
                        replyTo: null,
                      );
                      stateNotifier.sendOnceMessage(widget.peopleId, chatModel);
                    }
                    AppLog.log("Picked image path: ${stateNotifier.image?.path}");

                    _messageController.clear();
                    stateNotifier.clearImage();
                    setState(() {
                      // _isTyping = false;
                      _isEmojiVisible = false;
                    });
                    _scrollToBottom();
                    dismissKeyboard(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }



}
