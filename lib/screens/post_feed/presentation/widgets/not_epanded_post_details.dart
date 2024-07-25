import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/routes/app_router.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/screens/post_feed/domain/postFeed_model.dart';
import 'package:for_the_table/screens/post_feed/shared/provider.dart';
import '../../../../core/constants/app_urls.dart';
import '../../../profile/shared/providers.dart';

class NotExpandedPostDetails extends ConsumerStatefulWidget {
  final DataOfPostModel postList;
  const NotExpandedPostDetails({super.key, required this.postList});

  @override
  ConsumerState<NotExpandedPostDetails> createState() => _NotExpandedPostDetailsState();
}

class _NotExpandedPostDetailsState extends ConsumerState<NotExpandedPostDetails> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final profileNotifier = ref.read(profileNotifierProvider.notifier);
      await profileNotifier.getSavedList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final String peopleId = widget.postList.userInfo.id;
    final String name = widget.postList.userInfo.fullName;
    final String profileImage =
        "${AppUrls.profilePicLocation}/${widget.postList.userInfo.profileImage}";
    // final String postImage = widget.postList.file;
    // final String title = widget.postList.title;
    final String description = widget.postList.description;
    final String? restaurantName = widget.postList.restaurantInfo?.name;
    final String? address = widget.postList.restaurantInfo?.address;
    final String cuisine = widget.postList.preferenceInfo.title;
    final int commentCount = widget.postList.commentCount;
    final String postId = widget.postList.id;
    // final postFeedState = ref.watch(postFeedNotifierProvider);
    final postFeedNotifier = ref.watch(postFeedNotifierProvider.notifier);
    final bool isSaved = widget.postList.isSave;
    final bool isLiked = widget.postList.isMyLike;

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
                      peoplename: name, //'Ahmad Gouse',
                      peopleimage: profileImage, //'assets/images/temp/follower-sample2.png',
                      peopleId: peopleId,
                      isFollow: true));
                },
                child: Row(
                  children: [
                    Container(
                      width: 20.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                              profileImage,
                            ),
                            fit: BoxFit.cover,
                          )),
                    ),
                    8.horizontalSpace,
                    Text(
                      name, //'Ahmad Gouse',
                      style: AppTextStyles.textStylePoppinsMedium
                          .copyWith(fontSize: 16.sp, color: AppColors.colorWhite),
                    ),
                  ],
                ),
              ),
              8.horizontalSpace,
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(70),
                  color: AppColors.colorWhite.withOpacity(0.20),
                ),
                child: Center(
                  child: Text(
                    'Following',
                    style: AppTextStyles.textStylePoppinsRegular.copyWith(
                      color: AppColors.colorWhite,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              )
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
                            cuisine, //'Chinese Cuisine',
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
                  GestureDetector(
                      onTap: () => postFeedNotifier.likeUnlikePost(() {}, postId),
                      child: isLiked ? Image.asset(Assets.redHeart) : Image.asset(Assets.like)),
                  15.verticalSpace,
                  GestureDetector(
                    onTap: () => AutoRouter.of(context).push(CommentsRoute(
                      postInfoList: widget.postList,
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
                      onTap: () => postFeedNotifier.saveUnsavePost(() {}, postId),
                      child: isSaved
                          ? Image.asset(
                              Assets.saved,
                              scale: 2,
                            )
                          : Image.asset(Assets.bookmark)),
                ],
              )
            ],
          ),

          15.verticalSpace,
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              description, //'A memorable evening to be remembered.',
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
