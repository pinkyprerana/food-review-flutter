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
import '../../../../core/utils/app_log.dart';
import '../../../your_lists/shared/provider.dart';
import '../../domain/other_people_profile_model.dart';
import '../../shared/providers.dart';

@RoutePage()
class PostDetailsPage extends ConsumerStatefulWidget {
  final DataOfPostListOfOtherModel? postListOfUser;
  final DataOfOtherPeople? creatorDetails;

  const PostDetailsPage({
    super.key,
    required this.postListOfUser,
    required this.creatorDetails,
  });

  @override
  ConsumerState<PostDetailsPage> createState() => _PostDetailsPageState();
}

class _PostDetailsPageState extends ConsumerState<PostDetailsPage> {
  late DataOfPostModel postDetails;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await _fetchPostDetails();
    });
  }

  Future<void> _fetchPostDetails() async {
    final followNotifier = ref.read(followNotifierProvider.notifier);
    await followNotifier.getAllPostsOfOtherUserProfile(() {}, widget.creatorDetails?.id??"");
    await followNotifier.getOtherPeopleDetails(() {}, widget.creatorDetails?.id??"");
    final postFeedNotifier = ref.read(postFeedNotifierProvider);
    AppLog.log("postFeedNotifier postList: ${postFeedNotifier.postList}");

    if (postFeedNotifier.postList != null) {
      postDetails = postFeedNotifier.postList!.firstWhere((post) => post.id == widget.postListOfUser?.id,
          orElse: () => const DataOfPostModel(id: '', file: '')
      );
      AppLog.log("postDetails: $postDetails");
    }
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
    final String postImage = "${AppUrls.postImageLocation}${widget.postListOfUser?.file}";

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
                  5.horizontalSpace, //this is for centering the icon
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
              const Spacer(),
              // GestureDetector(
              //   onTap: () {
              //     stateNotifier.setIsExpanded();
              //   },
              //   child: (state.isExpanded)
              //       ? const SizedBox.shrink()
              //       : const Icon(
              //     Icons.expand_less,
              //     color: AppColors.colorWhite,
              //   ),
              // ),
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
                                  peopleId: widget.creatorDetails?.id ?? "",
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
                                            '${AppUrls.profilePicLocation}/${widget.creatorDetails?.profileImage ?? ''}',
                                          ),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                  8.horizontalSpace,
                                  Text(
                                    widget.creatorDetails?.fullName ?? "",
                                    style: AppTextStyles.textStylePoppinsMedium
                                        .copyWith(fontSize: 16.sp, color: AppColors.colorWhite),
                                  ),
                                  8.horizontalSpace,
                                  GestureDetector(
                                    onTap: () async => await _handleFollowUnfollowButtonPressed(widget.creatorDetails?.id),
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(70),
                                        border: Border.all(width: 1, color: const Color(0xffDDDFE6)),
                                        color: AppColors.colorWhite.withOpacity(0.20),
                                      ),
                                      child: Center(
                                        child: Text(
                                          (widget.creatorDetails?.isFollowing ?? false) ? 'Unfollow': (widget.creatorDetails?.isFollowingRequest ?? false) ? 'Requested' :'Follow',
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
                                      widget.postListOfUser?.restaurantInfo.name??"",
                                      style: AppTextStyles.textStylePoppinsMedium.copyWith(
                                        fontSize: 13.sp,
                                        color: AppColors.colorWhite,
                                      ),
                                    ),
                                    Text(
                                      widget.postListOfUser!.restaurantInfo.address.length > 40
                                          ? '${widget.postListOfUser?.restaurantInfo.address.substring(0, 40)}...'
                                          : widget.postListOfUser?.restaurantInfo.address??"",
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
                              onTap: () async => await _handleLikeUnlike(widget.postListOfUser?.id ?? ""),
                                child: (widget.postListOfUser?.isMyLike??false)
                                    ? Image.asset(Assets.redHeart)
                                    : Image.asset(Assets.like)),
                            15.verticalSpace,
                            GestureDetector(
                              onTap: () {
                                AutoRouter.of(context).push(CommentsRoute(postInfoList: postDetails,),);
                                },
                              child: Column(
                                children: [
                                  Image.asset(Assets.comments),
                                  Text(
                                    (widget.postListOfUser!.commentCount > 9)
                                        ? widget.postListOfUser?.commentCount.toString()??""
                                        : "0${widget.postListOfUser?.commentCount.toString()}",
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
                                onTap: () async => await _handleSaveUnsave(widget.postListOfUser?.id ?? ""),
                                child: (widget.postListOfUser?.isSave??false)
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
                          widget.postListOfUser?.restaurantInfo.rating??"",
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
                        widget.postListOfUser?.title??"",
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
                        widget.postListOfUser?.description??"",
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
