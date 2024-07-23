import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/app_urls.dart';
import 'package:for_the_table/screens/your_lists/application/your_people_notifier.dart';
import 'package:for_the_table/screens/your_lists/application/your_people_state.dart';
import 'package:for_the_table/screens/your_lists/domain/follow_type_model.dart';
import 'package:for_the_table/widgets/custom_search_field.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_text_styles.dart';
import '../../../widgets/app_button.dart';
import '../shared/provider.dart';
import 'widgets/custom_widgets.dart';

@RoutePage()
class YourPeopleListPage extends ConsumerStatefulWidget {
  final int? tabIndex;

  const YourPeopleListPage({
    super.key,
    this.tabIndex,
  });

  @override
  ConsumerState<YourPeopleListPage> createState() => _YourPeopleListPageState();
}

class _YourPeopleListPageState extends ConsumerState<YourPeopleListPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final followNotifier = ref.watch(yourPeopleNotifierProvider.notifier);
      if (widget.tabIndex != null) {
        followNotifier.updateSelectedIndex(widget.tabIndex ?? 0);
      }
      await followNotifier.getAllFollowerList();
      await followNotifier.getAllFollowingList();
      await followNotifier.getAllRequestList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final _selectedIndex = ref.watch(yourPeopleNotifierProvider).selectedIndex;
    final stateNotifier = ref.read(yourPeopleNotifierProvider.notifier);
    final followState = ref.watch(yourPeopleNotifierProvider);
    final followList = followState.followingList;
    final followerList = followState.followerList;
    final requestList = followState.followRequestsList; //requestList

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
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
          'Your Follow List',
          style: AppTextStyles.textStylePoppinsBold.copyWith(
            color: AppColors.colorPrimary,
            fontSize: 16.sp,
          ),
        ),
      ),
      body: SmartRefresher(
        controller: followState.selectedIndex == 0
            ? stateNotifier.followersRefreshController
            : followState.selectedIndex == 1
                ? stateNotifier.followingRefreshController
                : stateNotifier.requestRefreshController,
        enablePullDown: false,
        enablePullUp: true,
        onLoading: followState.selectedIndex == 0
            ? stateNotifier.loadMoreFollowers
            : followState.selectedIndex == 1
                ? stateNotifier.loadMoreFollowings
                : stateNotifier.loadMoreRequests,
        footer: CustomFooter(
          builder: (BuildContext context, mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = const SizedBox.shrink();
            } else if (mode == LoadStatus.loading) {
              body = const CupertinoActivityIndicator();
            } else if (mode == LoadStatus.failed) {
              body = Text(
                "Load Failed! Click retry!",
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
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomSearchField(
                  hint: 'Search',
                ),
                16.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(
                    3,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: FilterButton(
                        text: index == 0
                            ? 'Followers'
                            : index == 1
                                ? 'Following'
                                : 'Requests',
                        isSelected: _selectedIndex == index,
                        onPressed: () {
                          stateNotifier.updateSelectedIndex(index);
                          index == 0
                              ? stateNotifier.getAllFollowerList()
                              : index == 1
                                  ? stateNotifier.getAllFollowingList()
                                  : stateNotifier.getAllRequestList();
                        },
                      ),
                    ),
                  ).toList(),
                ),
                16.verticalSpace,
                _selectedIndex == 0
                    ? _followersList(
                        followerList,
                        followState,
                        stateNotifier,
                      )
                    : (_selectedIndex == 1
                        ? _followingList(
                            followList,
                            followState,
                            stateNotifier,
                          )
                        : _requestsList(
                            requestList,
                            followState,
                            stateNotifier,
                          )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _followersList(
    List<Users> followerList,
    YourPeopleState followState,
    YourPeopleNotifier stateNotifier,
  ) {
    return followState.followerList.isEmpty
        ? Center(
            child: Text(
              'You have no followers.',
              style: AppTextStyles.textStylePoppinsMedium.copyWith(
                fontSize: 13.sp,
                color: AppColors.colorBlack,
              ),
            ),
          )
        : Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Followers List',
                  style: AppTextStyles.textStylePoppinsMedium.copyWith(
                    fontSize: 13.sp,
                    color: AppColors.colorBlack,
                  ),
                ),
              ),
              20.verticalSpace,
              GridView.builder(
                itemCount: followerList.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 4,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  if (index < 0 || index >= followerList.length) {
                    return const SizedBox.shrink();
                  }
                  final follower = followerList[index];
                  final profileImage = '${AppUrls.profilePicLocation}/${follower.profileImage}';

                  return CustomCard(
                    name: follower.fullName ?? '',
                    date: "Joined May 5, 2018",
                    imagePath: profileImage,
                    button: (follower.isFollowing ?? false)
                        ? const SizedBox.shrink()
                        : AppButton(
                            height: 30,
                            width: (follower.isFollowingRequest ?? false) ? 120 : 80,
                            text: (follower.isFollowingRequest ?? false)
                                ? 'Requested'
                                : 'Follow', // update here
                            onPressed: () {
                              stateNotifier.followFriend(follower.id ?? '');
                            },
                            color: AppColors.colorCommentBoxBorder,
                          ),
                  );
                },
              ),
            ],
          );
  }

  Widget _followingList(
    List<Users> followList,
    YourPeopleState followState,
    YourPeopleNotifier stateNotifier,
  ) {
    return followState.followingList.isEmpty
        ? Center(
            child: Text(
              'You are not following anyone.',
              style: AppTextStyles.textStylePoppinsMedium.copyWith(
                fontSize: 13.sp,
                color: AppColors.colorBlack,
              ),
            ),
          )
        : Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'List of Your Following',
                  style: AppTextStyles.textStylePoppinsMedium.copyWith(
                    fontSize: 13.sp,
                    color: AppColors.colorBlack,
                  ),
                ),
              ),
              20.verticalSpace,
              GridView.builder(
                itemCount: followList.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 4,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  if (index < 0 || index >= followList.length) {
                    return const SizedBox.shrink();
                  }
                  final following = followList[index];
                  final profileImage = '${AppUrls.profilePicLocation}/${following.profileImage}';

                  return CustomCard(
                    name: following.fullName ?? '',
                    date: "Joined May 5, 2024",
                    imagePath: profileImage,
                    button: AppButton(
                      height: 30,
                      width: 100,
                      text: 'Unfollow',
                      onPressed: () async {
                        await stateNotifier.unfollowFriend(following.id ?? '');
                      },
                      color: AppColors.colorCommentBoxBorder,
                    ),
                  );
                },
              ),
            ],
          );
  }

  Widget _requestsList(
    List<Users> requestList,
    YourPeopleState followState,
    YourPeopleNotifier stateNotifier,
  ) {
    return followState.followRequestsList.isEmpty
        ? Center(
            child: Text(
              'You have no requests.',
              style: AppTextStyles.textStylePoppinsMedium.copyWith(
                fontSize: 13.sp,
                color: AppColors.colorBlack,
              ),
            ),
          )
        : Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Pending Requests',
                  style: AppTextStyles.textStylePoppinsMedium.copyWith(
                    fontSize: 13.sp,
                    color: AppColors.colorBlack,
                  ),
                ),
              ),
              20.verticalSpace,
              GridView.builder(
                itemCount: requestList.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 4,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  if (index < 0 || index >= requestList.length) {
                    return const SizedBox.shrink();
                  }
                  final requests = requestList[index];
                  final profileImage = '${AppUrls.profilePicLocation}/${requests.profileImage}';

                  return CustomCard(
                    name: requests.fullName ?? '',
                    date: "Joined May 5, 2018",
                    imagePath: profileImage,
                    button: AppButton(
                      height: 30,
                      width: 150,
                      text: "Accept Request",
                      onPressed: () async {
                        await stateNotifier.acceptFriendRequest(requests.followerRequestId ?? '');
                      },
                      color: AppColors.colorCommentBoxBorder,
                    ),
                  );
                },
              ),
            ],
          );
  }
}
