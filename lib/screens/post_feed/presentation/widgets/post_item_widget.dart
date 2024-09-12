import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/screens/restaurant/shared/provider.dart';
import 'package:glassmorphism/glassmorphism.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../model/restaurant/postlist_per_restaurant_response_model.dart';
import '../../../../widgets/save_button.dart';
import '../../../../widgets/video_thumbnail.dart';
import '../../../people_profile/shared/providers.dart';
import '../../../post_feed/shared/provider.dart';
import '../../../your_lists/shared/provider.dart';

class PostItemWidget2 extends ConsumerStatefulWidget {
  const PostItemWidget2({
    super.key,
    required this.postList,
    required this.userId,
    required this.userName,
    required this.userImage,
    required this.cuisine,
    required this.description,
    required this.image,
    required this.restaurantId,
    required this.restaurantName,
    required this.title,
    required this.restaurantAddress,
    required this.commentCount,
    required this.isFollowing,
    required this.isRequested,
  });

  final Post postList;
  final String userId;
  final String image;
  final String title;
  final String description;
  final String cuisine;
  final String restaurantId;
  final String restaurantName;
  final String userName;
  final String userImage;
  final String restaurantAddress;
  final int commentCount;
  final bool isFollowing;
  final bool isRequested;

  @override
  ConsumerState<PostItemWidget2> createState() => _PostItemWidget2State();
}

class _PostItemWidget2State extends ConsumerState<PostItemWidget2> {
  void handleFollowUnfollowButtonPressed(userId) {
    final followNotifier = ref.read(followNotifierProvider.notifier);
    final yourPeopleNotifier = ref.read(yourPeopleNotifierProvider.notifier);
    final restaurantNotifier = ref.read(restaurantNotifierProvider.notifier);
    followNotifier.followUnfollow(() {}, userId);
    yourPeopleNotifier.getAllUsersList(isFollowState: true);
    restaurantNotifier.getPostListRelatedToRestaurant(() {}, widget.restaurantId);
  }

  @override
  Widget build(BuildContext context) {
    // final String peopleId = widget.userId;
    // final String name = widget.userName;
    // final String profileImage =
    //     "${AppUrls.profilePicLocation}/${widget.userImage}";
    // final String postImage = "${AppUrls.postImageLocation}${widget.image}";
    // final String description = widget.description;
    // final String restaurantName = widget.restaurantName;
    // final String address = widget.restaurantAddress;
    // final String cuisine = widget.cuisine;
    final int commentCount = widget.commentCount;
    // final String? postId = widget.;
    // final bool? isSaved = widget.postList.isSave;
    // final bool? isLiked = widget.postList.isMyLike;
    // final bool isFollowing = widget.isFollowing;
    // final bool isRequested = widget.isRequested;
    final postFeedState = ref.watch(postFeedNotifierProvider);
    final postFeedNotifier = ref.watch(postFeedNotifierProvider.notifier);
    final restaurantNotifier = ref.watch(restaurantNotifierProvider.notifier);
    final String file = widget.image;
    bool isVideo = file.toLowerCase().endsWith('.mp4') || file.toLowerCase().endsWith('.mov') || file.toLowerCase().endsWith('.avi');
    bool isImage = file.toLowerCase().endsWith('.jpg') || file.toLowerCase().endsWith('.png') || file.toLowerCase().endsWith('.jpeg');

    return Container(
      margin: const EdgeInsets.only(bottom: 10).r,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: isImage
            ? DecorationImage(
          image: CachedNetworkImageProvider(widget.image),
          fit: BoxFit.cover,
        )
            : const DecorationImage(
          image: AssetImage(Assets.noRestaurantImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          if (isVideo)
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: VideoThumbnails(videoUrl: file)
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(10.0).r,
            child: Column(
              children: [
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
                                      image: (widget.userImage.contains('jpg') ||
                                              widget.userImage.contains('png') ||
                                              widget.userImage.contains('jpeg') ||
                                              widget.userImage.contains('gif'))
                                          ? CachedNetworkImageProvider(widget.userImage)
                                          : const AssetImage(Assets.noProfileImage),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              8.horizontalSpace,
                              Text(
                                widget.userName.length > 15
                                    ? '${widget.userName.substring(0, 15)}...'
                                    : widget.userName,
                                style: AppTextStyles.textStylePoppinsMedium
                                    .copyWith(fontSize: 16.sp, color: AppColors.colorWhite),
                              ),
                              8.horizontalSpace,
                              GestureDetector(
                                onTap: () {
                                  handleFollowUnfollowButtonPressed(widget.userId);
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(70),
                                    color: AppColors.colorWhite.withOpacity(0.20),
                                  ),
                                  child: Center(
                                      child: Text(
                                    widget.isFollowing
                                        ? 'Unfollow'
                                        : widget.isRequested
                                            ? 'Requested'
                                            : 'Follow',
                                    style: AppTextStyles.textStylePoppinsRegular.copyWith(
                                      color: AppColors.colorWhite,
                                      fontSize: 10.sp,
                                    ),
                                  )),
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
                                        child: (widget.cuisine != '')
                                            ? Text(
                                                widget.cuisine,
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
                                        (widget.restaurantName != '')
                                            ? Text(
                                                widget.restaurantName,
                                                style: AppTextStyles.textStylePoppinsMedium.copyWith(
                                                  fontSize: 13.sp,
                                                  color: AppColors.colorWhite,
                                                ),
                                              )
                                            : const SizedBox.shrink(),
                                        Text(
                                          widget.restaurantAddress.length > 40
                                              ? '${widget.restaurantAddress.substring(0, 35)}...'
                                              : widget.restaurantAddress,
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
                                GestureDetector(
                                    onTap: () => postFeedNotifier.likeUnlikePost(() {
                                          restaurantNotifier.getPostListRelatedToRestaurant(
                                              () {}, widget.restaurantId);
                                        }, widget.postList.id ?? ""),
                                    child: (widget.postList.isMyLike ?? false)
                                        ? Image.asset(Assets.redHeart)
                                        : Image.asset(Assets.like)),
                                15.verticalSpace,
                                GestureDetector(
                                  onTap: () => AutoRouter.of(context).push(CommentsRoute(
                                    postId: widget.postList.id ??'',
                                  )),
                                  child: Column(
                                    children: [
                                      Image.asset(Assets.comments),
                                      Text(
                                        (commentCount > 9)
                                            ? commentCount.toString()
                                            : "0${commentCount.toString()}",
                                        style: AppTextStyles.textStylePoppinsRegular.copyWith(
                                          color: AppColors.colorWhite,
                                          fontSize: 10.sp,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                10.verticalSpace,
                                GestureDetector(
                                  onTap: () => postFeedNotifier.saveUnsavePost(() {
                                    restaurantNotifier.getPostListRelatedToRestaurant(
                                        () {}, widget.restaurantId);
                                  }, widget.postList.id ?? ""),
                                  child: SaveButtonWidget(
                                    isSavePost: postFeedState.isSavePost,
                                    isSaved: widget.postList.isSave ?? false,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        10.verticalSpace,
                        Align(
                          alignment: Alignment.centerLeft,
                            child: Text(
                              widget.description.length > 40
                                  ? '${widget.description.substring(0, 40)}...'
                                  : widget.description,
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
        ],
      ),
    );
  }
}
