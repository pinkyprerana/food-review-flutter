import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/routes/app_router.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/core/utils/toast.dart';
import 'package:for_the_table/screens/home/presentation/widgets/follow_option_widget.dart';
import 'package:for_the_table/screens/home/presentation/widgets/post_widget.dart';
import 'package:for_the_table/screens/home/presentation/widgets/restaurant_widget.dart';
import 'package:for_the_table/screens/home/shared/provider.dart';
import 'package:for_the_table/screens/your_lists/shared/provider.dart';
import 'package:for_the_table/widgets/notification_icon.dart';
import '../../../core/constants/app_urls.dart';
import '../../base/shared/providers.dart';
import '../../list/shared/provider.dart';
import '../../post_feed/shared/provider.dart';

@RoutePage()
class HomePageNew extends ConsumerStatefulWidget {
  const HomePageNew({super.key});

  @override
  ConsumerState<HomePageNew> createState() => _HomePageNewState();
}

class _HomePageNewState extends ConsumerState<HomePageNew> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final homeNotifier = ref.read(homeNotifierProvider.notifier);
      final followNotifier = ref.read(yourPeopleNotifierProvider.notifier);
      final postFeedNotifier = ref.read(postFeedNotifierProvider.notifier);
      followNotifier.setAllUsersListToZero();
      Future.wait([
        homeNotifier.fetchRestaurants(),
        followNotifier.getAllUsersList(),
        postFeedNotifier.getPostFeed(),
      ]);
    });
  }

  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final followState = ref.watch(yourPeopleNotifierProvider);
    final allUsersList = followState.allUsersList;
    final stateNotifier = ref.watch(baseNotifierProvider.notifier);
    final stateNotifierOfListScreen = ref.watch(listProvider.notifier);
    final homeState = ref.watch(homeNotifierProvider);
    final postFeedState = ref.watch(postFeedNotifierProvider);
    final postFeedList = postFeedState.postList;

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        leadingWidth: 0,
        title: Text(
          'FOR THE TABLE',
          style: AppTextStyles.textStylePoppinsBold.copyWith(
            color: AppColors.colorPrimary,
            letterSpacing: 3.0,
          ),
        ),
        actions: [
          GestureDetector(
            // onTap: () => AutoRouter.of(context).push(SearchRoute()),
            child: Container(
              height: 26.r,
              width: 26.r,
              margin: const EdgeInsets.only(right: 5).r,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.colorGrey2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Image.asset(
                  Assets.search,
                  color: AppColors.colorPrimary,
                ),
              ),
            ),
          ),
          const NotificationIcon(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Follow',
                    style: AppTextStyles.textStylePoppinsMedium
                        .copyWith(fontSize: 13.sp, color: AppColors.colorPrimary),
                  ),
                  GestureDetector(
                    onTap: () {
                      stateNotifier.setBottomNavIndexTo1();
                      stateNotifierOfListScreen.setListIndex(0);
                    },
                    child: Text(
                      'View All',
                      style: AppTextStyles.textStylePoppinsRegular.copyWith(
                        fontSize: 13.sp,
                        color: AppColors.colorPrimaryAlpha,
                      ),
                    ),
                  )
                ],
              ),
            ),
            5.verticalSpace,
            Container(
              alignment: Alignment.topLeft,
              height: 180.0.h,
              child: followState.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.colorPrimary,
                      ),
                    )
                  : allUsersList.isNotEmpty
                      ? ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: allUsersList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            if (index < 0 || index >= allUsersList.length) {
                              return const SizedBox.shrink();
                            }
                            final followers = allUsersList[index];
                            final imgpath =
                                followers.profileImage != "" ? followers.profileImage : "";
                            final profileImage = '${AppUrls.profilePicLocation}/$imgpath';

                            return GestureDetector(
                                onTap: () {
                                  AutoRouter.of(context).push(PeopleProfileRoute(
                                    // peoplename: followers.fullName.toString(),
                                    // peopleimage: profileImage.toString(),
                                    peopleId: followers.id ?? '',
                                    // isFollow: followers.isFollowerRequest ?? false,
                                    // isRequested: followers.isFollowingRequest ?? false,
                                    // isFollowing: followers.isFollowing ?? false
                                  ));
                                },
                                child: FollowOptionWidget(
                                    followersId: followers.id ?? '',
                                    imgpath: profileImage,
                                    name: followers.fullName.toString(),
                                    isFollow: followers.isFollowerRequest ?? false,
                                    isRequested: followers.isFollowingRequest ?? false,
                                    isFollowing: followers.isFollowing ?? false));
                          },
                        )
                      : Center(
                          child: Text(
                            'You have no follower.',
                            style: AppTextStyles.textStylePoppins,
                          ),
                        ),
            ),
            10.verticalSpace,
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Restaurant List',
                    style: AppTextStyles.textStylePoppinsMedium
                        .copyWith(fontSize: 13.sp, color: AppColors.colorPrimary),
                  ),
                  GestureDetector(
                    onTap: () {
                      stateNotifier.setBottomNavIndexTo1();
                      stateNotifierOfListScreen.setListIndex(1);
                    },
                    child: Text(
                      'View All',
                      style: AppTextStyles.textStylePoppinsRegular.copyWith(
                        fontSize: 13.sp,
                        color: AppColors.colorPrimaryAlpha,
                      ),
                    ),
                  )
                ],
              ),
            ),
            5.verticalSpace,
            (homeState.isLoading)
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.colorPrimary,
                    ),
                  )
                : (homeState.restaurantList != null &&
                        (homeState.restaurantList?.isNotEmpty ?? false))
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: ListView.builder(
                            padding: const EdgeInsets.all(0),
                            itemCount: homeState.restaurantList?.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () => AutoRouter.of(context).push(RestaurantDetailRoute(
                                  isBookmarked: homeState.restaurantList?[index].isSave ?? false,
                                  restaurantId: homeState.restaurantList?[index].id ?? '',
                                  numberOfReviews:
                                      homeState.restaurantList?[index].userRatingsTotal ?? '',
                                  address: homeState.restaurantList?[index].address ?? 'No name',
                                  image: homeState.restaurantList?[index].image?[0] ?? '',
                                  lat: homeState.restaurantList?[index].lat ?? '',
                                  lng: homeState.restaurantList?[index].lng ?? '',
                                  name: homeState.restaurantList?[index].name ?? '',
                                  rating: homeState.restaurantList?[index].rating ?? '',
                                  description: homeState.restaurantList?[index].description ?? '',
                                )),
                                child: RestaurantWidget(
                                  imgpath:
                                      'https://forthetable.dedicateddevelopers.us/uploads/restaurant/${homeState.restaurantList?[index].image?[0]}',
                                  name: homeState.restaurantList?[index].name ?? 'No Name',
                                  address: homeState.restaurantList?[index].address ?? 'No address',
                                  rating: homeState.restaurantList?[index].rating ?? '0',
                                  numberOfReviews:
                                      homeState.restaurantList?[index].userRatingsTotal ?? '0',
                                ),
                              );
                            }),
                      )
                    : Center(
                        child: Text(
                          'No restaurants',
                          style: AppTextStyles.textStylePoppins,
                        ),
                      ),
            10.verticalSpace,
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Post List',
                    style: AppTextStyles.textStylePoppinsMedium
                        .copyWith(fontSize: 13.sp, color: AppColors.colorPrimary),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (postFeedState.postList!.isNotEmpty) {
                        stateNotifier.setBottomNavIndexToDefault();
                      } else {
                        showToastMessage("No post found");
                      }
                    },
                    // onTap: () {
                    //   stateNotifier.setBottomNavIndexToDefault();
                    // },
                    child: Text(
                      'View All',
                      style: AppTextStyles.textStylePoppinsRegular.copyWith(
                        fontSize: 13.sp,
                        color: AppColors.colorPrimaryAlpha,
                      ),
                    ),
                  )
                ],
              ),
            ),
            5.verticalSpace,
            postFeedState.isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.colorPrimary,
                    ),
                  )
                : postFeedState.postList!.isEmpty
                    ? Center(
                        child: Text(
                          'No post found',
                          style: AppTextStyles.textStylePoppins,
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: ListView.builder(
                            itemCount: postFeedList!.length > 3 ? 3 : postFeedList.length, //3
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.all(0),
                            itemBuilder: (context, index) {
                              final postList = postFeedList[index];
                              final commentInfoList = postList.commentInfo ?? [];
                              return PostWidget(
                                  isSaving: postFeedState.isSavePost,
                                  postList: postList,
                                  commentInfoList: commentInfoList);
                            }),
                      ),
            90.verticalSpace,
          ],
        ),
      ),
    );
  }
}
