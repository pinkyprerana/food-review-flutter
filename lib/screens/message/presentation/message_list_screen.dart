import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/widgets/custom_search_field.dart';
import 'package:intl/intl.dart';
import '../../../core/constants/app_urls.dart';
import '../../../core/constants/assets.dart';
import '../../../core/routes/app_router.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_text_styles.dart';
import '../../../core/utils/app_log.dart';
import '../shared/providers.dart';

@RoutePage()
class MessageListScreen extends ConsumerStatefulWidget {
  const MessageListScreen({super.key});

  @override
  ConsumerState<MessageListScreen> createState() => _MessageListScreenState();
}

class _MessageListScreenState extends ConsumerState<MessageListScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final stateNotifier = ref.read(chatNotifierProvider.notifier);
      await stateNotifier.getChatList();
    });
  }

  String formatDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);
    DateTime yesterday = today.subtract(const Duration(days: 1));

    if (dateTime.isAfter(today)) {
      return 'Today';
    } else if (dateTime.isAfter(yesterday)) {
      return 'Yesterday';
    } else {
      return DateFormat('MMM dd, yyyy').format(dateTime);
    }
  }


  @override
  Widget build(BuildContext context) {
    final state = ref.watch(chatNotifierProvider);
    final stateNotifier = ref.watch(chatNotifierProvider.notifier);
    AppLog.log("Chat list : ${state.allChatList}");

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          automaticallyImplyLeading: false,
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 10.h, left: 20.w, right: 0, bottom: 10.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.colorPrimary.withOpacity(0.20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  5.horizontalSpace,
                  Icon(Icons.arrow_back_ios, color: AppColors.colorPrimary, size: 15.h),
                ],
              ),
            ),
          ),
          title: Text(
            'Messages',
            style: AppTextStyles.textStylePoppinsBold.copyWith(
              color: AppColors.colorPrimary,
              fontSize: 16.sp,
            ),
          ),
        ),
        body: GestureDetector(
          onTap: FocusScope.of(context).unfocus,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                16.verticalSpace,
                 CustomSearchField(
                  controller: stateNotifier.searchController,
                   onChanged: (_) => stateNotifier.searchChat(),
                ),
                20.verticalSpace,
                Text(
                  'Message List',
                  style: AppTextStyles.textStylePoppinsMedium.copyWith(
                    color: AppColors.colorPrimary,
                    fontSize: 13.sp,
                  ),
                ),
                4.verticalSpace,
                Text(
                  state.allChatList.length.toString(),
                  style: AppTextStyles.textStylePoppinsRegular.copyWith(
                    color: AppColors.colorPrimaryAlpha,
                    fontSize: 10.sp,
                  ),
                ),
                10.verticalSpace,
                // Message List
                Expanded(
                  child: state.allChatList.isEmpty
                      ? Center(
                    child: Text(
                      'Chats will show here',
                      style: AppTextStyles.textStylePoppinsMedium.copyWith(
                        color: AppColors.colorPrimaryAlpha,
                        fontSize: 10.sp,
                      ),
                    ),
                  )
                      : ListView.builder(
                    itemCount: state.allChatList.length,
                    itemBuilder: (context, index) {

                      final chat = state.allChatList[index];
                      final user = chat.userDetails;
                      final peopleId = chat.userDetails?.id;
                      String formattedChatDate = formatDate(chat.chatDate.toString());
                      final profileImage = '${AppUrls.profilePicLocation}/${user?.profileImage ?? ''}';
                      AppLog.log("userId : ${user?.id}");
                      return GestureDetector(
                        onTap: () async {
                          await stateNotifier.initiateChatWithPeopleId(peopleId ?? '');
                          await AutoRouter.of(context).push(DirectMessageRoute(peopleId: peopleId ?? ''),);
                        },
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(vertical: 1.h),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: SizedBox(
                              width: 45.w,
                              height: 45.h,
                              child: CachedNetworkImage(
                                imageUrl: profileImage,
                                placeholder: (context, url) => const CircularProgressIndicator(color: AppColors.colorPrimary),
                                errorWidget: (context, url, error) => ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    Assets.avatar,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                imageBuilder: (context, imageProvider) => Container(
                                  width: 45.w,
                                  height: 45.h,
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
                          title: Text(
                            '${user?.firstName} ${user?.lastName}',
                            style: AppTextStyles.textStylePoppinsMedium.copyWith(
                              color: AppColors.colorPrimary,
                              fontSize: 13.sp,
                            ),
                            maxLines: 1,
                          ),
                          subtitle: Text(
                            chat.lastMessage?.message ?? '',
                            style: AppTextStyles.textStylePoppinsRegular.copyWith(
                              color: AppColors.colorPrimaryAlpha,
                              fontSize: 10.sp,
                            ),
                            maxLines: 1,
                          ),
                          trailing: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                formattedChatDate,
                                style: AppTextStyles.textStylePoppinsRegular.copyWith(
                                  fontSize: 10.sp,
                                  color: AppColors.colorText3,
                                ),
                              ),
                              4.verticalSpace,
                              (chat.lastMessage?.read == false && (chat.userUnreadCount ?? 0) > 0)
                                  ? Container(
                                width: 16.w,
                                height: 16.h,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black,
                                ),
                                child: Center(
                                  child: Text(
                                    chat.userUnreadCount.toString(),
                                    style: AppTextStyles.textStylePoppinsRegular.copyWith(
                                      color: AppColors.colorWhite,
                                      fontSize: 8.sp,
                                    ),
                                  ),
                                ),
                              )
                                  : const SizedBox(),

                            ],
                          ),
                          onTap: () async {
                            await stateNotifier.initiateChatWithPeopleId(peopleId ?? '');
                            await AutoRouter.of(context).push(DirectMessageRoute(peopleId: peopleId ?? ''));

                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
