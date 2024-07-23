import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';

class CommentItem extends StatelessWidget {
  final commentLength;
  const CommentItem({
    super.key,
    required this.commentLength
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 24.w,
                height: 24.h,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        Assets.follow1,
                      ),
                      fit: BoxFit.cover,
                    )),
              ),
              5.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Gretchen Baptista',
                    style: AppTextStyles.textStylePoppinsMedium.copyWith(
                      fontSize: 12.sp,
                      color: AppColors.colorWhite,
                    ),
                  ),
                  Text(
                    '9 Days ago',
                    style: AppTextStyles.textStylePoppinsRegular.copyWith(
                      fontSize: 10.sp,
                      color: AppColors.colorWhite.withOpacity(0.70),
                    ),
                  )
                ],
              )
            ],
          ),
          10.verticalSpace,
          Text(
            commentLength,
            // 'lorem ipsum dolor sit amet consectetur. Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
            style: AppTextStyles.textStylePoppinsRegular.copyWith(
              fontSize: 11.sp,
              color: AppColors.colorWhite.withOpacity(0.70),
            ),
          ),
          10.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(Assets.like),
            ],
          )
        ],
      ),
    );
  }
}
