import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/core/utils/common_util.dart';
import 'package:for_the_table/screens/home/domain/post_model.dart';
import 'package:for_the_table/screens/home/presentation/widgets/comment_item.dart';
import 'package:for_the_table/screens/home/presentation/widgets/like_icon_widget.dart';
import 'package:for_the_table/screens/home/presentation/widgets/save_icon_widget.dart';
import 'package:for_the_table/widgets/app_button.dart';
import '../../../core/constants/app_urls.dart';
import '../shared/provider.dart';

@RoutePage()
class PostCommentsPage extends ConsumerWidget {
  final Post post;

  const PostCommentsPage({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeNotifierProvider);
    final stateNotifier = ref.watch(homeNotifierProvider.notifier);
    final deviceHeight = MediaQuery.sizeOf(context).height;

    final String? postId = post.id;
    final String userId = post.userInfo?.id ?? "";
    final String name = post.userInfo?.fullName ?? "";
    final String profileImage = "${AppUrls.profilePicLocation}/${post.userInfo?.profileImage}";
    final String? description = post.description;
    final String? restaurantName = post.restaurantInfo?.name;
    final String? rating = post.restaurantInfo?.rating;
    final String? address = post.restaurantInfo?.address;
    final String? cuisine = post.preferenceInfo?.title;
    final int commentCount = post.commentCount ?? 0;
    const int amount = 100; //post.commentCount;
    final bool? isSaved = post.isSave;
    final bool? isLiked = post.isMyLike;
    final comments = state.commentsList?.where((comment) => comment.postId == postId).toList();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.colorCommentPageBg,
        body: SizedBox(
          height: deviceHeight,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(18.0).r,
                  child: Column(
                    children: [
                      50.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 20.w,
                                    height: 20.h,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: profileImage == '${AppUrls.profilePicLocation}/'
                                              ? const AssetImage(Assets.avatar)
                                              : CachedNetworkImageProvider(profileImage),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                  8.horizontalSpace,
                                  Text(
                                    name,
                                    style: AppTextStyles.textStylePoppinsMedium
                                        .copyWith(fontSize: 16.sp, color: AppColors.colorWhite),
                                  ),
                                  8.horizontalSpace,
                                  GestureDetector(
                                    onTap: () =>
                                        stateNotifier.onFollowUnfollowButtonPressed(userId),
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(70),
                                        border:
                                            Border.all(width: 1, color: const Color(0xffDDDFE6)),
                                        color: AppColors.colorWhite.withOpacity(0.10),
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
                                  )
                                ],
                              ),
                              20.verticalSpace,
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
                                        cuisine ?? "No Cuisine",
                                        style: AppTextStyles.textStylePoppinsRegular.copyWith(
                                          color: AppColors.colorWhite,
                                          fontSize: 10.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                  13.horizontalSpace,
                                ],
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              20.verticalSpace,
                              LikeIconWidget(
                                isLiked: isLiked ?? false,
                                onTap: () => stateNotifier.likeUnlikePost(() {}, postId ?? ""),
                              ),
                              15.verticalSpace,
                              Column(children: [
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
                              ]),
                              10.verticalSpace,
                              SaveIconWidget(
                                isSaved: isSaved ?? false,
                                onTap: () => stateNotifier.saveUnsavePost(() {}, postId ?? ""),
                              ),
                            ],
                          )
                        ],
                      ),
                      18.verticalSpace,
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
                            rating ?? "4.0",
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
                            '\$$amount For 2',
                            style: AppTextStyles.textStyleUbuntuRegular.copyWith(
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
                          description ?? "",
                          style: AppTextStyles.textStylePoppinsMedium.copyWith(
                            fontSize: 13.sp,
                            color: AppColors.colorWhite,
                          ),
                        ),
                      ),
                      15.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Comments',
                            style: AppTextStyles.textStylePoppinsMedium.copyWith(
                              fontSize: 11.sp,
                              color: AppColors.colorWhite,
                            ),
                          ),
                          10.horizontalSpace,
                          Flexible(
                            child: Divider(
                              thickness: 1,
                              color: AppColors.colorWhite.withOpacity(0.10),
                            ),
                          ),
                        ],
                      ),
                      18.verticalSpace,
                      comments!.isEmpty
                          ? Center(
                              child: Text("Be the first to comment in this post.",
                                  style: AppTextStyles.textStylePoppinsMedium.copyWith(
                                    fontSize: 12.sp,
                                    color: AppColors.colorPrimaryAlpha,
                                  )))
                          : CommentItem(commentsList: comments),
                      200.verticalSpace,
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  height: deviceHeight < 700 ? 173.h : 160.h,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.colorPrimary.withOpacity(0.90),
                          AppColors.colorPrimary.withOpacity(0.70),
                        ]),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 1,
                      color: AppColors.colorCommentBoxBorder,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 100.h,
                          child: TextField(
                            controller: stateNotifier.commentController,
                            style: AppTextStyles.textStylePoppinsRegular
                                .copyWith(color: AppColors.colorWhite),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Write a comment',
                                hintStyle: AppTextStyles.textStylePoppinsRegular.copyWith(
                                  fontSize: 13.sp,
                                  color: AppColors.colorWhite.withOpacity(0.70),
                                )),
                            maxLines: null,
                            expands: true,
                            keyboardType: TextInputType.multiline,
                          ),
                        ),
                        AppButton(
                          onPressed: () async {
                            await stateNotifier.postComment(() async {
                              dismissKeyboard(context);
                              await stateNotifier.getPostFeed();
                            }, postId ?? "");
                          },
                          text: 'Submit',
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
