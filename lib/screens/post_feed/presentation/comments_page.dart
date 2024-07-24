import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/core/utils/common_util.dart';
import 'package:for_the_table/screens/post_feed/domain/postFeed_model.dart';
import 'package:for_the_table/screens/post_feed/presentation/widgets/comment_item.dart';
import 'package:for_the_table/widgets/app_button.dart';
import '../../../core/constants/app_urls.dart';
import '../shared/provider.dart';

@RoutePage()
class CommentsPage extends ConsumerStatefulWidget {
  const CommentsPage({
    super.key,
    required this.postInfoList,
  });
  final DataOfPostModel postInfoList;

  @override
  ConsumerState<CommentsPage> createState()=> _CommentsPageState();
}

class _CommentsPageState extends ConsumerState<CommentsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final postFeedNotifier = ref.read(postFeedNotifierProvider.notifier);
      await postFeedNotifier.getPostFeed();
    });
  }

  @override
  Widget build(BuildContext context) {
    final postFeedState = ref.watch(postFeedNotifierProvider);
    final postFeedNotifier = ref.watch(postFeedNotifierProvider.notifier);
    final String postId = widget.postInfoList.id;
    final String name = widget.postInfoList.userInfo.fullName;
    final String profileImage =
        "${AppUrls.profilePicLocation}/${widget.postInfoList.userInfo.profileImage}";
    final String postImage = "${AppUrls.postImageLocation}${widget.postInfoList.file}";
    final String title = widget.postInfoList.title;
    final String description = widget.postInfoList.description;
    final String? restaurantName = widget.postInfoList.restaurantInfo?.name;
    final String? rating = widget.postInfoList.restaurantInfo?.rating;
    final String? address = widget.postInfoList.restaurantInfo?.address;
    final String cuisine = widget.postInfoList.preferenceInfo?.title ?? "No cuisine";
    final int commentCount = widget.postInfoList.commentCount;
    final int amount = widget.postInfoList.commentCount;
    final bool isSaved = widget.postInfoList.isSave;
    final bool isLiked = widget.postInfoList.isMyLike;
    final comments = postFeedState.commentInfoList
        ?.where((comment) => comment.postId == postId)
        .toList();

    return Scaffold(
      backgroundColor: AppColors.colorCommentPageBg,
      body: SingleChildScrollView(
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
                                  image: NetworkImage(
                                    profileImage,
                                  ),
                                  fit: BoxFit.cover,
                                )),
                          ),
                          8.horizontalSpace,
                          Text(
                            name,
                            style: AppTextStyles.textStylePoppinsMedium
                                .copyWith(
                                    fontSize: 16.sp,
                                    color: AppColors.colorWhite),
                          ),
                          8.horizontalSpace,
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(70),
                              border: Border.all(
                                  width: 1, color: const Color(0xffDDDFE6)),
                              color: AppColors.colorWhite.withOpacity(0.10),
                            ),
                            child: Center(
                              child: Text(
                                'Following',
                                style: AppTextStyles.textStylePoppinsRegular
                                    .copyWith(
                                  color: AppColors.colorWhite,
                                  fontSize: 10.sp,
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
                                cuisine,
                                style: AppTextStyles.textStylePoppinsRegular
                                    .copyWith(
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
                      isLiked
                          ? Image.asset(Assets.redHeart)
                          : Image.asset(Assets.like),
                      15.verticalSpace,
                      Column(
                        children: [
                          Image.asset(Assets.comments),
                          Text(
                              (commentCount > 9) ? commentCount.toString() : "0${commentCount.toString()}",
                              style: AppTextStyles.textStylePoppinsRegular.copyWith(
                              color: AppColors.colorWhite,
                              fontSize: 10.sp,
                            ),
                           )
                          ]
                      ),
                      10.verticalSpace,
                      isSaved
                          ? Image.asset(Assets.saved, scale: 2,)
                          : Image.asset(Assets.bookmark),
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
                        restaurantName!,
                        style: AppTextStyles.textStylePoppinsMedium.copyWith(
                          fontSize: 13.sp,
                          color: AppColors.colorWhite,
                        ),
                      ),
                      Text(
                        address != null && address.length > 40
                            ? '${address.substring(0, 40)}...'
                            : address ?? 'Address not available',
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
                    rating!,
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
                    '\$${amount} For 2',
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
                    description,
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
              postFeedState.isCommentLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.colorWhite,))
              :comments!.isEmpty
              ? Center(child: Text("Be the first to comment in this post.",
                style: AppTextStyles.textStylePoppinsMedium.copyWith(
                fontSize: 12.sp,
                color: AppColors.colorPrimaryAlpha,
              )))
              : CommentItem(commentInfoList:comments),
              20.verticalSpace,
              Container(
                width: double.infinity,
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
                    children: [
                      SizedBox(
                        height: 130.h,
                        child: TextField(
                          controller: postFeedNotifier.commentController,
                          style: AppTextStyles.textStylePoppinsRegular
                              .copyWith(color: AppColors.colorWhite),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Write a comment',
                              hintStyle: AppTextStyles.textStylePoppinsRegular
                                  .copyWith(
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
                          await postFeedNotifier.postComment(() async {
                            dismissKeyboard(context);
                           }, postId);
                        },
                        text: 'Submit',
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
