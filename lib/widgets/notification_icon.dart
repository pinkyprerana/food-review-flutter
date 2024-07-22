import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/routes/app_router.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import '../model/notification_model/notification_model.dart';

class NotificationIcon extends StatelessWidget {
  final List<NotificationData> todayNotifications;
  final List<NotificationData> yesterdayNotifications;
  final List<NotificationData> olderNotifications;
  const NotificationIcon({
    required this.todayNotifications,
    required this.yesterdayNotifications,
    required this.olderNotifications,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AutoRouter.of(context).push( NotificationRoute(
          todayNotifications: todayNotifications,
          yesterdayNotifications: yesterdayNotifications,
          olderNotifications: olderNotifications)),
      child: Container(
        height: 26.r,
        width: 26.r,
        margin: const EdgeInsets.only(right: 16).r,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.colorGrey2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
            child: Image.asset(
          Assets.bell,
          color: AppColors.colorPrimary,
        )),
      ),
    );
  }
}
