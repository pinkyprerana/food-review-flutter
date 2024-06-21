import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/post_feed/presentation/widgets/comments_icon.dart';

class NotEpandedPostDetails extends StatelessWidget {
  const NotEpandedPostDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: BackdropFilter(
        blendMode: BlendMode.srcIn,
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          padding:
              const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10).r,
          width: double.infinity,
          //height: 170.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xff0A0A0A).withOpacity(0.1),
                const Color(0xff000000).withOpacity(0)
              ],
            ),
          ),
          child: Column(
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
                    style: AppTextStyles.textStylePoppinsMedium
                        .copyWith(fontSize: 16.sp, color: AppColors.colorWhite),
                  ),
                  8.horizontalSpace,
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(70),
                      color: AppColors.colorWhite.withOpacity(0.20),
                    ),
                    child: Center(
                      child: Text(
                        'Following',
                        style: AppTextStyles.textStylePoppinsRegular.copyWith(
                          color: AppColors.colorWhite,
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              // 15.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      15.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(70),
                              color: AppColors.colorGreen,
                            ),
                            child: Center(
                              child: Text(
                                'Chinese Cuisine',
                                style: AppTextStyles.textStylePoppinsRegular
                                    .copyWith(
                                  color: AppColors.colorWhite,
                                  fontSize: 10.sp,
                                ),
                              ),
                            ),
                          ),
                          8.horizontalSpace,
                          // Image.asset(Assets.dislike_emoji),
                          5.horizontalSpace,
                          // Text(
                          //   'Didn\'t Like',
                          //   style:
                          //       AppTextStyles.textStylePoppinsRegular.copyWith(
                          //     fontSize: 10.sp,
                          //     color: AppColors.colorWhite,
                          //   ),
                          // )
                        ],
                      ),
                      8.verticalSpace,
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
                                style: AppTextStyles.textStylePoppinsMedium
                                    .copyWith(
                                  fontSize: 13.sp,
                                  color: AppColors.colorWhite,
                                ),
                              ),
                              Text(
                                'Double road, Lorem City, LA',
                                style: AppTextStyles.textStylePoppinsRegular
                                    .copyWith(
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
                      const CommentsIcon(),
                      10.verticalSpace,
                      Image.asset(Assets.bookmark),
                    ],
                  )
                ],
              ),

              15.verticalSpace,
              Text(
                'A memorable evening to be remembered.',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.textStylePoppinsMedium.copyWith(
                  fontSize: 13.sp,
                  color: AppColors.colorWhite,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
