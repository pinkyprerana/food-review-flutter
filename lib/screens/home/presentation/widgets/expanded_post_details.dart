import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/routes/app_router.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/screens/home/shared/provider.dart';
import 'package:for_the_table/screens/home/domain/post_feed_model.dart';
import '../../../../core/constants/app_urls.dart';
import '../../../people_profile/shared/providers.dart';
import '../../../profile/shared/providers.dart';
import '../../../your_lists/shared/provider.dart';

class ExpandedPostDetails extends ConsumerStatefulWidget {
  final DataOfPostModel? postList;
  const ExpandedPostDetails({super.key, required this.postList});

  @override
  ConsumerState<ExpandedPostDetails> createState() => _ExpandedPostDetailsState();
}

class _ExpandedPostDetailsState extends ConsumerState<ExpandedPostDetails> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final profileNotifier = ref.read(profileNotifierProvider.notifier);
      await profileNotifier.getSavedList();
    });
  }

  void _handleFollowUnfollowButtonPressed(userId) async {
    final followNotifier = ref.read(followNotifierProvider.notifier);
    final yourPeopleNotifier = ref.read(yourPeopleNotifierProvider.notifier);
    final postFeedNotifier = ref.read(homeNotifierProvider.notifier);
    await followNotifier.followUnfollow(() {}, userId);
    await yourPeopleNotifier.getAllUsersList(isFollowState: true);
    await postFeedNotifier.getPostFeed(isPostLoading: true);
  }

  @override
  Widget build(BuildContext context) {
    final String? peopleId = widget.postList?.userInfo?.id;
    final String? name = widget.postList?.userInfo?.fullName;
    final String profileImage =
        "${AppUrls.profilePicLocation}/${widget.postList?.userInfo?.profileImage}";
    final String? title = widget.postList?.title;
    final String? description = widget.postList?.description;
    final String? restaurantName = widget.postList?.restaurantInfo?.name;
    final String? restaurantRating = widget.postList?.restaurantInfo?.rating;
    final String? address = widget.postList?.restaurantInfo?.address;
    final int? commentCount = widget.postList?.commentCount;
    final String? postId = widget.postList?.id;
    final bool? isFollowing = widget.postList?.isFollowing;
    final bool? isRequested = widget.postList?.isFollowingRequest;
    final postFeedNotifier = ref.watch(homeNotifierProvider.notifier);
    final bool? isSaved = widget.postList?.isSave;
    final bool? isLiked = widget.postList?.isMyLike;

    final state = ref.watch(homeNotifierProvider);

    return Container(
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
                        // peoplename: name ?? "", //'Ahmad Gouse',
                        // peopleimage: profileImage, //'assets/images/temp/follower-sample2.png',
                        peopleId: peopleId ?? "",
                        //   isFollow: true,
                        // isRequested: false,
                        // isFollowing: false,
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
                                image: profileImage == '${AppUrls.profilePicLocation}/'
                                    ? const AssetImage(Assets.noProfileImage)
                                    : NetworkImage(
                                        profileImage,
                                      ),
                                fit: BoxFit.cover,
                              )),
                        ),
                        8.horizontalSpace,
                        Text(
                          name ?? "", //'Ahmad Gouse',
                          style: AppTextStyles.textStylePoppinsMedium
                              .copyWith(fontSize: 16.sp, color: AppColors.colorWhite),
                        ),
                        8.horizontalSpace,
                        GestureDetector(
                          onTap: () {
                            _handleFollowUnfollowButtonPressed(peopleId);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(70),
                              border: Border.all(width: 1, color: const Color(0xffDDDFE6)),
                              color: AppColors.colorWhite.withOpacity(0.20),
                            ),
                            child: Center(
                              child: Text(
                                (isFollowing ?? false)
                                    ? 'Following'
                                    : (isRequested ?? false)
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
                            restaurantName ?? "Restaurant name not available",
                            style: AppTextStyles.textStylePoppinsMedium.copyWith(
                              fontSize: 13.sp,
                              color: AppColors.colorWhite,
                            ),
                          ),
                          Text(
                            address != null && address.length > 40
                                ? '${address.substring(0, 40)}...'
                                : address ?? 'Restaurant address not available',
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
                      onTap: () => postFeedNotifier.likeUnlikePost(() {}, postId ?? ""),
                      child: ((isLiked ?? false) || state.isDoubleTapped)
                          ? Image.asset(Assets.redHeart)
                          : Image.asset(Assets.like)),
                  15.verticalSpace,
                  GestureDetector(
                    onTap: () => AutoRouter.of(context).push(PostCommentsRoute(
                      postId: widget.postList?.id ??'',
                    )),
                    child: Column(
                      children: [
                        Image.asset(Assets.comments),
                        Text(
                          ((commentCount ?? 0) > 9)
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
                      onTap: () => postFeedNotifier.saveUnsavePost(() {}, postId ?? ""),
                      child: (isSaved ?? false)
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
                restaurantRating ?? "",
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
              title ?? "",
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
              description ?? "",
              style: AppTextStyles.textStylePoppinsRegular.copyWith(
                fontSize: 10.sp,
                color: AppColors.colorWhite,
              ),
            ),
          )
        ],
      ),
    );
  }
}
