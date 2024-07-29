import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/widgets/app_button.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../core/constants/app_urls.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/routes/app_router.dart';
import '../../../people_profile/shared/providers.dart';
import '../../../your_lists/shared/provider.dart';

class FollowersList extends ConsumerStatefulWidget {
  const FollowersList({super.key});

  @override
  ConsumerState<FollowersList> createState() => _FollowersListState();
}

class _FollowersListState extends ConsumerState<FollowersList> {
  void handleFollowButtonPressed(userId) {
    final followNotifier = ref.read(FollowNotifierProvider.notifier);
    final yourPeopleNotifier = ref.read(yourPeopleNotifierProvider.notifier);
    followNotifier.followUnfollow(() {}, userId);
    yourPeopleNotifier.getAllUsersList(isFollowState: true);
  }

  @override
  Widget build(BuildContext context) {
    final followState = ref.watch(yourPeopleNotifierProvider);
    final allUsersList = followState.allUsersList;
    final stateNotifier = ref.watch(yourPeopleNotifierProvider.notifier);

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'List Of Your Followers',
          style: AppTextStyles.textStylePoppinsMedium.copyWith(
            color: AppColors.colorPrimary,
            fontSize: 13.sp,
          ),
        ),
        16.verticalSpace,
        SizedBox(
          height: 0.55.sh,
          child: SmartRefresher(
            controller: followState.selectedIndex == 0
                ? stateNotifier.allUsersRefreshController
                : stateNotifier.allUsersRefreshController,
            enablePullDown: false,
            enablePullUp: true,
            onLoading: followState.selectedIndex == 0
                ? stateNotifier.loadMoreUsers
                : stateNotifier.loadMoreUsers,
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
            child: followState.isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.colorPrimary,
                    ),
                  )
                : allUsersList.isNotEmpty
                    ? GridView.builder(
                        physics: const ClampingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.w,
                          mainAxisSpacing: 10.h,
                          childAspectRatio: 1,
                        ),
                        itemCount: allUsersList.length, //6,
                        itemBuilder: (context, index) {
                          if (index < 0 || index >= allUsersList.length) {
                            return const SizedBox.shrink();
                          }
                          final users = allUsersList[index];
                          final profileImage =
                              '${AppUrls.profilePicLocation}/${users.profileImage}';
                          final isFollowing = ref.watch(FollowNotifierProvider.select((state) =>
                              state.userFollowStatus[users.id] ?? users.isFollowing));
                          final isRequested = ref.watch(FollowNotifierProvider.select((state) =>
                          state.userFollowStatus[users.id] ?? users.isFollowingRequest));

                          return GestureDetector(
                            onTap: () => AutoRouter.of(context).push(
                              PeopleProfileRoute(
                                peoplename: users.fullName.toString(),
                                peopleimage: profileImage,
                                peopleId: users.id ?? '',
                                isFollow: users.isFollowerRequest ?? false,
                                isRequested: users.isFollowingRequest ??false,
                                isFollowing: users.isFollowing ??false,
                              ),
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(8.0).r,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(color: AppColors.colorGrey3),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 24.w,
                                    height: 24.w,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: profileImage == '${AppUrls.profilePicLocation}/'
                                          ? Container(
                                              width: 49.w,
                                              height: 49.w,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                  image: AssetImage(Assets.noProfileImage),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            )
                                          : CachedNetworkImage(
                                              imageUrl: profileImage,
                                              placeholder: (context, url) =>
                                                  const CircularProgressIndicator(),
                                              errorWidget: (context, url, error) => Image.asset(
                                                Assets.avatar,
                                                scale: 1,
                                                fit: BoxFit.cover,
                                              ),
                                              imageBuilder: (context, imageProvider) => Container(
                                                width: 49.w,
                                                height: 49.w,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                    image: imageProvider,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Text(
                                    users.fullName.toString(),
                                    //followers[index]['name']!,
                                    style: AppTextStyles.textStylePoppinsMedium.copyWith(
                                      color: AppColors.colorPrimary,
                                      fontSize: 13.sp,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    'Joined May 29, 2024',
                                    style: AppTextStyles.textStylePoppinsLight.copyWith(
                                      color: AppColors.colorPrimaryAlpha,
                                      fontSize: 8.sp,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  10.verticalSpace,
                                  AppButton(
                                    onPressed: (){
                                      handleFollowButtonPressed(users.id ??"");
                                    },
                                    height: 21.h,
                                    width: 64.w,
                                    radius: 8,
                                    color: (isFollowing??false) ? AppColors.colorWhite: (isRequested??false) ?AppColors.colorGrey2: AppColors.colorNavy,
                                    child: Text(
                                      // 'Follow',
                                      (isFollowing ?? false) ? 'Following' : (isRequested??false) ? 'Requested' : 'Follow',
                                      style: AppTextStyles.textStylePoppinsBold.copyWith(
                                        color: (isFollowing??false) ? AppColors.colorBlack: (isRequested??false) ?AppColors.colorBlack: AppColors.colorWhite,
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    : Center(
                        child: Text(
                          'You have no follower.',
                          style: AppTextStyles.textStylePoppins,
                        ),
                      ),
          ),
        ),
      ],
    );
  }
}
