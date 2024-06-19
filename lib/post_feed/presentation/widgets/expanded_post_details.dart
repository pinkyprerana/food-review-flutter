import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';

class ExpandedPostDetails extends StatelessWidget {
  const ExpandedPostDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 20.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(
                                Assets.follow1,
                              ),
                              fit: BoxFit.cover,
                            )),
                      ),
                      8.horizontalSpace,
                      Text(
                        'Ahmad Gouse',
                        style: AppTextStyles.textStylePoppinsMedium.copyWith(
                            fontSize: 16.sp, color: AppColors.colorWhite),
                      ),
                      8.horizontalSpace,
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(70),
                          border: Border.all(
                              width: 1, color: const Color(0xffDDDFE6)),
                          color: AppColors.colorWhite.withOpacity(0.20),
                        ),
                        child: Center(
                          child: Text(
                            'Following',
                            style:
                                AppTextStyles.textStylePoppinsRegular.copyWith(
                              color: AppColors.colorWhite,
                              fontSize: 10.sp,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  20.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        Assets.location2,
                      ),
                      8.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Starbucks LA, California',
                            style:
                                AppTextStyles.textStylePoppinsMedium.copyWith(
                              fontSize: 13.sp,
                              color: AppColors.colorWhite,
                            ),
                          ),
                          Text(
                            'Double road, Lorem City, LA',
                            style:
                                AppTextStyles.textStylePoppinsRegular.copyWith(
                              fontSize: 10.sp,
                              color: AppColors.colorWhite,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Image.asset(Assets.like),
                  15.verticalSpace,
                  Column(
                    children: [
                      Image.asset(Assets.comments),
                      Text(
                        '00',
                        style: AppTextStyles.textStylePoppinsRegular.copyWith(
                          color: AppColors.colorWhite,
                          fontSize: 10.sp,
                        ),
                      )
                    ],
                  ),
                  10.verticalSpace,
                  Image.asset(Assets.bookmark),
                ],
              )
            ],
          ),
          10.verticalSpace,
          Row(
            children: [
              Image.asset(Assets.star),
              2.horizontalSpace,
              Image.asset(Assets.star),
              2.horizontalSpace,
              Image.asset(Assets.star),
              2.horizontalSpace,
              Image.asset(Assets.star),
              2.horizontalSpace,
              Image.asset(Assets.star),
              5.horizontalSpace,
              Text(
                '4.8',
                style: AppTextStyles.textStylePoppinsRegular.copyWith(
                  fontSize: 10.sp,
                  color: AppColors.colorWhite,
                ),
              ),
              15.horizontalSpace,
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Image.asset(Assets.price),
              ),
              8.horizontalSpace,
              Text(
                '\$100 For 2',
                style: AppTextStyles.textStylePoppinsRegular.copyWith(
                  fontSize: 10.sp,
                  color: AppColors.colorWhite,
                ),
              )
            ],
          ),
          20.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'A memorable evening to be remembered.',
                style: AppTextStyles.textStylePoppinsMedium.copyWith(
                  fontSize: 13.sp,
                  color: AppColors.colorWhite,
                ),
              ),
            ],
          ),
          15.verticalSpace,
          Text(
            'Lorem ipsum dolor sit amet consectetur. Dui eget feugiat lacus turpis proin tellus mauris consectetur. Adipiscing enim scelerisque ultrices tincidunt. Orci duis euismod ullamcorper adipiscing. Mattis vitae ut in turpis hendrerit tincidunt posuere. Et lorem quis vel scelerisque nec. Et nunc facilisis faucibus mattis a sit mi donec commodo. ',
            style: AppTextStyles.textStylePoppinsRegular.copyWith(
              fontSize: 10.sp,
              color: AppColors.colorWhite,
            ),
          )
        ],
      ),
    );
  }
}
