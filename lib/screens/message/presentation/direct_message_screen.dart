import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/utils/common_util.dart';
import '../../../core/constants/assets.dart';
import '../../../core/infrastructure/hive_database.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_text_styles.dart';
import '../application/fcm_service.dart';
import '../domain/fcm_model.dart';

@RoutePage()
class DirectMessageScreen extends ConsumerStatefulWidget {
  final String chatId;
  final String peopleId;
  const DirectMessageScreen({
    required this.chatId,
    required this.peopleId,
    super.key
  });

  @override
  ConsumerState<DirectMessageScreen> createState() => _DirectMessageScreenState();
}

class _DirectMessageScreenState extends ConsumerState<DirectMessageScreen> {
  final TextEditingController _messageController = TextEditingController();

  void _initializeChat() {
    final chatDoc = FirebaseFirestore.instance.collection('chats').doc(widget.chatId);

    chatDoc.get().then((doc) {
      if (!doc.exists) {
        chatDoc.set({
          'userIds': [AppPreferenceKeys.userId,widget.peopleId],
          'createdAt': FieldValue.serverTimestamp(),
          // Additional initial chat data here
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final FirebaseChatService chatService = FirebaseChatService();
    _initializeChat();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
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
                width: 50.w,
                height: 47.h,
                child: CachedNetworkImage(
                  imageUrl: Assets.avatar,
                  placeholder: (context, url) => const CircularProgressIndicator(color: AppColors.colorPrimary),
                  errorWidget: (context, url, error) => ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      Assets.profileImage,
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
                  'Chance Aminoff',
                  style: AppTextStyles.textStylePoppinsSemiBold.copyWith(
                    fontSize: 14.sp,
                    color: AppColors.colorText2,
                  ),
                ),
                Text(
                  'Typing...',
                  style: AppTextStyles.textStylePoppinsRegular.copyWith(
                    fontSize: 10.sp,
                    color: AppColors.colorText3,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<MessageModel>>(
              stream: chatService.getMessages(widget.chatId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator(color: AppColors.colorPrimary));
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('Initiate chat'));
                }
                final messages = snapshot.data!;
                return ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    bool isSender = message.senderId.isNotEmpty;
                    return ListTile(
                      title: Text(message.text,
                        style: TextStyle(color: isSender ? Colors.white : Colors.black, fontSize: 14.sp,),
                      ),
                      subtitle: Text(message.timestamp.toDate().toString()),
                      trailing: message.senderId == AppPreferenceKeys.userId ? Icon(Icons.person) : null,
                    );
                  },
                );
              },
            ),
          ),
          _buildMessageInput(),
        ],
      ),

      // body: Column(
      //   children: [
      //     Expanded(
      //       child: ListView.builder(
      //         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      //         itemCount: 10,
      //         itemBuilder: (context, index) {
      //           bool isSender = index % 2 == 0;
      //           return Column(
      //             crossAxisAlignment: isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      //             children: [
      //               Container(
      //                 constraints: BoxConstraints(
      //                   maxWidth: MediaQuery.of(context).size.width * 0.7,
      //                 ),
      //                 padding: const EdgeInsets.all(12.0),
      //                 margin: const EdgeInsets.symmetric(vertical: 4.0),
      //                 decoration: BoxDecoration(
      //                   color: isSender ? Colors.black : Colors.grey[200],
      //                   borderRadius: BorderRadius.only(
      //                     topLeft: const Radius.circular(16),
      //                     topRight: const Radius.circular(16),
      //                     bottomLeft: isSender ? const Radius.circular(16) : Radius.zero,
      //                     bottomRight: isSender ? Radius.zero : const Radius.circular(16),
      //                   ),
      //                 ),
      //                 child: Text(
      //                   'Lorem ipsum dolor sit amet consectetur. Ultrices lorem mauris mattis aliquet tristique risus. ',
      //                   style: TextStyle(
      //                     color: isSender ? Colors.white : Colors.black,
      //                     fontSize: 14.sp,
      //                   ),
      //                 ),
      //               ),
      //               Padding(
      //                 padding: const EdgeInsets.only(top: 4.0, left: 8.0, right: 8.0),
      //                 child: Text(
      //                   '3:15 PM',
      //                   style: AppTextStyles.textStylePoppinsRegular.copyWith(
      //                     fontSize: 10.sp,
      //                     color: AppColors.colorText3,
      //                   ),
      //                 ),
      //               ),
      //             ],
      //           );
      //         },
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      //       child: Container(
      //         height: 60,
      //         decoration: BoxDecoration(
      //             color: AppColors.colorWhite,
      //           borderRadius: BorderRadius.circular(10),
      //           border: Border.all(color: AppColors.colorGrey3)
      //         ),
      //         child: Row(
      //           children: [
      //             // Emoji Button
      //             IconButton(
      //               icon: Image.asset(Assets.addEmoji,
      //                 width: 20.r,
      //                 height: 20.r,
      //                 fit: BoxFit.cover,
      //               ),
      //               onPressed: () {
      //                 // TODO: Add emoji picker logic
      //               },
      //             ),
      //             // 8.horizontalSpace,
      //             // Message Input Field
      //             Expanded(
      //               child: TextField(
      //                 decoration: InputDecoration(
      //                   hintText: 'Enter Message',
      //                   hintStyle: AppTextStyles.textStylePoppinsRegular.copyWith(
      //                     color: AppColors.colorGrey3,
      //                   ),
      //                   contentPadding: const EdgeInsets.symmetric(
      //                     horizontal: 16,
      //                     vertical: 12,
      //                   ),
      //                   filled: true,
      //                   fillColor: AppColors.colorTransparent,
      //                   border: OutlineInputBorder(
      //                     borderRadius: BorderRadius.circular(25),
      //                     borderSide: BorderSide.none,
      //                   ),
      //                 ),
      //               ),
      //             ),
      //             8.horizontalSpace,
      //
      //             // Attachment Icon
      //             IconButton(
      //               icon: Image.asset(Assets.addAttachment,
      //                 width: 20.r,
      //                 height: 20.r,
      //                 fit: BoxFit.cover,
      //               ),
      //               onPressed: () {
      //                 // TODO: Handle attachment logic
      //               },
      //             ),
      //             8.horizontalSpace,
      //             // Send Button
      //             IconButton(
      //               icon: Image.asset(Assets.sendMessage,
      //                 width: 20.r,
      //                 height: 20.r,
      //                 fit: BoxFit.cover,
      //               ),
      //               onPressed: () {
      //                 // TODO: Send message logic
      //               },
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
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
                // TODO: Add emoji picker logic
              },
            ),
            // 8.horizontalSpace,
            // Message Input Field
            Expanded(
              child: TextField(
                controller: _messageController,
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
                // TODO: implement selecting attachments
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
                final message = MessageModel(
                  senderId: AppPreferenceKeys.userId,
                  text: _messageController.text,
                  timestamp: Timestamp.now(),
                  read: false,
                );
                FirebaseChatService().sendMessage(widget.chatId, message); //Todo: establish connection and send message
                _messageController.clear();
                dismissKeyboard(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
