import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/screens/profile/presentation/widgets/disliked_post_widget.dart';
import 'package:for_the_table/screens/profile/shared/providers.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

@RoutePage()
class LikedPostsPage extends ConsumerStatefulWidget {
  const LikedPostsPage({super.key});

  @override
  ConsumerState<LikedPostsPage> createState() => _LikedPostsPageState();
}

class _LikedPostsPageState extends ConsumerState<LikedPostsPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final stateNotifier = ref.read(profileNotifierProvider.notifier);
      stateNotifier.fetchlikedPosts();
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
          'Liked Posts',
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
                    'Your liked posts will be listed here.',
                    style: AppTextStyles.textStyleLatoMedium,
                  ),
                )
              : SmartRefresher(
                  controller: stateNotifier.likePostRefreshController,
                  enablePullDown: false,
                  enablePullUp: true,
                  onLoading: stateNotifier.loadMorelikePosts,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0).r,
                      child: Column(
                        children: [
                          ListView.builder(
                            itemCount: state.likedPostList.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.all(0),
                            itemBuilder: (context, index) {
                              final likedPost = state.likedPostList[index];

                              return DislikedPostWidget(
                                userId: likedPost.userInfo?.id,
                                userFullName: likedPost.userInfo?.fullName,
                                userDisplayPicture: likedPost.userInfo?.profileImage,
                                postPicture: likedPost.file,
                                cuisine: likedPost.preferenceInfo?.title,
                                address: likedPost.location,
                                comment: likedPost.howWasIt,
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
