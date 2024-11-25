import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/routes/app_router.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/screens/restaurant/shared/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../core/constants/app_urls.dart';

@RoutePage()
class SavedRestaurantsPage extends ConsumerStatefulWidget {
  const SavedRestaurantsPage({super.key});

  @override
  ConsumerState<SavedRestaurantsPage> createState() => _SavedRestaurantsPageState();
}

class _SavedRestaurantsPageState extends ConsumerState<SavedRestaurantsPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final stateNotifier = ref.read(restaurantNotifierProvider.notifier);
      await stateNotifier.getSavedRestaurants();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(restaurantNotifierProvider);
    final stateNotifier = ref.watch(restaurantNotifierProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        // leadingWidth: 60,
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
          'Saved Restaurants',
          style: AppTextStyles.textStylePoppinsBold.copyWith(
            color: AppColors.colorPrimary,
            fontSize: 16.sp,
          ),
        ),
      ),
      body: (state.isLoadingSaveRestaurantList)
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColors.colorPrimary,
              ),
            )
          : (state.savedRestaurantList != null && (state.savedRestaurantList?.isNotEmpty ?? false))
              ? SmartRefresher(
                  controller: stateNotifier.savedRestaurantRefreshController,
                  enablePullUp: true,
                  enablePullDown: false,
                  onRefresh: () {},
                  onLoading: () {
                    stateNotifier.loadMoreSavedRestaurants();
                  },
                  footer: CustomFooter(
                    builder: (BuildContext context, mode) {
                      if (!state.isMoreDataFetchable) {
                        mode = LoadStatus.noMore;
                      }
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
                  child: ListView.separated(
                    itemCount: state.savedRestaurantList?.length ?? 0,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          AutoRouter.of(context).push(RestaurantDetailRoute(
                            isBookmarked: state.savedRestaurantList?[index].isSave ?? false,
                            restaurantId: state.savedRestaurantList?[index].id ?? '',
                            address: state.savedRestaurantList?[index].address ?? 'No name',
                            image: state.savedRestaurantList?[index].image?[0] ?? '',
                            lat: state.savedRestaurantList?[index].lat ?? '',
                            lng: state.savedRestaurantList?[index].lng ?? '',
                            name: state.savedRestaurantList?[index].name ?? '',
                            description: state.savedRestaurantList?[index].description ?? '',
                          ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(9.0, 8.0, 18.0, 8.0).r,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: AppColors.colorGrey),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0).r,
                                  child: ((state.savedRestaurantList?[index].image?[0].contains('jpg') ?? false) ||
                                          (state.savedRestaurantList?[index].image?[0].contains('png') ??
                                              false) ||
                                          (state.savedRestaurantList?[index].image?[0].contains('jpeg') ??
                                              false) ||
                                          (state.savedRestaurantList?[index].image?[0].contains('gif') ??
                                              false) ||
                                          (state.savedRestaurantList?[index].image?[0].contains('bmp') ??
                                              false) ||
                                          (state.savedRestaurantList?[index].image?[0].contains('tiff') ??
                                              false) ||
                                          (state.savedRestaurantList?[index].image?[0].contains('tif') ??
                                              false) ||
                                          (state.savedRestaurantList?[index].image?[0].contains('webp') ??
                                              false) ||
                                          (state.savedRestaurantList?[index].image?[0]
                                                  .contains('heic') ??
                                              false) ||
                                          (state.savedRestaurantList?[index].image?[0]
                                                  .contains('heif') ??
                                              false) ||
                                          (state.savedRestaurantList?[index].image?[0].contains('svg') ??
                                              false) ||
                                          (state.savedRestaurantList?[index].image?[0].contains('raw') ??
                                              false) ||
                                          (state.savedRestaurantList?[index].image?[0].contains('cr2') ??
                                              false) ||
                                          (state.savedRestaurantList?[index].image?[0].contains('nef') ??
                                              false))
                                      ? CachedNetworkImage(
                                          imageUrl:
                                              '${AppUrls.restaurantLocation}${state.savedRestaurantList?[index].image?[0]}',
                                          width: 48.r,
                                          height: 48.r,
                                          fit: BoxFit.cover,
                                        )
                                      : Image.asset(
                                          Assets.noRestaurantImage,
                                          width: 48.r,
                                          height: 48.r,
                                          fit: BoxFit.cover,
                                        ),
                                  // child: Image.asset(
                                  //   widget.restaurants[0]['image']!,
                                  //   width: 48.r,
                                  //   height: 48.r,
                                  //   fit: BoxFit.cover,
                                  // ),
                                ),
                                10.horizontalSpace,
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        // widget.restaurants[index]['name']!,
                                        state.savedRestaurantList?[index].name ?? 'No name',
                                        style: AppTextStyles.textStylePoppinsMedium.copyWith(
                                          color: AppColors.colorPrimary,
                                          fontSize: 13.sp,
                                        ),
                                      ),
                                      SizedBox(height: 4.h),
                                      Row(
                                        children: [
                                          Image.asset(Assets.locationMarker),
                                          3.horizontalSpace,
                                          Expanded(
                                            child: Text(
                                              // widget.restaurants[index]
                                              //     ['location']!,
                                              state.savedRestaurantList?[index].address ??
                                                  'No Address is given',
                                              style: AppTextStyles.textStylePoppinsRegular.copyWith(
                                                color: AppColors.colorPrimaryAlpha,
                                                fontSize: 10.sp,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(Icons.star,
                                                color: AppColors.colorRatingStar, size: 14.r),
                                            SizedBox(width: 4.w),
                                            (state.savedRestaurantList?[index].rating != '')
                                                ? Text(
                                                    // widget.restaurants[index]
                                                    //     ['rating']!,
                                                    (double.parse(state.savedRestaurantList?[index]
                                                                    .rating ??
                                                                '0') *
                                                            2)
                                                        .toString(),
                                                    style: AppTextStyles.textStylePoppinsRegular
                                                        .copyWith(
                                                      color: AppColors.colorPrimary,
                                                      fontSize: 12.sp,
                                                    ),
                                                  )
                                                : Text(
                                                    // widget.restaurants[index]
                                                    //     ['rating']!,

                                                    '0.0',
                                                    style: AppTextStyles.textStylePoppinsRegular
                                                        .copyWith(
                                                      color: AppColors.colorPrimary,
                                                      fontSize: 12.sp,
                                                    ),
                                                  ),
                                          ],
                                        ),
                                        SizedBox(width: 8.w),
                                        (state.savedRestaurantList?[index].userRatingsTotal != '')
                                            ? Text(
                                                //widget.restaurants[index]['reviews']!,
                                                '${state.savedRestaurantList?[index].userRatingsTotal ?? 0} reviews',
                                                style:
                                                    AppTextStyles.textStylePoppinsRegular.copyWith(
                                                  color: AppColors.colorPrimaryAlpha,
                                                  fontSize: 8.sp,
                                                ),
                                              )
                                            : Text(
                                                // widget.restaurants[index]
                                                //     ['reviews']!,

                                                '0 reviews',
                                                style:
                                                    AppTextStyles.textStylePoppinsRegular.copyWith(
                                                  color: AppColors.colorPrimaryAlpha,
                                                  fontSize: 8.sp,
                                                ),
                                              ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) => 5.verticalSpace,
                  ),
                )
              : Center(
                  child: Text(
                    'No saved restaurants found',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.textStylePoppins.copyWith(
                      fontSize: 15.sp,
                    ),
                  ),
                ),
    );
  }
}
