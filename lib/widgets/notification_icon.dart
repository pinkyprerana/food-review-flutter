import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/routes/app_router.dart';
import 'package:for_the_table/core/styles/app_colors.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AutoRouter.of(context).push(const NotificationRoute()),
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
