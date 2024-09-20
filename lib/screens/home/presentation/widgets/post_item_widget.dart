import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/routes/app_router.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/screens/home/shared/provider.dart';
import 'package:for_the_table/screens/restaurant/shared/provider.dart';
import 'package:glassmorphism/glassmorphism.dart';
import '../../../../widgets/save_button.dart';
import '../../../people_profile/shared/providers.dart';
import '../../../home/domain/post_feed_model.dart';
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
    required this.isSaved,
    required this.isLiked
  });

  final DataOfPostModel postList;
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
  final bool? isSaved;
  final bool? isLiked;

  @override
  ConsumerState<PostItemWidget2> createState() => _PostItemWidget2State();
}

class _PostItemWidget2State extends ConsumerState<PostItemWidget2> {
  bool? _isLiked;
  bool? _isSaved;

  @override
  void initState() {
    super.initState();
    _isLiked = widget.isLiked;
    _isSaved = widget.isSaved;
  }

  void _toggleLike() async {
    final stateNotifier = ref.read(homeNotifierProvider.notifier);
    await stateNotifier.likeUnlikePost(() {
      setState(() {
        _isLiked = !_isLiked!;
      });
    }, widget.postList.id ?? "");
    _fetchPostDetails();
  }

  void _toggleSave() async {
    final stateNotifier = ref.read(homeNotifierProvider.notifier);
    await stateNotifier.saveUnsavePost(() {
      setState(() {
        _isSaved = !_isSaved!;
      });
    }, widget.postList.id ?? "");
    _fetchPostDetails();
  }

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
    final state = ref.watch(homeNotifierProvider);

    return Container(
      margin: const EdgeInsets.only(bottom: 10).r,
      width: double.infinity,
      // height: mediaQuery.height * 0.45,
      // height: 295.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          // image: AssetImage(Assets.post2),
          image: (widget.image.contains('jpg') ||
                  widget.image.contains('png') ||
                  widget.image.contains('jpeg'))
              ? CachedNetworkImageProvider(widget.image)
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
                            widget.userName,
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
                                    ? 'Following'
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
                              onTap : _toggleLike,
                                // onTap: () => stateNotifier.likeUnlikePost(() async {
                                //       restaurantNotifier.getPostListRelatedToRestaurant(() {}, widget.restaurantId);
                                //       _fetchPostDetails;
                                //     }, widget.postList.id ?? ""),
                                child: _isLiked! //(widget.isLiked ?? false)
                                    ? Image.asset(Assets.redHeart)
                                    : Image.asset(Assets.like)),
                            15.verticalSpace,
                            GestureDetector(
                              onTap: () => AutoRouter.of(context).push(PostCommentsRoute(
                                postId: widget.postList.id ?? '',
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
                              onTap: _toggleSave,
                              // onTap: () => stateNotifier.saveUnsavePost(() {
                              //   restaurantNotifier.getPostListRelatedToRestaurant(
                              //       () {}, widget.restaurantId);
                              // }, widget.postList.id ?? ""),
                              child: SaveButtonWidget(
                                isSavePost: state.isSavePost,
                                isSaved: _isSaved! //widget.isSaved ?? false,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    10.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
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
                      ],
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

  Future<void> _fetchPostDetails() async {
    final yourPeopleNotifier = ref.read(yourPeopleNotifierProvider.notifier);
    final restaurantNotifier = ref.read(restaurantNotifierProvider.notifier);
    final homeNotifier = ref.read(homeNotifierProvider.notifier);
    yourPeopleNotifier.getAllUsersList(isFollowState: false);
    homeNotifier.getPostFeed();
    restaurantNotifier.getPostListRelatedToRestaurant(() {}, widget.restaurantId);
    // restaurantNotifier.getPosts(context: context, restaurantId: widget.restaurantId);
  }
}
