import 'dart:ui';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/routes/app_router.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/post_feed/domain/postFeed_model.dart';
import 'package:glassmorphism/glassmorphism.dart';
import '../../../core/constants/app_urls.dart';

class PostWidget extends StatelessWidget {
  final DataOfPostModel postList;
  const PostWidget({super.key, required this.postList});

  @override
  Widget build(BuildContext context) {
    final String name = postList.userInfo.fullName;
    final String profileImage = "${AppUrls.profilePicLocation}/${postList.userInfo.profileImage}";
    final String postImage = "${AppUrls.postImageLocation}${postList.file}";
    final String title = postList.title;
    final String description = postList.description;
    final String restaurantName = postList.restaurantInfo.name;
    final String address = postList.restaurantInfo.address;
    final String cuisine= postList.preferenceInfo?.title ?? "No cuisine";
    final int commentCount= postList.commentCount;
    double latitude = postList.geoLoc.coordinates[0];
    double longitude = postList.geoLoc.coordinates[1];


    return Container(
      margin: const EdgeInsets.only(bottom: 10).r,
      width: double.infinity,
      // height: mediaQuery.height * 0.45,
      // height: 295.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(
            CachedNetworkImage(
              imageUrl: postImage,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ).imageUrl,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0).r,
        child: Column(
          children: [
            //const Spacer(),
            80.verticalSpace,
            GlassmorphicContainer(
              width: double.infinity,
              height: 170.h,
              borderRadius: 10,
              linearGradient: LinearGradient(
                colors: [
                  const Color(0xff0A0A0A).withOpacity(0.1),
                  const Color(0xff000000).withOpacity(0)
                ],
              ),
              border: 1,
              blur: 5,
              borderGradient: const LinearGradient(colors: [
                Colors.transparent,
                Colors.transparent,
              ]),
              child: Padding(
                padding: const EdgeInsets.only(
                        top: 15, left: 15, right: 15, bottom: 10)
                    .r,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        AutoRouter.of(context).push(PeopleProfileRoute(
                          peoplename: name, //'Ahmad Gouse', //widget.postList.name,
                          peopleimage: profileImage
                              // 'assets/images/temp/follower-sample2.png',
                        ));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 20.w,
                            height: 20.h,
                            decoration:  BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    profileImage,
                                  ),
                                  // image: AssetImage(
                                  //   Assets.follow1,
                                  // ),
                                  fit: BoxFit.cover,
                                )),
                          ),
                          8.horizontalSpace,
                          Text(
                            name, //'Ahmad Gouse',
                            style: AppTextStyles.textStylePoppinsMedium
                                .copyWith(
                                    fontSize: 16.sp,
                                    color: AppColors.colorWhite),
                          ),
                          8.horizontalSpace,
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(70),
                              color: AppColors.colorWhite.withOpacity(0.20),
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
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            5.verticalSpace,
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
                                      cuisine, //'Chinese Cuisine',
                                      style: AppTextStyles
                                          .textStylePoppinsRegular
                                          .copyWith(
                                        color: AppColors.colorWhite,
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
                                      style: AppTextStyles
                                          .textStylePoppinsMedium
                                          .copyWith(
                                        fontSize: 13.sp,
                                        color: AppColors.colorWhite,
                                      ),
                                    ),
                                    Text(
                                      address.length > 40 ? '${address.substring(0, 40)}...' : address,
                                      //'Double road, Lorem City, LA',
                                      style: AppTextStyles
                                          .textStylePoppinsRegular
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
                            Column(
                              children: [
                                Image.asset(Assets.comments),
                                Text(
                                  commentCount.toString(), //'00',
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
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        description, //'A memorable evening to be remembered.',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.textStylePoppinsMedium.copyWith(
                          fontSize: 12.sp,
                          color: AppColors.colorWhite,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
