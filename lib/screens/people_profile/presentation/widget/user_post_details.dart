import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/screens/people_profile/domain/post_list_of_other_model.dart';
import 'package:for_the_table/screens/post_feed/domain/post_feed_model.dart';
import 'package:for_the_table/screens/post_feed/shared/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_urls.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/app_text_styles.dart';
import '../../../your_lists/shared/provider.dart';
import '../../domain/other_people_profile_model.dart';
import '../../shared/providers.dart';

@RoutePage()
class PostDetailsPage extends ConsumerStatefulWidget {
  final String? postId;
  final String? userId;

  const PostDetailsPage({
    super.key,
    required this.postId,
    required this.userId,
  });

  @override
  ConsumerState<PostDetailsPage> createState() => _PostDetailsPageState();
}

class _PostDetailsPageState extends ConsumerState<PostDetailsPage> {
  DataOfPostListOfOtherModel? postDetails;
  DataOfOtherPeople? creatorDetails;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await _fetchPostDetails();
    });
  }

  Future<void> _fetchPostDetails() async {
    final followNotifier = ref.read(followNotifierProvider.notifier);
    await followNotifier.getAllPostsOfOtherUserProfile(() {}, widget.userId ?? "");
    await followNotifier.getOtherPeopleDetails(() {}, widget.userId ?? "");
    final postFeedNotifier = ref.read(postFeedNotifierProvider.notifier);
    await postFeedNotifier.getPostFeed();
    final followState = ref.watch(followNotifierProvider);
    final postListOfOtherUser = followState.postListOfOtherUser;
    postDetails = postListOfOtherUser.firstWhere((post) => post.id == widget.postId,
        orElse: () => const DataOfPostListOfOtherModel(id: ''));
  }

  Future<void> _handleLikeUnlike(String postId) async {
    final postFeedNotifier = ref.read(postFeedNotifierProvider.notifier);
    await postFeedNotifier.likeUnlikePost(() async {
      await _fetchPostDetails();
    }, postId);
  }

  Future<void> _handleSaveUnsave(String postId) async {
    final postFeedNotifier = ref.read(postFeedNotifierProvider.notifier);
    await postFeedNotifier.saveUnsavePost(() async {
      await _fetchPostDetails();
    }, postId);
  }

  Future<void> _handleFollowUnfollowButtonPressed(userId) async {
    final followNotifier = ref.read(followNotifierProvider.notifier);
    final yourPeopleNotifier = ref.read(yourPeopleNotifierProvider.notifier);
    followNotifier.followUnfollow(() {}, userId);
    yourPeopleNotifier.getAllUsersList(isFollowState: true);
    await _fetchPostDetails();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(followNotifierProvider);
    final followNotifier = ref.watch(followNotifierProvider.notifier);
    final postListOfOtherUser = state.postListOfOtherUser;
    postDetails = postListOfOtherUser.firstWhere(
      (post) => post.id == widget.postId,
      orElse: () => const DataOfPostListOfOtherModel(id: ''),
    );
    creatorDetails = followNotifier.getUserById(widget.userId ?? '');

    final String mediaUrl = "${AppUrls.postImageLocation}${postDetails?.file}";
    bool isVideo = mediaUrl.toLowerCase().endsWith('.mp4') ||
        mediaUrl.toLowerCase().endsWith('.mov') ||
        mediaUrl.toLowerCase().endsWith('.avi');
    final postFeedState = ref.watch(postFeedNotifierProvider);
    DataOfPostModel? postDetailsList = postFeedState.postList?.firstWhere(
      (post) => post.id == widget.postId,
      orElse: () => const DataOfPostModel(id: ''),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 10, left: 20, right: 0, bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.colorPrimary.withOpacity(0.20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  5.horizontalSpace,
                  Icon(Icons.arrow_back_ios, color: AppColors.colorWhite, size: 15.h),
                ],
              ),
            ),
          )),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: NetworkImage(
              CachedNetworkImage(
                imageUrl: mediaUrl,
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
              const Spacer(),
              8.verticalSpace,
              Container(
                color: Colors.transparent,
                padding: const EdgeInsets.symmetric(horizontal: 10).r,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                AutoRouter.of(context).push(PeopleProfileRoute(
                                  peopleId: widget.userId ?? "",
                                ));
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
                                          image: NetworkImage(
                                            '${AppUrls.profilePicLocation}/${creatorDetails?.profileImage ?? ''}',
                                          ),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                  8.horizontalSpace,
                                  Text(
                                    creatorDetails?.fullName ?? "",
                                    style: AppTextStyles.textStylePoppinsMedium
                                        .copyWith(fontSize: 16.sp, color: AppColors.colorWhite),
                                  ),
                                  8.horizontalSpace,
                                  GestureDetector(
                                    onTap: () async => await _handleFollowUnfollowButtonPressed(
                                        creatorDetails?.id),
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(70),
                                        border:
                                            Border.all(width: 1, color: const Color(0xffDDDFE6)),
                                        color: AppColors.colorWhite.withOpacity(0.20),
                                      ),
                                      child: Center(
                                        child: Text(
                                          (creatorDetails?.isFollowing ?? false)
                                              ? 'Unfollow'
                                              : (creatorDetails?.isFollowingRequest ?? false)
                                                  ? 'Requested'
                                                  : 'Follow',
                                          style: AppTextStyles.textStylePoppinsRegular.copyWith(
                                            color: AppColors.colorWhite,
                                            fontSize: 10.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
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
                                      postDetails?.restaurantInfo?.name ?? "",
                                      style: AppTextStyles.textStylePoppinsMedium.copyWith(
                                        fontSize: 13.sp,
                                        color: AppColors.colorWhite,
                                      ),
                                    ),
                                    Text(
                                      postDetails!.restaurantInfo!.address.length > 40
                                          ? '${postDetails?.restaurantInfo?.address.substring(0, 40)}...'
                                          : postDetails?.restaurantInfo?.address ?? "",
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
                                onTap: () async => await _handleLikeUnlike(postDetails?.id ?? ""),
                                child: (postDetails?.isMyLike ?? false)
                                    ? Image.asset(Assets.redHeart)
                                    : Image.asset(Assets.like)),
                            15.verticalSpace,
                            GestureDetector(
                              onTap: () {
                                AutoRouter.of(context).push(
                                  CommentsRoute(postInfoList: postDetailsList!),
                                );
                              },
                              child: Column(
                                children: [
                                  Image.asset(Assets.comments),
                                  Text(
                                    (postDetails!.commentCount! > 9)
                                        ? postDetails?.commentCount.toString() ?? ""
                                        : "0${postDetails?.commentCount.toString()}",
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
                                onTap: () async => await _handleSaveUnsave(widget.postId ?? ""),
                                child: (postDetails?.isSave ?? false)
                                    ? Image.asset(
                                        Assets.saved,
                                        scale: 2,
                                      )
                                    : Image.asset(Assets.bookmark)),
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
                          postDetails?.restaurantInfo?.rating ?? "",
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
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        postDetails?.title ?? "",
                        style: AppTextStyles.textStylePoppinsMedium.copyWith(
                          fontSize: 13.sp,
                          color: AppColors.colorWhite,
                        ),
                      ),
                    ),
                    15.verticalSpace,
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        postDetails?.description ?? "",
                        style: AppTextStyles.textStylePoppinsRegular.copyWith(
                          fontSize: 10.sp,
                          color: AppColors.colorWhite,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
