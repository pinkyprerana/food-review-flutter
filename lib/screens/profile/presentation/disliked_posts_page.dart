import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/screens/profile/presentation/widgets/disliked_post_widget.dart';
import 'package:for_the_table/screens/profile/shared/providers.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

@RoutePage()
class DislikedPostsPage extends ConsumerStatefulWidget {
  const DislikedPostsPage({super.key});

  @override
  ConsumerState<DislikedPostsPage> createState() => _DislikedPostsPageState();
}

class _DislikedPostsPageState extends ConsumerState<DislikedPostsPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final stateNotifier = ref.read(profileNotifierProvider.notifier);
      await stateNotifier.fetchDislikedPosts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(profileNotifierProvider);
    final stateNotifier = ref.watch(profileNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        // leadingWidth: 60,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            // width: 20.w,
            // height: 20.h,
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
                Icon(Icons.arrow_back_ios, color: AppColors.colorPrimary, size: 15.h),
              ],
            ),
          ),
        ),
        title: Text(
          'Disliked Posts',
          style: AppTextStyles.textStylePoppinsBold.copyWith(
            color: AppColors.colorPrimary,
            fontSize: 16.sp,
          ),
        ),
      ),
      body: state.isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColors.colorPrimary,
              ),
            )
          : state.dislikedPostsList.isEmpty
              ? Center(
                  child: Text(
                    'Your disliked posts will be listed here.',
                    style: AppTextStyles.textStyleLatoMedium,
                  ),
                )
              : SmartRefresher(
                  controller: stateNotifier.dislikePostRefreshController,
                  enablePullDown: false,
                  enablePullUp: true,
                  onLoading: stateNotifier.loadMoreDislikePosts,
                  footer: CustomFooter(
                    builder: (BuildContext context, mode) {
                      Widget body;
                      if (mode == LoadStatus.idle) {
                        body = const SizedBox.shrink();
                      } else if (mode == LoadStatus.loading) {
                        body = const CupertinoActivityIndicator();
                      } else if (mode == LoadStatus.failed) {
                        body = Text(
                          "Load Failed!Click retry!",
                          style: AppTextStyles.textStylePoppinsLight,
                        );
                      } else if (mode == LoadStatus.canLoading) {
                        body = Text(
                          "release to load more",
                          style: AppTextStyles.textStylePoppinsLight,
                        );
                      } else {
                        body = Text(
                          "No more Data",
                          style: AppTextStyles.textStylePoppinsLight,
                        );
                      }
                      return SizedBox(
                        height: 55.0,
                        child: Center(child: body),
                      );
                    },
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0).r,
                      child: Column(
                        children: [
                          // 10.verticalSpace,
                          ListView.builder(
                            itemCount: state.dislikedPostsList.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.all(0),
                            itemBuilder: (context, index) {
                              final dislikedPost = state.dislikedPostsList[index];

                              return DislikedPostWidget(
                                userId: dislikedPost.userInfo?.id,
                                userFullName: dislikedPost.userInfo?.fullName,
                                userDisplayPicture: dislikedPost.userInfo?.profileImage,
                                postId: dislikedPost.id,
                                postPicture: dislikedPost.file,
                                cuisine: dislikedPost.preferenceInfo?.title,
                                address: dislikedPost.location,
                                comment: dislikedPost.howWasIt,
                                commentCount: dislikedPost.commentCount,
                                isFollowing: dislikedPost.isFollowing,
                                isRequested: dislikedPost.isFollowingRequest,
                                isSaved: dislikedPost.isSave,
                              );
                            },
                          ),
                          // 10.verticalSpace,
                        ],
                      ),
                    ),
                  ),
                ),
    );
  }
}
