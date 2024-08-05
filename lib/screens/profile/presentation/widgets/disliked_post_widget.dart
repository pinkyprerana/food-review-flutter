import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/app_urls.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/routes/app_router.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/screens/post_feed/domain/post_feed_model.dart';
import 'package:for_the_table/screens/post_feed/shared/provider.dart';
import 'package:for_the_table/screens/profile/shared/providers.dart';
import 'package:glassmorphism/glassmorphism.dart';
import '../../../../widgets/save_button.dart';
import '../../../people_profile/shared/providers.dart';
import '../../../post_feed/presentation/widgets/comments_icon.dart';
import '../../../your_lists/shared/provider.dart';


class DislikedPostWidget extends ConsumerStatefulWidget {
  final String? userId;
  final String? userFullName;
  final String? userDisplayPicture;
  final String? postId;
  final String? postPicture;
  final String? cuisine;
  final String? address;
  final String? comment;
  final int? commentCount;
  final bool? isFollowing;
  final bool? isRequested;
  final bool? isSaved;

  const DislikedPostWidget({
    super.key,
    this.userId,
    this.userFullName,
    this.userDisplayPicture,
    this.cuisine,
    this.address,
    this.comment,
    this.commentCount,
    this.postId,
    this.postPicture,
    this.isFollowing,
    this.isRequested,
    this.isSaved
  });
 @override
  ConsumerState<DislikedPostWidget> createState()=>  _DislikedPostWidgetState();
}

class _DislikedPostWidgetState extends ConsumerState<DislikedPostWidget> {


  void _handleFollowUnfollowButtonPressed(userId) {
    final followNotifier = ref.read(followNotifierProvider.notifier);
    final yourPeopleNotifier = ref.read(yourPeopleNotifierProvider.notifier);
    final profileNotifier = ref.read(profileNotifierProvider.notifier);
    followNotifier.followUnfollow(() {}, userId);
    yourPeopleNotifier.getAllUsersList(isFollowState: true);
    profileNotifier.fetchDislikedPosts(isLoadingStatus: true);
    profileNotifier.fetchlikedPosts(isLoadingStatus: true);
  }

  @override
  Widget build(BuildContext context) {
   final postFeedState = ref.watch(postFeedNotifierProvider);
   final postFeedNotifier = ref.watch(postFeedNotifierProvider.notifier);
   final DataOfPostModel? postInfo = postFeedState.postList?.firstWhere((post) => post.id == widget.postId,
       orElse: ()=>  const DataOfPostModel(id: '', file: '')
   );

    return Container(
      margin: const EdgeInsets.only(bottom: 10).r,
      width: double.infinity,
      // height: mediaQuery.height * 0.45,
      // height: 295.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            image: (widget.postPicture?.isEmpty ?? false)
                ? const AssetImage(Assets.noRestaurantImage)
                : CachedNetworkImageProvider('${AppUrls.postImageLocation}/${widget.postPicture}'),
            fit: BoxFit.cover),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        AutoRouter.of(context).push(
                          PeopleProfileRoute(
                            peopleId: widget.userId??'',
                          ),
                        );
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
                                image: (widget.userDisplayPicture?.isEmpty ?? false)
                                    ? const AssetImage(Assets.noProfileImage)
                                    : CachedNetworkImageProvider(
                                        '${AppUrls.profilePicLocation}/${widget.userDisplayPicture}'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          8.horizontalSpace,
                          Text(
                            widget.userFullName ?? '',
                            style: AppTextStyles.textStylePoppinsMedium
                                .copyWith(fontSize: 16.sp, color: AppColors.colorWhite),
                          ),
                          8.horizontalSpace,
                          GestureDetector(
                            onTap: (){
                              _handleFollowUnfollowButtonPressed(widget.userId);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(70),
                                color: AppColors.colorWhite.withOpacity(0.20),
                              ),
                              child: Center(
                                child: Text(
                                  (widget.isFollowing??false) ? 'Unfollow': (widget.isRequested ?? false) ? 'Requested' :'Follow',
                                  style: AppTextStyles.textStylePoppinsRegular.copyWith(
                                    color: AppColors.colorWhite,
                                    fontSize: 10.sp,
                                  ),
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
                                      widget.cuisine ?? 'No Cuisine',
                                      style: AppTextStyles.textStylePoppinsRegular.copyWith(
                                        color: AppColors.colorWhite,
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                  ),
                                ),
                                8.horizontalSpace,
                                // Image.asset(Assets.dislike_emoji),
                                // 5.horizontalSpace,
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
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    widget.address ?? '',
                                    maxLines: 2,
                                    style: AppTextStyles.textStylePoppinsMedium.copyWith(
                                      fontSize: 13.sp,
                                      color: AppColors.colorWhite,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () => AutoRouter.of(context).push(CommentsRoute(
                            postInfoList: postInfo! ,
                          )),
                          child: Column(
                            children: [
                              Image.asset(Assets.like),
                              15.verticalSpace,
                               CommentsIcon(
                                commentCount: widget.commentCount??0,
                              ),
                              10.verticalSpace,
                              GestureDetector(
                                onTap: () => postFeedNotifier.saveUnsavePost(() {
                                  final profileNotifier = ref.read(profileNotifierProvider.notifier);
                                  profileNotifier.fetchDislikedPosts(isLoadingStatus: true);
                                  profileNotifier.fetchlikedPosts(isLoadingStatus: true);
                                }, widget.postId ?? ""),
                                child: SaveButtonWidget(
                                  isSavePost: postFeedState.isSavePost,
                                  isSaved: widget.isSaved ?? false,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    10.verticalSpace,
                    Text(
                      widget.comment ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.textStylePoppinsMedium.copyWith(
                        fontSize: 12.sp,
                        color: AppColors.colorWhite,
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
