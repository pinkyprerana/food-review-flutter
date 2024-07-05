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
import 'package:for_the_table/home/presentation/widgets/follow_option_widget.dart';
import 'package:for_the_table/home/presentation/widgets/home_post_widget.dart';
import 'package:for_the_table/home/presentation/widgets/post_widget.dart';
import 'package:for_the_table/home/presentation/widgets/restaurant_widget.dart';
import 'package:for_the_table/list/shared/provider.dart';
import 'package:for_the_table/restaurant/shared/provider.dart';
import 'package:for_the_table/widgets/notification_icon.dart';
import 'package:glassmorphism/glassmorphism.dart';

import '../../post_feed/presentation/widgets/comments_icon.dart';
import '../../post_feed/shared/provider.dart';

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
      postFeedNotifier.getPostFeed();
    });
  }

  @override
  Widget build(BuildContext context) {
    var hive = ref.watch(hiveProvider);
    // AppLog.log(
    //     '--------------TOKEN------------${hive.box.get(AppPreferenceKeys.token)}');
    final state = ref.watch(baseNotifierProvider);
    final stateNotifier = ref.watch(baseNotifierProvider.notifier);
    final stateOfListScreen = ref.watch(listProvider);
    final stateNotifierOfListScreen = ref.watch(listProvider.notifier);
    final stateNotifierRestaurant =
        ref.watch(restaurantNotifierProvider.notifier);
    final stateRestaurant = ref.watch(restaurantNotifierProvider);

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
                    itemCount: followOptions.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          AutoRouter.of(context).push(PeopleProfileRoute(
                            peoplename: 'Ahmad Gouse',
                            peopleimage:
                                'assets/images/temp/follower-sample2.png',
                          ));
                        },
                        child: FollowOptionWidget(
                          imgpath: followOptions[index]['image'],
                          name: followOptions[index]['name'],
                        ),
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
                        stateNotifier.setBottomNavIndexToDefault();
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
              //list of posts
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: ListView.builder(
                    itemCount: 3, //postFeedList.length > 3 ? 3 : postFeedList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(0),
                    itemBuilder: (context, index) {
                      // final post = postFeedList[index];
                      // print("______post___________${post}");
                      // return PostWidget(postList: postFeedList,);
                      return Container(
                        margin: const EdgeInsets.only(bottom: 10).r,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                              image: AssetImage(Assets.post2), fit: BoxFit.cover),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0).r,
                          child: Column(
                            children: [
                              //const Spacer(),
                              80.verticalSpace,
                              GlassmorphicContainer(
                                width: double.infinity,
                                height: 170.h,
                                borderRadius: 10,
                                linearGradient: LinearGradient(
                                  colors: [
                                    const Color(0xff0A0A0A).withOpacity(0.1),
                                    const Color(0xff000000).withOpacity(0)
                                  ],
                                ),
                                border: 1,
                                blur: 5,
                                borderGradient: const LinearGradient(colors: [
                                  Colors.transparent,
                                  Colors.transparent,
                                ]),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15, left: 15, right: 15, bottom: 10)
                                      .r,
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          AutoRouter.of(context).push(PeopleProfileRoute(
                                            peoplename: 'Ahmad Gouse',
                                            peopleimage:
                                            'assets/images/temp/follower-sample2.png',
                                          ));
                                        },
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 20.w,
                                              height: 20.h,
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                      Assets.follow1,
                                                    ),
                                                    fit: BoxFit.cover,
                                                  )),
                                            ),
                                            8.horizontalSpace,
                                            Text(
                                              'Ahmad Gouse',//postFeedList[index].userInfo.fullName,
                                              style: AppTextStyles.textStylePoppinsMedium
                                                  .copyWith(
                                                  fontSize: 16.sp,
                                                  color: AppColors.colorWhite),
                                            ),
                                            8.horizontalSpace,
                                            Container(
                                              padding: const EdgeInsets.symmetric(
                                                  vertical: 8, horizontal: 8),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(70),
                                                color: AppColors.colorWhite.withOpacity(0.20),
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
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              5.verticalSpace,
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
                                                        'Chinese Cuisine',
                                                        style: AppTextStyles
                                                            .textStylePoppinsRegular
                                                            .copyWith(
                                                          color: AppColors.colorWhite,
                                                          fontSize: 10.sp,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  8.horizontalSpace,
                                                  // Image.asset(Assets.dislike_emoji),
                                                  5.horizontalSpace,
                                                  // Text(
                                                  //   'Didn\'t Like',
                                                  //   style: AppTextStyles.textStylePoppinsRegular
                                                  //       .copyWith(
                                                  //     fontSize: 10.sp,
                                                  //     color: AppColors.colorWhite,
                                                  //   ),
                                                  // )
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
                                                        'Starbucks LA, California',
                                                        style: AppTextStyles
                                                            .textStylePoppinsMedium
                                                            .copyWith(
                                                          fontSize: 13.sp,
                                                          color: AppColors.colorWhite,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Double road, Lorem City, LA',
                                                        style: AppTextStyles
                                                            .textStylePoppinsRegular
                                                            .copyWith(
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
                                              Image.asset(Assets.like),
                                              15.verticalSpace,
                                              const CommentsIcon(),
                                              10.verticalSpace,
                                              Image.asset(Assets.bookmark),
                                            ],
                                          )
                                        ],
                                      ),
                                      10.verticalSpace,
                                      Text(
                                        'A memorable evening to be remembered.',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: AppTextStyles.textStylePoppinsMedium.copyWith(
                                          fontSize: 12.sp,
                                          color: AppColors.colorWhite,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                              // ClipRRect(
                              //   borderRadius: BorderRadius.circular(25),
                              //   child: BackdropFilter(
                              //     blendMode: BlendMode.srcIn,
                              //     filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                              //     child: Container(
                              //       padding: const EdgeInsets.only(
                              //               top: 15, left: 15, right: 15, bottom: 10)
                              //           .r,
                              //       width: double.infinity,
                              //       //height: 170.h,
                              //       decoration: BoxDecoration(
                              //         borderRadius: BorderRadius.circular(10),
                              //         gradient: LinearGradient(
                              //           end: Alignment.bottomCenter,
                              //           colors: [
                              //             const Color(0xff0A0A0A).withOpacity(0.1),
                              //             const Color(0xff000000).withOpacity(0)
                              //           ],
                              //         ),
                              //       ),
                              //       child: Column(
                              //         children: [
                              //           Row(
                              //             mainAxisAlignment: MainAxisAlignment.start,
                              //             children: [
                              //               Container(
                              //                 width: 20.w,
                              //                 height: 20.h,
                              //                 decoration: BoxDecoration(
                              //                     shape: BoxShape.circle,
                              //                     image: DecorationImage(
                              //                       image: AssetImage(
                              //                         Assets.follow1,
                              //                       ),
                              //                       fit: BoxFit.cover,
                              //                     )),
                              //               ),
                              //               8.horizontalSpace,
                              //               Text(
                              //                 'Ahmad Gouse',
                              //                 style: AppTextStyles.textStylePoppinsMedium
                              //                     .copyWith(
                              //                         fontSize: 16.sp,
                              //                         color: AppColors.colorWhite),
                              //               ),
                              //               8.horizontalSpace,
                              //               Container(
                              //                 padding: const EdgeInsets.symmetric(
                              //                     vertical: 8, horizontal: 8),
                              //                 decoration: BoxDecoration(
                              //                   borderRadius: BorderRadius.circular(70),
                              //                   color: AppColors.colorWhite.withOpacity(0.20),
                              //                 ),
                              //                 child: Center(
                              //                   child: Text(
                              //                     'Following',
                              //                     style: AppTextStyles.textStylePoppinsRegular
                              //                         .copyWith(
                              //                       color: AppColors.colorWhite,
                              //                       fontSize: 10.sp,
                              //                     ),
                              //                   ),
                              //                 ),
                              //               )
                              //             ],
                              //           ),
                              //           // 15.verticalSpace,
                              //           Row(
                              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //             children: [
                              //               Column(
                              //                 crossAxisAlignment: CrossAxisAlignment.start,
                              //                 children: [
                              //                   15.verticalSpace,
                              //                   Row(
                              //                     mainAxisAlignment: MainAxisAlignment.start,
                              //                     children: [
                              //                       Container(
                              //                         padding: const EdgeInsets.all(10),
                              //                         decoration: BoxDecoration(
                              //                           borderRadius: BorderRadius.circular(70),
                              //                           color: AppColors.colorGreen,
                              //                         ),
                              //                         child: Center(
                              //                           child: Text(
                              //                             'Chinese Cuisine',
                              //                             style: AppTextStyles
                              //                                 .textStylePoppinsRegular
                              //                                 .copyWith(
                              //                               color: AppColors.colorWhite,
                              //                               fontSize: 10.sp,
                              //                             ),
                              //                           ),
                              //                         ),
                              //                       ),
                              //                       8.horizontalSpace,
                              //                       // Image.asset(Assets.dislike_emoji),
                              //                       5.horizontalSpace,
                              //                       // Text(
                              //                       //   'Didn\'t Like',
                              //                       //   style: AppTextStyles.textStylePoppinsRegular
                              //                       //       .copyWith(
                              //                       //     fontSize: 10.sp,
                              //                       //     color: AppColors.colorWhite,
                              //                       //   ),
                              //                       // )
                              //                     ],
                              //                   ),
                              //                   8.verticalSpace,
                              //                   Row(
                              //                     mainAxisAlignment: MainAxisAlignment.start,
                              //                     children: [
                              //                       Image.asset(
                              //                         Assets.location2,
                              //                       ),
                              //                       8.horizontalSpace,
                              //                       Column(
                              //                         crossAxisAlignment:
                              //                             CrossAxisAlignment.start,
                              //                         children: [
                              //                           Text(
                              //                             'Starbucks LA, California',
                              //                             style: AppTextStyles
                              //                                 .textStylePoppinsMedium
                              //                                 .copyWith(
                              //                               fontSize: 13.sp,
                              //                               color: AppColors.colorWhite,
                              //                             ),
                              //                           ),
                              //                           Text(
                              //                             'Double road, Lorem City, LA',
                              //                             style: AppTextStyles
                              //                                 .textStylePoppinsRegular
                              //                                 .copyWith(
                              //                               fontSize: 10.sp,
                              //                               color: AppColors.colorWhite,
                              //                             ),
                              //                           ),
                              //                         ],
                              //                       )
                              //                     ],
                              //                   ),
                              //                 ],
                              //               ),
                              //               Column(
                              //                 children: [
                              //                   Image.asset(Assets.like),
                              //                   15.verticalSpace,
                              //                   const CommentsIcon(),
                              //                   10.verticalSpace,
                              //                   Image.asset(Assets.bookmark),
                              //                 ],
                              //               )
                              //             ],
                              //           ),

                              //           10.verticalSpace,
                              //           Text(
                              //             'A memorable evening to be remembered.',
                              //             maxLines: 1,
                              //             overflow: TextOverflow.ellipsis,
                              //             style: AppTextStyles.textStylePoppinsMedium.copyWith(
                              //               fontSize: 12.sp,
                              //               color: AppColors.colorWhite,
                              //             ),
                              //           )
                              //         ],
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              90.verticalSpace,
            ],
          ),
        ));
  }
}
