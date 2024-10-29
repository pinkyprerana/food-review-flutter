import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/core/utils/common_util.dart';
import 'package:for_the_table/screens/home/presentation/widgets/comment_item.dart';
import 'package:for_the_table/screens/home/shared/provider.dart';
import 'package:for_the_table/screens/profile/shared/providers.dart';
import 'package:for_the_table/widgets/app_button.dart';
import '../../../core/constants/app_urls.dart';
import '../../home/presentation/widgets/like_icon_widget.dart';
import '../../home/presentation/widgets/save_icon_widget.dart';
import '../../people_profile/shared/providers.dart';
import '../../restaurant/shared/provider.dart';
import '../../your_lists/shared/provider.dart';
import 'package:for_the_table/screens/home/domain/post_feed_model.dart';

///For home page, liked post page and post details page
@RoutePage()
class PostCommentsPage extends ConsumerStatefulWidget {
  const PostCommentsPage({
    super.key,
    required this.postId,
  });
  final String postId;

  @override
  ConsumerState<PostCommentsPage> createState() => _PostCommentsPageState();
}

class _PostCommentsPageState extends ConsumerState<PostCommentsPage> {
 bool isSubmitting = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final profileNotifier = ref.read(profileNotifierProvider.notifier);
      await profileNotifier.fetchlikedPosts();
      await profileNotifier.fetchDislikedPosts();
      final postFeedNotifier = ref.read(homeNotifierProvider.notifier);
      await postFeedNotifier.getPostFeed();
      final restaurantNotifier = ref.read(restaurantNotifierProvider.notifier);
      await restaurantNotifier.getRestaurants(ref: ref);
      await restaurantNotifier.getSavedRestaurants();
      final yourPeopleNotifier = ref.read(yourPeopleNotifierProvider.notifier);
      await yourPeopleNotifier.getAllUsersList(isFollowState: true);
    });
  }


  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeNotifierProvider);
    final profileState = ref.watch(profileNotifierProvider);
    final homeNotifier = ref.watch(homeNotifierProvider.notifier);

    if (homeState.postList == null ||
        homeState.postList!.isEmpty ||
        homeState.commentsList == null ||
        // profileState.dislikedPostsList.isEmpty ||
        // profileState.likedPostList.isEmpty ||
        profileState.commentsList == null
    ) {
      return const Center(
        child: CircularProgressIndicator(color: AppColors.colorWhite),
      );
    }

    // Fetch the post info from PostFeed
    final postFromHomeState = homeState.postList!.firstWhere(
          (post) => post.id == widget.postId,
      orElse: () => const DataOfPostModel(id: ''),
    );

    // Fetch the post info from LikedPstList
    final postFromLikedPost = profileState.likedPostList.firstWhere(
          (post) => post.id == widget.postId,
      orElse: () => const DataOfPostModel(id: ''),
    );

    // Fetch the post info from DislikedPstList
    final postFromDislikedPost = profileState.dislikedPostsList.firstWhere(
          (post) => post.id == widget.postId,
      orElse: () => const DataOfPostModel(id: ''),
    );

    // Combine the PostList from all
    final postInfoList = postFromHomeState.id!.isNotEmpty
        ? postFromHomeState
        :  postFromLikedPost.id!.isNotEmpty
          ? postFromLikedPost
        : postFromDislikedPost;

    if (postInfoList.id==null) {
      return const Center(
        child: Text("Post id not found", style: TextStyle(color: AppColors.colorWhite)),
      );
    }

    final String postId = widget.postId;//postInfoList.id;
    final String userId = postInfoList.userInfo?.id ?? "";
    final String name = postInfoList.userInfo?.fullName ?? "";
    final String profileImage =
        "${AppUrls.profilePicLocation}/${postInfoList.userInfo?.profileImage}";
    final String? description = postInfoList.description;
    final String? restaurantName = postInfoList.restaurantInfo?.name;
    final String? rating = postInfoList.restaurantInfo?.rating;
    final String? address = postInfoList.restaurantInfo?.address;
    final String? cuisine = postInfoList.preferenceInfo?.title;
    final int commentCount = postInfoList.commentCount ?? 0;
    const int amount = 100; //widget.postInfoList.commentCount;
    final bool? isSaved = postInfoList.isSave;
    final bool? isLiked = postInfoList.isMyLike;
    // final bool? isFollowing = postInfoList.isFollowing;
    // final bool? isRequested = postInfoList.isFollowingRequest;
    final deviceHeight = MediaQuery.sizeOf(context).height;
    // final comments = [
    //   ...?homeState.commentsList?.where((comment) => comment.postId == postId),
    //   ...?profileState.commentsList?.where((comment) => comment.postId == postId)
    // ];

    //Solved unstable comments issue in liked & disliked post screen
    final List<CommentInfo> comments = [
      ...?homeState.commentsList?.where((comment) => comment.postId == postId),
      ...profileState.likedPostList
          .expand((post) => post.commentInfo ?? [])
          .where((comment) => comment.postId == postId),
      ...profileState.dislikedPostsList
          .expand((post) => post.commentInfo ?? [])
          .where((comment) => comment.postId == postId),
    ];


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
                                    name.length > 15
                                        ? '${name.substring(0, 15)}...'
                                        : name,
                                    style: AppTextStyles.textStylePoppinsMedium
                                        .copyWith(fontSize: 16.sp, color: AppColors.colorWhite),
                                  ),
                                  8.horizontalSpace,
                                  GestureDetector(
                                    onTap: () =>
                                        homeNotifier.onFollowUnfollowButtonPressed(userId),
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
                                          homeState.followStatus,
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
                                onTap: () => homeNotifier.likeUnlikePost(() {}, postId),
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
                                onTap: () => homeNotifier.saveUnsavePost(() {}, postId),
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
                      comments.isEmpty
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
                bottom: 10,
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
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 100.h,
                            child: TextField(
                              controller: homeNotifier.commentController,
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
                            onPressed: isSubmitting
                                ? null
                                : () async {
                              setState(() {
                                isSubmitting = true;
                              });

                              await homeNotifier.postComment(() async {
                                dismissKeyboard(context);
                                _fetchPostDetails(userId);
                              }, postId);

                              setState(() {
                                isSubmitting = false;
                              });
                            },
                            text: 'Submit',
                          ),
                        ],
                      ),
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

  Future<void> _fetchPostDetails(String userId) async {
    final followNotifier = ref.read(followNotifierProvider.notifier);
    await followNotifier.getAllPostsOfOtherUserProfile(
            () {}, userId);
    await followNotifier.getOtherPeopleDetails(() {},userId);
    final postFeedNotifier = ref.read(homeNotifierProvider.notifier);
    await postFeedNotifier.getPostFeed();
    final profileNotifier = ref.read(profileNotifierProvider.notifier);
    await profileNotifier.fetchlikedPosts();
    await profileNotifier.fetchDislikedPosts();
  }

}


///For only home page
// import 'package:auto_route/auto_route.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:for_the_table/core/constants/assets.dart';
// import 'package:for_the_table/core/styles/app_colors.dart';
// import 'package:for_the_table/core/styles/app_text_styles.dart';
// import 'package:for_the_table/core/utils/common_util.dart';
// import 'package:for_the_table/screens/home/presentation/widgets/comment_item.dart';
// import 'package:for_the_table/screens/home/shared/provider.dart';
// import 'package:for_the_table/screens/profile/shared/providers.dart';
// import 'package:for_the_table/widgets/app_button.dart';
// import '../../../core/constants/app_urls.dart';
// import '../../home/presentation/widgets/like_icon_widget.dart';
// import '../../home/presentation/widgets/save_icon_widget.dart';
// import '../../people_profile/shared/providers.dart';
// import '../../restaurant/shared/provider.dart';
// import '../../your_lists/shared/provider.dart';
// import 'package:for_the_table/screens/home/domain/post_feed_model.dart';
//
//
// @RoutePage()
// class PostCommentsPage extends ConsumerStatefulWidget {
//   const PostCommentsPage({
//     super.key,
//     required this.postId,
//   });
//   final String postId;
//
//   @override
//   ConsumerState<PostCommentsPage> createState() => _PostCommentsPageState();
// }
//
// class _PostCommentsPageState extends ConsumerState<PostCommentsPage> {
//   late DataOfPostModel postInfoList;
//   late List<CommentInfo> comments;
//
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
//       final postFeedNotifier = ref.read(homeNotifierProvider.notifier);
//       await postFeedNotifier.getPostFeed();
//       final restaurantNotifier = ref.read(restaurantNotifierProvider.notifier);
//       await restaurantNotifier.getRestaurants(ref: ref);
//       await restaurantNotifier.getSavedRestaurants();
//       final yourPeopleNotifier = ref.read(yourPeopleNotifierProvider.notifier);
//       await yourPeopleNotifier.getAllUsersList(isFollowState: true);
//     });
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     final homeState = ref.watch(homeNotifierProvider);
//     final homeNotifier = ref.watch(homeNotifierProvider.notifier);
//
//     if (homeState.postList == null ||
//         homeState.postList!.isEmpty ||
//         homeState.commentsList == null) {
//       return const Center(
//         child: CircularProgressIndicator(color: AppColors.colorWhite),
//       );
//     }
//
//     postInfoList = homeState.postList!.firstWhere(
//           (post) => post.id == widget.postId,
//       orElse: () => const DataOfPostModel(id: ''),
//     );
//
//
//     if (postInfoList.id == null) {
//       return const Center(
//         child: Text("Post id not found", style: TextStyle(color: AppColors.colorWhite)),
//       );
//     }
//
//
//     final String postId = widget.postId;//postInfoList.id;
//     final String userId = widget.postId;//postInfoList.id;
//     final String name = postInfoList.userInfo?.fullName ?? "";
//     final String profileImage =
//         "${AppUrls.profilePicLocation}/${postInfoList.userInfo?.profileImage}";
//     final String? description = postInfoList.description;
//     final String? restaurantName = postInfoList.restaurantInfo?.name;
//     final String? rating = postInfoList.restaurantInfo?.rating;
//     final String? address = postInfoList.restaurantInfo?.address;
//     final String? cuisine = postInfoList.preferenceInfo?.title;
//     final int commentCount = postInfoList.commentCount ?? 0;
//     const int amount = 100; //widget.postInfoList.commentCount;
//     final bool? isSaved = postInfoList.isSave;
//     final bool? isLiked = postInfoList.isMyLike;
//     // final bool? isFollowing = postInfoList.isFollowing;
//     // final bool? isRequested = postInfoList.isFollowingRequest;
//     final deviceHeight = MediaQuery.sizeOf(context).height;
//     final comments = homeState.commentsList?.where((comment) => comment.postId == postId).toList() ?? [];
//
//
//     return GestureDetector(
//       onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
//       child: Scaffold(
//         backgroundColor: AppColors.colorCommentPageBg,
//         body: SizedBox(
//           height: deviceHeight,
//           child: Stack(
//             children: [
//               SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.all(18.0).r,
//                   child: Column(
//                     children: [
//                       50.verticalSpace,
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                     width: 20.w,
//                                     height: 20.h,
//                                     decoration: BoxDecoration(
//                                         shape: BoxShape.circle,
//                                         image: DecorationImage(
//                                           image: profileImage == '${AppUrls.profilePicLocation}/'
//                                               ? const AssetImage(Assets.avatar)
//                                               : CachedNetworkImageProvider(profileImage),
//                                           fit: BoxFit.cover,
//                                         )),
//                                   ),
//                                   8.horizontalSpace,
//                                   Text(
//                                     name.length > 15
//                                         ? '${name.substring(0, 15)}...'
//                                         : name,
//                                     style: AppTextStyles.textStylePoppinsMedium
//                                         .copyWith(fontSize: 16.sp, color: AppColors.colorWhite),
//                                   ),
//                                   8.horizontalSpace,
//                                   GestureDetector(
//                                     onTap: () =>
//                                         homeNotifier.onFollowUnfollowButtonPressed(userId),
//                                     child: Container(
//                                       padding: const EdgeInsets.all(10),
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(70),
//                                         border:
//                                         Border.all(width: 1, color: const Color(0xffDDDFE6)),
//                                         color: AppColors.colorWhite.withOpacity(0.10),
//                                       ),
//                                       child: Center(
//                                         child: Text(
//                                           homeState.followStatus,
//                                           style: AppTextStyles.textStylePoppinsRegular.copyWith(
//                                             color: AppColors.colorWhite,
//                                             fontSize: 10.sp,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                               20.verticalSpace,
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                     padding: const EdgeInsets.all(10),
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(70),
//                                       color: AppColors.colorGreen,
//                                     ),
//                                     child: Center(
//                                       child: Text(
//                                         cuisine ?? "No Cuisine",
//                                         style: AppTextStyles.textStylePoppinsRegular.copyWith(
//                                           color: AppColors.colorWhite,
//                                           fontSize: 10.sp,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   13.horizontalSpace,
//                                 ],
//                               ),
//                             ],
//                           ),
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               20.verticalSpace,
//                               LikeIconWidget(
//                                 isLiked: isLiked ?? false,
//                                 onTap: () => homeNotifier.likeUnlikePost(() {}, postId),
//                               ),
//                               15.verticalSpace,
//                               Column(children: [
//                                 Image.asset(Assets.comments),
//                                 Text(
//                                   (commentCount > 9)
//                                       ? commentCount.toString()
//                                       : "0${commentCount.toString()}",
//                                   style: AppTextStyles.textStylePoppinsRegular.copyWith(
//                                     color: AppColors.colorWhite,
//                                     fontSize: 10.sp,
//                                   ),
//                                 )
//                               ]),
//                               10.verticalSpace,
//                               SaveIconWidget(
//                                 isSaved: isSaved ?? false,
//                                 onTap: () => homeNotifier.saveUnsavePost(() {}, postId),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                       18.verticalSpace,
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Image.asset(
//                             Assets.location2,
//                           ),
//                           8.horizontalSpace,
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 restaurantName ?? "Restaurant name not available",
//                                 style: AppTextStyles.textStylePoppinsMedium.copyWith(
//                                   fontSize: 13.sp,
//                                   color: AppColors.colorWhite,
//                                 ),
//                               ),
//                               Text(
//                                 address != null && address.length > 40
//                                     ? '${address.substring(0, 40)}...'
//                                     : address ?? 'Restaurant address not available',
//                                 style: AppTextStyles.textStylePoppinsRegular.copyWith(
//                                   fontSize: 10.sp,
//                                   color: AppColors.colorWhite,
//                                 ),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                       10.verticalSpace,
//                       Row(
//                         children: [
//                           Image.asset(Assets.star),
//                           2.horizontalSpace,
//                           Image.asset(Assets.star),
//                           2.horizontalSpace,
//                           Image.asset(Assets.star),
//                           2.horizontalSpace,
//                           Image.asset(Assets.star),
//                           2.horizontalSpace,
//                           Image.asset(Assets.star),
//                           5.horizontalSpace,
//                           Text(
//                             rating ?? "4.0",
//                             style: AppTextStyles.textStylePoppinsRegular.copyWith(
//                               fontSize: 10.sp,
//                               color: AppColors.colorWhite,
//                             ),
//                           ),
//                           15.horizontalSpace,
//                           Padding(
//                             padding: const EdgeInsets.only(bottom: 5.0),
//                             child: Image.asset(Assets.price),
//                           ),
//                           8.horizontalSpace,
//                           Text(
//                             '\$$amount For 2',
//                             style: AppTextStyles.textStyleUbuntuRegular.copyWith(
//                               fontSize: 10.sp,
//                               color: AppColors.colorWhite,
//                             ),
//                           )
//                         ],
//                       ),
//                       20.verticalSpace,
//                       Align(
//                         alignment: Alignment.topLeft,
//                         child: Text(
//                           description ?? "",
//                           style: AppTextStyles.textStylePoppinsMedium.copyWith(
//                             fontSize: 13.sp,
//                             color: AppColors.colorWhite,
//                           ),
//                         ),
//                       ),
//                       15.verticalSpace,
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Comments',
//                             style: AppTextStyles.textStylePoppinsMedium.copyWith(
//                               fontSize: 11.sp,
//                               color: AppColors.colorWhite,
//                             ),
//                           ),
//                           10.horizontalSpace,
//                           Flexible(
//                             child: Divider(
//                               thickness: 1,
//                               color: AppColors.colorWhite.withOpacity(0.10),
//                             ),
//                           ),
//                         ],
//                       ),
//                       18.verticalSpace,
//                       comments.isEmpty
//                           ? Center(
//                           child: Text("Be the first to comment in this post.",
//                               style: AppTextStyles.textStylePoppinsMedium.copyWith(
//                                 fontSize: 12.sp,
//                                 color: AppColors.colorPrimaryAlpha,
//                               )))
//                           : CommentItem(commentsList: comments),
//                       200.verticalSpace,
//                     ],
//                   ),
//                 ),
//               ),
//               Positioned(
//                 bottom: 10,
//                 right: 0,
//                 left: 0,
//                 child: Container(
//                   height: deviceHeight < 700 ? 173.h : 160.h,
//                   width: double.maxFinite,
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                         begin: Alignment.topCenter,
//                         end: Alignment.bottomCenter,
//                         colors: [
//                           AppColors.colorPrimary.withOpacity(0.90),
//                           AppColors.colorPrimary.withOpacity(0.70),
//                         ]),
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(
//                       width: 1,
//                       color: AppColors.colorCommentBoxBorder,
//                     ),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: SingleChildScrollView(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           SizedBox(
//                             height: 100.h,
//                             child: TextField(
//                               controller: homeNotifier.commentController,
//                               style: AppTextStyles.textStylePoppinsRegular
//                                   .copyWith(color: AppColors.colorWhite),
//                               decoration: InputDecoration(
//                                   border: InputBorder.none,
//                                   hintText: 'Write a comment',
//                                   hintStyle: AppTextStyles.textStylePoppinsRegular.copyWith(
//                                     fontSize: 13.sp,
//                                     color: AppColors.colorWhite.withOpacity(0.70),
//                                   )),
//                               maxLines: null,
//                               expands: true,
//                               keyboardType: TextInputType.multiline,
//                             ),
//                           ),
//                           AppButton(
//                             onPressed: () async {
//                               await homeNotifier.postComment(() async {
//                                 dismissKeyboard(context);
//                                 _fetchPostDetails();
//                               }, postId);
//                             },
//                             text: 'Submit',
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<void> _fetchPostDetails() async {
//     final followNotifier = ref.read(followNotifierProvider.notifier);
//     await followNotifier.getAllPostsOfOtherUserProfile(
//             () {}, postInfoList.userInfo?.id ?? "");
//     await followNotifier.getOtherPeopleDetails(() {},postInfoList.userInfo?.id ?? "");
//     final postFeedNotifier = ref.read(homeNotifierProvider.notifier);
//     await postFeedNotifier.getPostFeed();
//     final profileNotifier = ref.read(profileNotifierProvider.notifier);
//     await profileNotifier.fetchlikedPosts();
//     await profileNotifier.fetchDislikedPosts();
//   }
//
// }
