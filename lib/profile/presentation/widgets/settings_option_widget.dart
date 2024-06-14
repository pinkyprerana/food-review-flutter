import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';

class SettingsOptionWidget extends StatelessWidget {
  const SettingsOptionWidget({
    super.key,
    required this.title,
    required this.imgpath,
  });
  final String title;
  final String imgpath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0).r,
      child: ListTile(
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: AppColors.colorGrey, width: 1),
            borderRadius: BorderRadius.circular(15),
          ),
          leading: Container(
            padding: const EdgeInsets.all(10).r,
            decoration: BoxDecoration(
              color: AppColors.colorGrey,
              border: Border.all(color: AppColors.colorGrey, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image(
              image: AssetImage(imgpath),
              color: AppColors.colorPrimary,
            ),
          ),
          title: Text(
            title,
            style: AppTextStyles.textStylePoppinsMedium.copyWith(
              fontSize: 13.sp,
              color: AppColors.colorPrimary,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const VerticalDivider(
                color: AppColors.colorGrey,
                thickness: 1,
              ),
              5.horizontalSpace,
              const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.colorArrowIcon,
                size: 15.6,
                weight: 500,
              )
            ],
          )),
    );
  }
}
