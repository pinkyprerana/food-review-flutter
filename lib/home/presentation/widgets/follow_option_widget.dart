import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';

class FollowOptionWidget extends StatelessWidget {
  const FollowOptionWidget({
    super.key,
    required this.imgpath,
    // required this.joiningDate,
    required this.name,
  });
  final String imgpath;
  final String name;
  // final String joiningDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15).r,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30).r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 1, color: AppColors.colorGrey),
      ),
      child: Column(
        children: [
          2.verticalSpace,
          Container(
            width: 49.w,
            height: 49.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(imgpath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          10.verticalSpace,
          Text(
            name,
            style: AppTextStyles.textStylePoppinsMedium.copyWith(
              fontSize: 13.sp,
              color: AppColors.colorPrimary,
            ),
          ),
          3.verticalSpace,
          Text(
            'Joined May 23, 2024',
            style: AppTextStyles.textStylePoppinsLight.copyWith(
              fontSize: 8.sp,
              color: AppColors.colorPrimaryAlpha,
            ),
          ),
          15.verticalSpace,
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15).r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.colorNavy,
            ),
            child: Center(
              child: Text(
                'FOLLOW',
                style: AppTextStyles.textStylePoppinsBold.copyWith(
                  fontSize: 10.sp,
                  color: AppColors.colorWhite,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
