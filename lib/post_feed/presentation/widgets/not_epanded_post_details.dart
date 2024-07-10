import 'dart:ui';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/routes/app_router.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import '../../../core/constants/app_urls.dart';
import '../../domain/postFeed_model.dart';

class NotEpandedPostDetails extends StatelessWidget {
  final DataOfPostModel postList;
  const NotEpandedPostDetails({super.key, required this.postList});

  @override
  Widget build(BuildContext context) {
    final String peopleId = postList.userInfo.id;
    final String name = postList.userInfo.fullName;
    final String profileImage = "${AppUrls.profilePicLocation}/${postList.userInfo.profileImage}";
    final String postImage = postList.file;
    final String title = postList.title;
    final String description = postList.description;
    final String restaurantName = postList.restaurantInfo.name;
    final String address = postList.restaurantInfo.address;
    final String cuisine= postList.preferenceInfo?.title ?? "No cuisine";
    final int commentCount= postList.commentCount;

    return Container(
      padding:
          const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10).r,
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  AutoRouter.of(context).push(PeopleProfileRoute(
                    peoplename: name, //'Ahmad Gouse',
                    peopleimage: profileImage, //'assets/images/temp/follower-sample2.png',
                    peopleId: peopleId,
                      isFollow: true
                  ));
                },
                child: Row(
                  children: [
                    Container(
                      width: 20.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                              profileImage,
                            ),
                            fit: BoxFit.cover,
                          )),
                    ),
                    8.horizontalSpace,
                    Text(
                      name, //'Ahmad Gouse',
                      style: AppTextStyles.textStylePoppinsMedium.copyWith(
                          fontSize: 16.sp, color: AppColors.colorWhite),
                    ),
                  ],
                ),
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
                          color: Color(0xffACE9B6).withOpacity(0.31),
                        ),
                        child: Center(
                          child: Text(
                            cuisine,//'Chinese Cuisine',
                            style:
                                AppTextStyles.textStylePoppinsRegular.copyWith(
                              color: Color(0xff6BCE7B).withOpacity(0.85),
                              fontSize: 10.sp,
                            ),
                          ),
                        ),
                      ),
                      13.horizontalSpace,
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
                            restaurantName, //'Starbucks LA, California',
                            style:
                                AppTextStyles.textStylePoppinsMedium.copyWith(
                              fontSize: 13.sp,
                              color: AppColors.colorWhite,
                            ),
                          ),
                          Text(
                            address.length > 40 ? '${address.substring(0, 40)}...' : address,
                            // 'Double road, Lorem City, LA',
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
                        commentCount.toString(),//'00',
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

          15.verticalSpace,
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              description,//'A memorable evening to be remembered.',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.textStylePoppinsMedium.copyWith(
                fontSize: 13.sp,
                color: AppColors.colorWhite,
              ),
            ),
          )
        ],
      ),
    );
  }
}
