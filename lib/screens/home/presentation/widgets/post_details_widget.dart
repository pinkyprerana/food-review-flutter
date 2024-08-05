import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';

class PostDetails extends StatelessWidget {
  const PostDetails({
    super.key,
    required this.userName,
  });
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/temp/post-profile-img.png',
                    scale: 2,
                    width: 20.r,
                    height: 20.r,
                  ),
                  5.horizontalSpace,
                  Text(
                    userName,
                    style: AppTextStyles.textStylePoppinsMedium.copyWith(
                      color: AppColors.colorWhite,
                      fontSize: 16.sp,
                    ),
                  ),
                  8.horizontalSpace,
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 8)
                            .r,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: AppColors.colorWhite.withOpacity(0.3)),
                    child: Text(
                      'Unfollow',
                      style: AppTextStyles.textStylePoppinsRegular.copyWith(
                        color: AppColors.colorWhite,
                        fontSize: 10.sp,
                      ),
                    ),
                  )
                ],
              ),
              26.verticalSpace,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Starbucks LA, California',
                    style: AppTextStyles.textStylePoppinsMedium.copyWith(
                      color: AppColors.colorWhite,
                      fontSize: 13.sp,
                    ),
                  ),
                ],
              ),
              4.verticalSpace,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Double road, Lorem City, LA',
                    style: AppTextStyles.textStylePoppinsRegular.copyWith(
                      color: AppColors.colorWhite,
                      fontSize: 10.sp,
                    ),
                  ),
                ],
              ),
              10.verticalSpace,
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      for (int i = 0; i < 5; i++) ...[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 3.0),
                          child: Icon(
                            Icons.star_rate_rounded,
                            size: 11.r,
                            color: AppColors.colorGreen,
                          ),
                        )
                      ],
                      5.horizontalSpace,
                      Text(
                        '4.8',
                        style: AppTextStyles.textStylePoppinsRegular.copyWith(
                          color: AppColors.colorWhite,
                          fontSize: 10.sp,
                        ),
                      ),
                    ],
                  ),
                  16.horizontalSpace,
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 3.0),
                        child: Image.asset(Assets.dish),
                      ),
                      5.horizontalSpace,
                      Text(
                        '\$100 For 2',
                        style: AppTextStyles.textStylePoppinsRegular.copyWith(
                          color: AppColors.colorWhite,
                          fontSize: 10.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(Assets.like),
              12.verticalSpace,
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(Assets.comment),
                  Text(
                    '00',
                    style: AppTextStyles.textStylePoppinsRegular.copyWith(
                      color: AppColors.colorWhite,
                      fontSize: 10.sp,
                    ),
                  )
                ],
              ),
              12.verticalSpace,
              Image.asset(Assets.save),
            ],
          )
        ],
      ),
    );
  }
}