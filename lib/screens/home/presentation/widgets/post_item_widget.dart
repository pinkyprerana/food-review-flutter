import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';

import 'package:for_the_table/screens/post_feed/presentation/widgets/comments_icon.dart';
import 'package:glassmorphism/glassmorphism.dart';

class PostItemWidget2 extends StatelessWidget {
  const PostItemWidget2({
    super.key,
    required this.userName,
    required this.userImage,
    required this.cuisine,
    required this.description,
    required this.image,
    required this.restaurantName,
    required this.title,
    required this.restaurantAddress,
    required this.commentCount,
    required this.isFollowing,
  });
  final String image;
  final String title;
  final String description;
  final String cuisine;
  final String restaurantName;
  final String userName;
  final String userImage;
  final String restaurantAddress;
  final int commentCount;
  final bool isFollowing;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10).r,
      width: double.infinity,
      // height: mediaQuery.height * 0.45,
      // height: 295.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          // image: AssetImage(Assets.post2),
          image: (image.contains('jpg') || image.contains('png') || image.contains('jpeg'))
              ? CachedNetworkImageProvider(image)
              : const AssetImage(Assets.noRestaurantImage),
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
                padding: const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10).r,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // AutoRouter.of(context).push(PeopleProfileRoute(
                        //     peoplename: 'Ahmad Gouse',
                        //     peopleimage:
                        //         'assets/images/temp/follower-sample2.png',
                        //     peopleId: '',
                        //     isFollow: true));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 20.w,
                            height: 20.h,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  // image: AssetImage(
                                  //   Assets.follow2,
                                  // ),
                                  image: (userImage.contains('jpg') ||
                                          userImage.contains('png') ||
                                          userImage.contains('jpeg') ||
                                          userImage.contains('gif'))
                                      ? CachedNetworkImageProvider(userImage)
                                      : const AssetImage(Assets.noProfileImage),
                                  fit: BoxFit.cover,
                                )),
                          ),
                          8.horizontalSpace,
                          Text(
                            userName,
                            style: AppTextStyles.textStylePoppinsMedium
                                .copyWith(fontSize: 16.sp, color: AppColors.colorWhite),
                          ),
                          8.horizontalSpace,
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(70),
                              color: AppColors.colorWhite.withOpacity(0.20),
                            ),
                            child: Center(
                              child: (isFollowing)
                                  ? Text(
                                      'Unfollow',
                                      style: AppTextStyles.textStylePoppinsRegular.copyWith(
                                        color: AppColors.colorWhite,
                                        fontSize: 10.sp,
                                      ),
                                    )
                                  : Text(
                                      'Follow',
                                      style: AppTextStyles.textStylePoppinsRegular.copyWith(
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
                                    child: (cuisine != '')
                                        ? Text(
                                            cuisine,
                                            style: AppTextStyles.textStylePoppinsRegular.copyWith(
                                              color: AppColors.colorWhite,
                                              fontSize: 10.sp,
                                            ),
                                          )
                                        : Text(
                                            'Not Mentioned',
                                            style: AppTextStyles.textStylePoppinsRegular.copyWith(
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
                                //   style: AppTextStyles.textStylePoppinsRegular
                                //       .copyWith(
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
                                    (restaurantName != '')
                                        ? Text(
                                            restaurantName,
                                            style: AppTextStyles.textStylePoppinsMedium.copyWith(
                                              fontSize: 13.sp,
                                              color: AppColors.colorWhite,
                                            ),
                                          )
                                        : const SizedBox.shrink(),
                                    Text(
                                      restaurantAddress.length > 40
                                          ? '${restaurantAddress.substring(0, 35)}...'
                                          : restaurantAddress,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTextStyles.textStylePoppinsRegular.copyWith(
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
                            CommentsIcon(
                              commentCount: commentCount,
                            ),
                            10.verticalSpace,
                            Image.asset(Assets.bookmark),
                          ],
                        )
                      ],
                    ),
                    10.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          description.length > 40
                              ? '${description.substring(0, 40)}...'
                              : description,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.textStylePoppinsMedium.copyWith(
                            fontSize: 12.sp,
                            color: AppColors.colorWhite,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(25),
            //   child: BackdropFilter(
            //     blendMode: BlendMode.srcIn,
            //     filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            //     child: Container(
            //       padding: const EdgeInsets.only(
            //               top: 15, left: 15, right: 15, bottom: 10)
            //           .r,
            //       width: double.infinity,
            //       //height: 170.h,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(10),
            //         gradient: LinearGradient(
            //           end: Alignment.bottomCenter,
            //           colors: [
            //             const Color(0xff0A0A0A).withOpacity(0.1),
            //             const Color(0xff000000).withOpacity(0)
            //           ],
            //         ),
            //       ),
            //       child: Column(
            //         children: [
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.start,
            //             children: [
            //               Container(
            //                 width: 20.w,
            //                 height: 20.h,
            //                 decoration: BoxDecoration(
            //                     shape: BoxShape.circle,
            //                     image: DecorationImage(
            //                       image: AssetImage(
            //                         Assets.follow1,
            //                       ),
            //                       fit: BoxFit.cover,
            //                     )),
            //               ),
            //               8.horizontalSpace,
            //               Text(
            //                 'Ahmad Gouse',
            //                 style: AppTextStyles.textStylePoppinsMedium
            //                     .copyWith(
            //                         fontSize: 16.sp,
            //                         color: AppColors.colorWhite),
            //               ),
            //               8.horizontalSpace,
            //               Container(
            //                 padding: const EdgeInsets.symmetric(
            //                     vertical: 8, horizontal: 8),
            //                 decoration: BoxDecoration(
            //                   borderRadius: BorderRadius.circular(70),
            //                   color: AppColors.colorWhite.withOpacity(0.20),
            //                 ),
            //                 child: Center(
            //                   child: Text(
            //                     'Following',
            //                     style: AppTextStyles.textStylePoppinsRegular
            //                         .copyWith(
            //                       color: AppColors.colorWhite,
            //                       fontSize: 10.sp,
            //                     ),
            //                   ),
            //                 ),
            //               )
            //             ],
            //           ),
            //           // 15.verticalSpace,
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               Column(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   15.verticalSpace,
            //                   Row(
            //                     mainAxisAlignment: MainAxisAlignment.start,
            //                     children: [
            //                       Container(
            //                         padding: const EdgeInsets.all(10),
            //                         decoration: BoxDecoration(
            //                           borderRadius: BorderRadius.circular(70),
            //                           color: AppColors.colorGreen,
            //                         ),
            //                         child: Center(
            //                           child: Text(
            //                             'Chinese Cuisine',
            //                             style: AppTextStyles
            //                                 .textStylePoppinsRegular
            //                                 .copyWith(
            //                               color: AppColors.colorWhite,
            //                               fontSize: 10.sp,
            //                             ),
            //                           ),
            //                         ),
            //                       ),
            //                       8.horizontalSpace,
            //                       // Image.asset(Assets.dislike_emoji),
            //                       5.horizontalSpace,
            //                       // Text(
            //                       //   'Didn\'t Like',
            //                       //   style: AppTextStyles.textStylePoppinsRegular
            //                       //       .copyWith(
            //                       //     fontSize: 10.sp,
            //                       //     color: AppColors.colorWhite,
            //                       //   ),
            //                       // )
            //                     ],
            //                   ),
            //                   8.verticalSpace,
            //                   Row(
            //                     mainAxisAlignment: MainAxisAlignment.start,
            //                     children: [
            //                       Image.asset(
            //                         Assets.location2,
            //                       ),
            //                       8.horizontalSpace,
            //                       Column(
            //                         crossAxisAlignment:
            //                             CrossAxisAlignment.start,
            //                         children: [
            //                           Text(
            //                             'Starbucks LA, California',
            //                             style: AppTextStyles
            //                                 .textStylePoppinsMedium
            //                                 .copyWith(
            //                               fontSize: 13.sp,
            //                               color: AppColors.colorWhite,
            //                             ),
            //                           ),
            //                           Text(
            //                             'Double road, Lorem City, LA',
            //                             style: AppTextStyles
            //                                 .textStylePoppinsRegular
            //                                 .copyWith(
            //                               fontSize: 10.sp,
            //                               color: AppColors.colorWhite,
            //                             ),
            //                           ),
            //                         ],
            //                       )
            //                     ],
            //                   ),
            //                 ],
            //               ),
            //               Column(
            //                 children: [
            //                   Image.asset(Assets.like),
            //                   15.verticalSpace,
            //                   const CommentsIcon(),
            //                   10.verticalSpace,
            //                   Image.asset(Assets.bookmark),
            //                 ],
            //               )
            //             ],
            //           ),

            //           10.verticalSpace,
            //           Text(
            //             'A memorable evening to be remembered.',
            //             maxLines: 1,
            //             overflow: TextOverflow.ellipsis,
            //             style: AppTextStyles.textStylePoppinsMedium.copyWith(
            //               fontSize: 12.sp,
            //               color: AppColors.colorWhite,
            //             ),
            //           )
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
