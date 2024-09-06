import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/infrastructure/hive_database.dart';
import 'package:for_the_table/core/routes/app_router.dart';
import 'package:for_the_table/core/shared/providers.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/screens/home/domain/post_model.dart';
import 'package:for_the_table/screens/post_feed/presentation/widgets/heart_animation_widget.dart';
// import 'package:for_the_table/screens/post_feed/presentation/widgets/like_icon.dart';
import 'package:for_the_table/screens/post_feed/presentation/widgets/save_icon.dart';
import 'package:for_the_table/widgets/show_video_post.dart';
// import 'package:for_the_table/screens/post_feed/presentation/widgets/heart_animation_dart';
import '../../../../core/constants/app_urls.dart';
import '../../shared/provider.dart';

class PostFeedItem extends ConsumerStatefulWidget {
  final Post post;
  final int index;

  const PostFeedItem({
    super.key,
    required this.post,
    required this.index,
  });
  @override
  ConsumerState<PostFeedItem> createState() => _PostFeedItemState();
}

class _PostFeedItemState extends ConsumerState<PostFeedItem> {
  bool _isFavorite = false;
  bool _isLike = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final stateNotifier = ref.read(homeNotifierProvider.notifier);

      stateNotifier.assignFollowStatus(
        widget.post.isFollowing ?? false,
        widget.post.isFollowingRequest ?? false,
      );
      _isLike = widget.post.isMyLike ?? false;
    });
    super.initState();
  }

  // void _handleFollowUnfollowButtonPressed(userId) async {
  //   final followNotifier = ref.read(followNotifierProvider.notifier);
  //   final yourPeopleNotifier = ref.read(yourPeopleNotifierProvider.notifier);
  //   final homeNotifier = ref.read(homeNotifierProvider.notifier);
  //   await followNotifier.followUnfollow(() {}, userId);
  //   await yourPeopleNotifier.getAllUsersList(isFollowState: true);
  //   await homeNotifier.getPostFeed(isPostLoading: true);
  // }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeNotifierProvider);
    final stateNotifier = ref.watch(homeNotifierProvider.notifier);

    // final String postImage = "${AppUrls.postImageLocation}${widget.post.file}";
    final String mediaUrl = "${AppUrls.postImageLocation}${widget.post.file}";

    bool isVideo = mediaUrl.toLowerCase().endsWith('.mp4') ||
        mediaUrl.toLowerCase().endsWith('.mov') ||
        mediaUrl.toLowerCase().endsWith('.avi');

    final String? peopleId = widget.post.userInfo?.id;
    final String? name = widget.post.userInfo?.fullName;
    final String profileImage =
        "${AppUrls.profilePicLocation}/${widget.post.userInfo?.profileImage}";
    final String? description = widget.post.description;
    final String? restaurantName = widget.post.restaurantInfo?.name;
    final String? address = widget.post.restaurantInfo?.address;
    final String? cuisine = widget.post.preferenceInfo?.title;
    final int? commentCount = widget.post.commentCount;
    final String? postId = widget.post.id;
    final String? restaurantRating = widget.post.restaurantInfo?.rating;
    final bool? isSaved = widget.post.isSave;
    // final bool? isLiked = widget.post.isMyLike;
    final hive = ref.read(hiveProvider);
    final loggedInUserId = hive.box.get(AppPreferenceKeys.userId);
    // final deviceSize = MediaQuery.sizeOf(context);

    return GestureDetector(
      onDoubleTap: () {
        setState(() {
          _isFavorite = true;
        });
        stateNotifier.showFavourite(context);
        stateNotifier.likePost(() {}, widget.post.id ?? '');
      },
      child: Container(
        color: AppColors.colorPrimary,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: isVideo
                  ? ShowVideoWidget(videoUrl: mediaUrl)
                  : Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: (mediaUrl == '${AppUrls.postImageLocation}/')
                              ? const AssetImage(Assets.noRestaurantImage)
                              : CachedNetworkImageProvider(
                                  mediaUrl,
                                ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
            ),
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(10.0).r,
                child: Column(
                  children: [
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        stateNotifier.toggleIsExpanded();
                      },
                      child: (state.isExpanded)
                          ? const SizedBox.shrink()
                          : const Icon(
                              Icons.expand_less,
                              color: AppColors.colorWhite,
                            ),
                    ),
                    8.verticalSpace,
                    Container(
                      padding: const EdgeInsets.only(
                              top: 15, left: 15, right: 15, bottom: 10)
                          .r,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  AutoRouter.of(context)
                                      .push(PeopleProfileRoute(
                                    peopleId: peopleId ?? "",
                                  ));
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      width: 20.w,
                                      height: 20.w,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: profileImage ==
                                                    '${AppUrls.profilePicLocation}/'
                                                ? const AssetImage(
                                                    Assets.noProfileImage)
                                                : NetworkImage(
                                                    profileImage,
                                                  ),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                    8.horizontalSpace,
                                    Text(
                                      name != null && name.length > 15
                                          ? '${name.substring(0, 15)}...'
                                          : name ?? "",
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTextStyles
                                          .textStylePoppinsMedium
                                          .copyWith(
                                              fontSize: 16.sp,
                                              color: AppColors.colorWhite),
                                    ),
                                  ],
                                ),
                              ),
                              8.horizontalSpace,
                              if (loggedInUserId != peopleId) ...[
                                GestureDetector(
                                  onTap: () async {
                                    await stateNotifier
                                        .onFollowUnfollowButtonPressed(
                                            peopleId ?? '');
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(70),
                                      color: AppColors.colorWhite
                                          .withOpacity(0.20),
                                    ),
                                    child: Center(
                                      child: Text(
                                        state.followStatus,
                                        style: AppTextStyles
                                            .textStylePoppinsRegular
                                            .copyWith(
                                          color: AppColors.colorWhite,
                                          fontSize: 10.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
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
                                          borderRadius:
                                              BorderRadius.circular(70),
                                          color: const Color(0xffACE9B6)
                                              .withOpacity(0.31),
                                        ),
                                        child: Center(
                                          child: Text(
                                            cuisine ?? "", //'Chinese Cuisine',
                                            style: AppTextStyles
                                                .textStylePoppinsRegular
                                                .copyWith(
                                              color: const Color(0xff6BCE7B)
                                                  .withOpacity(0.85),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            restaurantName ??
                                                "Restaurant name not available",
                                            style: AppTextStyles
                                                .textStylePoppinsMedium
                                                .copyWith(
                                              fontSize: 13.sp,
                                              color: AppColors.colorWhite,
                                            ),
                                          ),
                                          Text(
                                            address != null &&
                                                    address.length > 40
                                                ? '${address.substring(0, 40)}...'
                                                : address ??
                                                    'Restaurant address not available',
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
                                  GestureDetector(
                                    onTap: () {
                                      if (_isFavorite) {
                                        setState(() {
                                          _isFavorite = false;
                                          _isLike = false;
                                        });
                                      } else {
                                        setState(() {
                                          _isLike = !_isLike;
                                        });
                                      }
                                      stateNotifier.likeUnlikePost(
                                          () {}, postId ?? "");
                                    },
                                    child: (_isLike || _isFavorite)
                                        ? SizedBox(
                                            width: 20,
                                            child:
                                                Image.asset(Assets.heartFilled),
                                          )
                                        : SizedBox(
                                            width: 20,
                                            child: Image.asset(
                                                Assets.heartOutline),
                                          ),
                                  ),

                                  // LikeIcon(
                                  //   isLiked: isLiked ?? false,
                                  //   onTap: () => stateNotifier.likeUnlikePost(() {}, postId ?? ""),
                                  // ),
                                  12.verticalSpace,
                                  GestureDetector(
                                    onTap: () => AutoRouter.of(context)
                                        .push(PostCommentsRoute(
                                      post: widget.post,
                                    )),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          width: 20,
                                          child: Image.asset(
                                              Assets.commentOutline),
                                        ),
                                        Text(
                                          ((commentCount ?? 0) > 9)
                                              ? commentCount.toString()
                                              : "0${commentCount.toString()}",
                                          style: AppTextStyles
                                              .textStylePoppinsRegular
                                              .copyWith(
                                            color: AppColors.colorWhite,
                                            fontSize: 10.sp,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  12.verticalSpace,
                                  SaveIcon(
                                    isSaved: isSaved ?? false,
                                    onTap: () => stateNotifier.saveUnsavePost(
                                        () {}, postId ?? ""),
                                  ),
                                  12.verticalSpace,
                                  Visibility(
                                    visible: isVideo,
                                    child: GestureDetector(
                                      onTap: () => stateNotifier.toggleVideoSound(),
                                      child: SizedBox(
                                        width: 24,
                                        child: state.isVideoOnMute
                                            ? Image.asset(
                                                Assets.volumeLow,
                                                color: Colors.white,
                                              )
                                            : Image.asset(
                                                Assets.volumeHigh,
                                                color: Colors.white,
                                              ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          if (state.isExpanded) ...[
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
                                  restaurantRating ?? "",
                                  style: AppTextStyles.textStylePoppinsRegular
                                      .copyWith(
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
                                  style: AppTextStyles.textStylePoppinsRegular
                                      .copyWith(
                                    fontSize: 10.sp,
                                    color: AppColors.colorWhite,
                                  ),
                                )
                              ],
                            ),
                          ],
                          15.verticalSpace,
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              description ??
                                  "", //'A memorable evening to be remembered.',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  AppTextStyles.textStylePoppinsMedium.copyWith(
                                fontSize: 13.sp,
                                color: AppColors.colorWhite,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    (state.isExpanded)
                        ? Column(
                            children: [
                              8.verticalSpace,
                              GestureDetector(
                                onTap: () {
                                  stateNotifier.setIsExpanded();
                                },
                                child: const Icon(
                                  Icons.expand_more,
                                  color: AppColors.colorWhite,
                                ),
                              ),
                              8.verticalSpace,
                            ],
                          )
                        : const SizedBox.shrink(),
                    20.verticalSpace,
                  ],
                ),
              ),
            ),
            Opacity(
              opacity: state.isHeartAnimating ? 1 : 0,
              child: HeartAnimationWidget(
                isAnimating: state.isHeartAnimating,
                duration: const Duration(milliseconds: 900),
                onEnd: () {
                  stateNotifier.setFvoriteToFalse();
                },
                child: const Icon(
                  Icons.favorite,
                  size: 85,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
