import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';

class RecentActivityWidget extends StatelessWidget {
  const RecentActivityWidget(
      {super.key,
      required this.imgpath,
      required this.subtitle,
      required this.title});
  final String imgpath;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
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
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(imgpath),
                fit: BoxFit.cover,
              )),
        ),
        title: Text(
          title,
          style: AppTextStyles.textStylePoppinsMedium.copyWith(
            fontSize: 13.sp,
            color: AppColors.colorPrimary,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: AppTextStyles.textStylePoppinsRegular.copyWith(
            fontSize: 10.sp,
            color: AppColors.colorPrimaryAlpha,
          ),
        ),
      ),
    );
  }
}
