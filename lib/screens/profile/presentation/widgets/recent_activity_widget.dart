import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/app_urls.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:intl/intl.dart';

class RecentActivityWidget extends StatelessWidget {
  final String imgpath;
  final String title;
  final DateTime subtitle;

  const RecentActivityWidget({
    super.key,
    required this.imgpath,
    required this.subtitle,
    required this.title,
  });

  String get activityDateTime {
    DateTime now = DateTime.now();
    DateTime activityTime = DateTime.parse(subtitle.toString());

    bool isToday = now.year == activityTime.year &&
        now.month == activityTime.month &&
        now.day == activityTime.day;

    return isToday ? 'Today' : '';
  }

  @override
  Widget build(BuildContext context) {
    print('${AppUrls.profilePicLocation}/$imgpath');
    return Padding(
      padding: const EdgeInsets.only(top: 5.0).r,
      child: ListTile(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: AppColors.colorGrey, width: 1),
          borderRadius: BorderRadius.circular(15),
        ),
        leading: Container(
          width: 39.w,
          height: 39.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: imgpath.isEmpty
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    Assets.noProfileImage,
                    fit: BoxFit.cover,
                  ),
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: '${AppUrls.profilePicLocation}/$imgpath',
                    fit: BoxFit.cover,
                  ),
                ),
        ),
        title: Text(
          title,
          style: AppTextStyles.textStylePoppinsMedium.copyWith(
            fontSize: 13.sp,
            color: AppColors.colorPrimary,
          ),
        ),
        subtitle: Text(
          '${activityDateTime.isEmpty ? '' : activityDateTime} ${DateFormat('HH:mm a').format(subtitle)}',
          style: AppTextStyles.textStylePoppinsRegular.copyWith(
            fontSize: 10.sp,
            color: AppColors.colorPrimaryAlpha,
          ),
        ),
      ),
    );
  }
}
