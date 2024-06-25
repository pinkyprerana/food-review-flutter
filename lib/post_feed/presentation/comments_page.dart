import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/post_feed/presentation/widgets/comment_item.dart';
import 'package:for_the_table/post_feed/presentation/widgets/comments_icon.dart';
import 'package:for_the_table/widgets/app_button.dart';

@RoutePage()
class CommentsPage extends StatelessWidget {
  const CommentsPage({super.key, required this.amount});
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorCommentPageBg,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0).r,
          child: Column(
            children: [
              50.verticalSpace,
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
                            style: AppTextStyles.textStylePoppinsMedium
                                .copyWith(
                                    fontSize: 16.sp,
                                    color: AppColors.colorWhite),
                          ),
                          8.horizontalSpace,
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(70),
                              border: Border.all(
                                  width: 1, color: const Color(0xffDDDFE6)),
                              color: AppColors.colorWhite.withOpacity(0.10),
                            ),
                            child: Center(
                              child: Text(
                                'Following',
                                style: AppTextStyles.textStylePoppinsRegular
                                    .copyWith(
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
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      20.verticalSpace,
                      Image.asset(Assets.like),
                      15.verticalSpace,
                      const CommentsIcon(),
                      10.verticalSpace,
                      Image.asset(Assets.bookmark),
                    ],
                  )
                ],
              ),
              18.verticalSpace,
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
                        style: AppTextStyles.textStylePoppinsMedium.copyWith(
                          fontSize: 13.sp,
                          color: AppColors.colorWhite,
                        ),
                      ),
                      Text(
                        'Double road, Lorem City, LA',
                        style: AppTextStyles.textStylePoppinsRegular.copyWith(
                          fontSize: 10.sp,
                          color: AppColors.colorWhite,
                        ),
                      ),
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
                    '\$$amount For 2',
                    style: AppTextStyles.textStyleUbuntuRegular.copyWith(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Comments',
                    style: AppTextStyles.textStylePoppinsMedium.copyWith(
                      fontSize: 11.sp,
                      color: AppColors.colorWhite,
                    ),
                  ),
                  10.horizontalSpace,
                  Flexible(
                    child: Divider(
                      thickness: 1,
                      color: AppColors.colorWhite.withOpacity(0.10),
                    ),
                  ),
                ],
              ),
              18.verticalSpace,
              CommentItem(),
              20.verticalSpace,
              CommentItem(),
              20.verticalSpace,
              Container(
                width: double.infinity,
                //height: 192.h,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.colorPrimary.withOpacity(0.90),
                        AppColors.colorPrimary.withOpacity(0.70),
                      ]),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 1,
                    color: AppColors.colorCommentBoxBorder,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 130.h,
                        child: TextField(
                          style: AppTextStyles.textStylePoppinsRegular
                              .copyWith(color: AppColors.colorWhite),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Write a comment',
                              hintStyle: AppTextStyles.textStylePoppinsRegular
                                  .copyWith(
                                fontSize: 13.sp,
                                color: AppColors.colorWhite.withOpacity(0.70),
                              )),
                          maxLines: null,
                          expands: true,
                          keyboardType: TextInputType.multiline,
                        ),
                      ),
                      AppButton(
                        text: 'Submit',
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
