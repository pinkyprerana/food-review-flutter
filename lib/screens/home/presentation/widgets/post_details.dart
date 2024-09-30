import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/infrastructure/hive_database.dart';
import 'package:for_the_table/core/routes/app_router.dart';
import 'package:for_the_table/core/shared/providers.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/screens/home/shared/provider.dart';
import '../../../../core/constants/app_urls.dart';
import '../../../../widgets/like_icon.dart';
import '../../../../widgets/save_icon.dart';
import '../../domain/post_feed_model.dart';

class PostDetails extends ConsumerStatefulWidget {
  final DataOfPostModel post;

  const PostDetails({
    super.key,
    required this.post,
  });

  @override
  ConsumerState<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends ConsumerState<PostDetails> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final stateNotifier = ref.read(homeNotifierProvider.notifier);

      stateNotifier.assignFollowStatus(
        widget.post.isFollowing ?? false,
        widget.post.isFollowingRequest ?? false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
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
    final stateNotifier = ref.watch(homeNotifierProvider.notifier);
    final state = ref.watch(homeNotifierProvider);
    final bool? isSaved = widget.post.isSave;
    final bool? isLiked = widget.post.isMyLike;
    final hive = ref.read(hiveProvider);
    final loggedInUserId = hive.box.get(AppPreferenceKeys.userId);
    // final deviceSize = MediaQuery.sizeOf(context);

    return Container(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10).r,
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  AutoRouter.of(context).push(PeopleProfileRoute(
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
                      name != null && name.length > 15 ? '${name.substring(0, 15)}...' : name ?? "",
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.textStylePoppinsMedium
                          .copyWith(fontSize: 16.sp, color: AppColors.colorWhite),
                    ),
                  ],
                ),
              ),
              8.horizontalSpace,
              if (loggedInUserId != peopleId) ...[
                GestureDetector(
                  onTap: () async {
                    await stateNotifier.onFollowUnfollowButtonPressed(peopleId ?? '');
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(70),
                      color: AppColors.colorWhite.withOpacity(0.20),
                    ),
                    child: Center(
                      child: Text(
                        state.followStatus,
                        style: AppTextStyles.textStylePoppinsRegular.copyWith(
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
                          borderRadius: BorderRadius.circular(70),
                          color: const Color(0xffACE9B6).withOpacity(0.31),
                        ),
                        child: Center(
                          child: Text(
                            cuisine ?? "", //'Chinese Cuisine',
                            style: AppTextStyles.textStylePoppinsRegular.copyWith(
                              color: const Color(0xff6BCE7B).withOpacity(0.85),
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
                  LikeIcon(
                    isLiked: isLiked ?? false,
                    onTap: () => stateNotifier.likeUnlikePost(() {}, postId ?? ""),
                  ),
                  15.verticalSpace,
                  GestureDetector(
                    onTap: () => AutoRouter.of(context).push(PostCommentsRoute(
                      postId: widget.post.id ??"",
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
                  SaveIcon(
                    isSaved: isSaved ?? false,
                    onTap: () => stateNotifier.saveUnsavePost(() {}, postId ?? ""),
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
          ],
          15.verticalSpace,
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              description ?? "", //'A memorable evening to be remembered.',
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
