import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/base/shared/providers.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/infrastructure/hive_database.dart';
import 'package:for_the_table/core/routes/app_router.dart';
import 'package:for_the_table/core/shared/providers.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/core/utils/app_log.dart';
import 'package:for_the_table/core/utils/toast.dart';
import 'package:for_the_table/home/presentation/widgets/follow_option_widget.dart';
import 'package:for_the_table/home/presentation/widgets/home_post_widget.dart';
import 'package:for_the_table/home/presentation/widgets/post_widget.dart';
import 'package:for_the_table/home/presentation/widgets/restaurant_widget.dart';
import 'package:for_the_table/list/shared/provider.dart';
import 'package:for_the_table/restaurant/shared/provider.dart';
import 'package:for_the_table/widgets/notification_icon.dart';
import 'package:glassmorphism/glassmorphism.dart';

import '../../core/constants/app_urls.dart';
import '../../people_profile/shared/providers.dart';
import '../../post_feed/presentation/widgets/comments_icon.dart';
import '../../post_feed/shared/provider.dart';
import '../../your_lists/shared/provider.dart';

@RoutePage()
class HomePageNew extends ConsumerStatefulWidget {
  const HomePageNew({super.key});

  @override
  ConsumerState<HomePageNew> createState() => _HomePageNewState();
}

class _HomePageNewState extends ConsumerState<HomePageNew> {
  List followOptions = [
    {'image': Assets.follow1, 'name': 'Haylie Lipshutz'},
    {'image': Assets.follow2, 'name': 'Skylar Bergson'},
    {'image': Assets.follow1, 'name': 'Haylie Lipshutz'},
    {'image': Assets.follow2, 'name': 'Skylar Bergson'},
  ];

  // List restaurantlist = [
  //   {'image': Assets.rest1},
  //   {'image': Assets.rest2},
  //   {'image': Assets.rest3},
  //   {'image': Assets.rest4},
  // ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final stateNotifier = ref.read(restaurantNotifierProvider.notifier);
      await stateNotifier.getHomeRestaurants(context: context);
      final postFeedNotifier = ref.watch(postFeedNotifierProvider.notifier);
      await postFeedNotifier.getPostFeed();
      final followNotifier = ref.watch(YourPeopleNotifierProvider.notifier);
      await followNotifier.getAllFollowerList();
      await followNotifier.getAllFollowingList();
    });
  }

  @override
  void dispose() {
    super.dispose();
    final postFeedNotifier = ref.read(postFeedNotifierProvider.notifier);
    postFeedNotifier.clearPostFeed();
  }

  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var hive = ref.watch(hiveProvider);
    final token = hive.box.get(AppPreferenceKeys.token);
    final followState = ref.watch(YourPeopleNotifierProvider);
    final followerList = followState.followerList;
    final state = ref.watch(baseNotifierProvider);
    final stateNotifier = ref.watch(baseNotifierProvider.notifier);
    final stateOfListScreen = ref.watch(listProvider);
    final stateNotifierOfListScreen = ref.watch(listProvider.notifier);
    final stateNotifierRestaurant =
        ref.watch(restaurantNotifierProvider.notifier);
    final stateRestaurant = ref.watch(restaurantNotifierProvider);
    final postFeedState = ref.watch(postFeedNotifierProvider);
    final postFeedList = postFeedState.postList;
    print("token____________${token}");
    print("postFeedList____________${postFeedList}");

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
              // onTap: () => AutoRouter.of(context).push(const NotificationRoute()),
              child: Container(
                height: 26.r,
                width: 26.r,
                margin: const EdgeInsets.only(right: 15).r,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.colorGrey2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                    child: Image.asset(
                  Assets.search,
                  color: AppColors.colorPrimary,
                )),
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
                      style: AppTextStyles.textStylePoppinsMedium.copyWith(
                          fontSize: 13.sp, color: AppColors.colorPrimary),
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
              SizedBox(
                height: 180.0.h,
                child: ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: followerList.length, //followOptions.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      if (index < 0 || index >= followerList.length) {
                        return const SizedBox.shrink();
                      }
                      final followers = followerList[index];
                      final imgpath = followers.profileImage != ""
                          ? followers.profileImage
                          : "";
                      final profileImage =
                          '${AppUrls.profilePicLocation}/$imgpath';
                      print(profileImage);
                      return GestureDetector(
                        onTap: () {
                          AutoRouter.of(context).push(PeopleProfileRoute(
                              peoplename: followers.fullName
                                  .toString(), //'Ahmad Gouse',
                              peopleimage: profileImage.toString(),
                              peopleId: followers.id,
                              isFollow: followers.isFollow
                              // 'assets/images/temp/follower-sample2.png',
                              ));
                        },
                        child: FollowOptionWidget(
                            followersId: followers.id,
                            imgpath:
                                profileImage, //followOptions[index]['image'],
                            name: followers.fullName
                                .toString(), //followOptions[index]['name'],
                            isFollow: followers.isFollow),
                      );
                    }),
              ),
              10.verticalSpace,
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Restaurant List',
                      style: AppTextStyles.textStylePoppinsMedium.copyWith(
                          fontSize: 13.sp, color: AppColors.colorPrimary),
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
              (stateRestaurant.isLoading)
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.colorPrimary,
                      ),
                    )
                  : (stateRestaurant.homeRestaurantList != null &&
                          (stateRestaurant.homeRestaurantList?.isNotEmpty ??
                              false))
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: ListView.builder(
                              padding: const EdgeInsets.all(0),
                              itemCount:
                                  stateRestaurant.homeRestaurantList?.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () => AutoRouter.of(context)
                                      .push(RestaurantDetailRoute(
                                    numberOfReviews: stateRestaurant
                                            .homeRestaurantList?[index]
                                            .userRatingsTotal ??
                                        '',
                                    address: stateRestaurant
                                            .homeRestaurantList?[index]
                                            .address ??
                                        'No name',
                                    image: stateRestaurant
                                            .homeRestaurantList?[index]
                                            .image?[0] ??
                                        '',
                                    lat: stateRestaurant
                                            .homeRestaurantList?[index].lat ??
                                        '',
                                    lng: stateRestaurant
                                            .homeRestaurantList?[index].lng ??
                                        '',
                                    name: stateRestaurant
                                            .homeRestaurantList?[index].name ??
                                        '',
                                    rating: stateRestaurant
                                            .homeRestaurantList?[index]
                                            .rating ??
                                        '',
                                    description: stateRestaurant
                                            .homeRestaurantList?[index]
                                            .description ??
                                        '',
                                  )),
                                  child: RestaurantWidget(
                                    // imgpath: restaurantlist[index]['image'],
                                    imgpath:
                                        'https://forthetable.dedicateddevelopers.us/uploads/restaurant/${stateRestaurant.homeRestaurantList?[index].image?[0]}',
                                    name: stateRestaurant
                                            .homeRestaurantList?[index].name ??
                                        'No Name',
                                    address: stateRestaurant
                                            .homeRestaurantList?[index]
                                            .address ??
                                        'No address',
                                    rating: stateRestaurant
                                            .homeRestaurantList?[index]
                                            .rating ??
                                        '0',
                                    numberOfReviews: stateRestaurant
                                            .homeRestaurantList?[index]
                                            .userRatingsTotal ??
                                        '0',
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
                      style: AppTextStyles.textStylePoppinsMedium.copyWith(
                          fontSize: 13.sp, color: AppColors.colorPrimary),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (postFeedState.postList.isNotEmpty) {
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
              //list of posts
              (postFeedState.isLoading)
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.colorPrimary,
                      ),
                    )
                  : (postFeedState.postList != null &&
                          (postFeedState.postList.isNotEmpty ?? false))
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: ListView.builder(
                              itemCount: postFeedList.length > 3
                                  ? 3
                                  : postFeedList.length, //3
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.all(0),
                              itemBuilder: (context, index) {
                                final postList = postFeedList[index];
                                return PostWidget(
                                  postList: postList,
                                );
                              }),
                        )
                      : Center(
                          child: Text(
                            'No post found',
                            style: AppTextStyles.textStylePoppins,
                          ),
                        ),
              90.verticalSpace,
            ],
          ),
        ));
  }
}
