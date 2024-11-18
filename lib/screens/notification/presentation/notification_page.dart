import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/screens/notification/presentation/widgets/notification_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../core/constants/app_urls.dart';
import '../../../core/routes/app_router.dart';
import '../../../model/notification_model/notification_model.dart';
import '../shared/providers.dart';

@RoutePage()
class NotificationPage extends ConsumerStatefulWidget {
  const NotificationPage({
    super.key,
  });

  @override
  ConsumerState<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends ConsumerState<NotificationPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final notificationNotifier = ref.read(notificationNotifierProvider.notifier);
      await notificationNotifier.getNotificationList();
    });
  }

  _handleNotificationTap(BuildContext context, NotificationData notifications) {
    final notificationType = notifications.type;
    switch (notificationType) {
      case 'user_accept':
      case 'user_deny':
      case 'user_follow':
      case 'user_unfollow':
         AutoRouter.of(context).push(PeopleProfileRoute(peopleId: notifications.postedUserInfo?.id ?? ""));
        break;
      case 'post_like':
      case 'post_dislike':
      case 'post_save':
      case 'comment_like':
      case 'comment_add':
       AutoRouter.of(context).push(PostDetailsRoute(postId: notifications.refPostId?? "", userId: notifications.receiverUserInfo?.id??""));
        break;
      case 'chat':
            AutoRouter.of(context).push(DirectMessageRoute(peopleId: notifications.postedUserInfo?.id??""));
        break;
      default:
        break;
    }
  }


  @override
  Widget build(BuildContext context) {
    final notificationState = ref.watch(notificationNotifierProvider);
    final notificationNotifier = ref.watch(notificationNotifierProvider.notifier);
    final todayNotifications = notificationState.todayNotifications;
    final yesterdayNotifications = notificationState.yesterdayNotifications;
    final olderNotifications = notificationState.olderNotifications;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
                5.horizontalSpace,
                Icon(Icons.arrow_back_ios, color: AppColors.colorPrimary, size: 15.h),
              ],
            ),
          ),
        ),
        title: Text(
          'Notification',
          style: AppTextStyles.textStylePoppinsBold.copyWith(
            color: AppColors.colorPrimary,
            fontSize: 16.sp,
          ),
        ),
      ),
      body: notificationState.isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColors.colorPrimary,
              ),
            )
          : todayNotifications.isNotEmpty ||
                  yesterdayNotifications.isNotEmpty ||
                  olderNotifications.isNotEmpty
              ? SmartRefresher(
                controller: notificationNotifier.refreshController,
                enablePullDown: false,
                enablePullUp: true,
                onLoading: notificationNotifier.loadMoreNotifications,
                footer: CustomFooter(
                  builder: (BuildContext context, mode) {
                    Widget body;
                    if (mode == LoadStatus.idle) {
                      body = const SizedBox.shrink();
                    } else if (mode == LoadStatus.loading) {
                      body = const CupertinoActivityIndicator();
                    } else if (mode == LoadStatus.failed) {
                      body = Text(
                        "Load Failed!Click retry!",
                        style: AppTextStyles.textStylePoppinsLight,
                      );
                    } else if (mode == LoadStatus.canLoading) {
                      body = Text(
                        "release to load more",
                        style: AppTextStyles.textStylePoppinsLight,
                      );
                    } else {
                      body = Text(
                        "No more Data",
                        style: AppTextStyles.textStylePoppinsLight,
                      );
                    }
                    return SizedBox(
                      height: 55.0,
                      child: Center(child: body),
                    );
                  },
                ),
                child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 1).r,
                      child: Column(
                        children: [
                          // Today's Notifications
                          if (todayNotifications.isNotEmpty) ...[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Today',
                                  style: AppTextStyles.textStylePoppinsRegular.copyWith(
                                    fontSize: 10.sp,
                                    color: AppColors.colorPrimaryAlpha,
                                  ),
                                ),
                              ],
                            ),
                            ListView.builder(
                              padding: const EdgeInsets.all(0.0),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: todayNotifications.length,
                              itemBuilder: (context, index) {
                                final notifications = todayNotifications[index];
                                final imgUrl =
                                    '${AppUrls.profilePicLocation}/${notifications.postedUserInfo?.profileImage}';
                                return NotificationWidget(
                                  imgpath: imgUrl,
                                  title: notifications.title??"",
                                  subtitle: notifications.message??"",
                                  onTap: () => _handleNotificationTap(context, notifications),
                                );
                              },
                            ),
                            10.verticalSpace,
                          ],
                          // Yesterday's Notifications
                          if (yesterdayNotifications.isNotEmpty) ...[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Yesterday',
                                  style: AppTextStyles.textStylePoppinsRegular.copyWith(
                                    fontSize: 10.sp,
                                    color: AppColors.colorPrimaryAlpha,
                                  ),
                                ),
                              ],
                            ),
                            ListView.builder(
                              padding: const EdgeInsets.all(0.0),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: yesterdayNotifications.length,
                              itemBuilder: (context, index) {
                                final notifications = yesterdayNotifications[index];
                                final imgUrl =
                                    '${AppUrls.profilePicLocation}/${notifications.postedUserInfo?.profileImage}';
                                return NotificationWidget(
                                  imgpath: imgUrl,
                                  title: notifications.title??"",
                                  subtitle: notifications.message??"",
                                  onTap: () => _handleNotificationTap(context, notifications),
                                );
                              },
                            ),
                            10.verticalSpace,
                          ],
                          // Older Notifications
                          if (olderNotifications.isNotEmpty) ...[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Earlier',
                                  style: AppTextStyles.textStylePoppinsRegular.copyWith(
                                    fontSize: 10.sp,
                                    color: AppColors.colorPrimaryAlpha,
                                  ),
                                ),
                              ],
                            ),
                            ListView.builder(
                              padding: const EdgeInsets.all(0.0),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: olderNotifications.length,
                              itemBuilder: (context, index) {
                                final notifications = olderNotifications[index];
                                final imgUrl =
                                    '${AppUrls.profilePicLocation}/${notifications.postedUserInfo?.profileImage}';
                                return NotificationWidget(
                                  imgpath: imgUrl,
                                  title: notifications.title??"",
                                  subtitle: notifications.message??"",
                                  onTap: () => _handleNotificationTap(context, notifications),
                                );
                              },
                            ),
                            10.verticalSpace,
                          ],
                        ],
                      ),
                    ),
                  ),
              )
              : Center(
                  child: Text(
                    'No notification.',
                    style: AppTextStyles.textStylePoppins,
                  ),
                ),
    );
  }
}
