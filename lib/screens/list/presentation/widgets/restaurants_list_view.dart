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
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../restaurant/shared/provider.dart';

class RestaurantListView extends ConsumerStatefulWidget {
  const RestaurantListView({super.key});

  @override
  ConsumerState<RestaurantListView> createState() => _RestaurantListViewState();
}

class _RestaurantListViewState extends ConsumerState<RestaurantListView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final stateNotifier = ref.read(restaurantNotifierProvider.notifier);
      await stateNotifier.getRestaurants(ref: ref);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final restaurantState = ref.watch(restaurantNotifierProvider);
    final allRestaurantList = restaurantState.restaurantList;
    final restaurantNotifier = ref.watch(restaurantNotifierProvider.notifier);


    return Container(
      color: Colors.white,
      height: 0.54.sh,
      child: (restaurantState.isLoading)
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColors.colorPrimary,
              ),
            )
          : (allRestaurantList != null && (allRestaurantList.isNotEmpty))
              ? SmartRefresher(
                  controller: restaurantNotifier.restaurantRefreshController,
                  enablePullUp: true,
                  enablePullDown: false,
                  onRefresh: () {},
                  onLoading: () {
                    restaurantNotifier.loadMoreRestaurants(context, ref);
                  },
                  footer: CustomFooter(
                    builder: (BuildContext context, mode) {
                      if (!restaurantState.isMoreDataFetchable) {
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
                    itemCount: allRestaurantList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          AutoRouter.of(context).push(RestaurantDetailRoute(
                            isBookmarked: allRestaurantList[index].isSave ?? false,
                            restaurantId: allRestaurantList[index].id ?? '',
                            address: allRestaurantList[index].address ?? 'No name',
                            image: allRestaurantList[index].image?[0] ?? '',
                            lat: allRestaurantList[index].lat ?? '',
                            lng: allRestaurantList[index].lng ?? '',
                            name: allRestaurantList[index].name ?? '',
                            description: allRestaurantList[index].description ?? '',
                          ));
                        },
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
                                child: ((allRestaurantList[index].image?[0].contains('jpg') ?? false) ||
                                        (allRestaurantList[index].image?[0].contains('png') ??
                                            false) ||
                                        (allRestaurantList[index].image?[0].contains('jpeg') ??
                                            false) ||
                                        (allRestaurantList[index].image?[0].contains('gif') ??
                                            false) ||
                                        (allRestaurantList[index].image?[0].contains('bmp') ??
                                            false) ||
                                        (allRestaurantList[index].image?[0].contains('tiff') ??
                                            false) ||
                                        (allRestaurantList[index].image?[0].contains('tif') ??
                                            false) ||
                                        (allRestaurantList[index].image?[0].contains('webp') ??
                                            false) ||
                                        (allRestaurantList[index].image?[0].contains('heic') ??
                                            false) ||
                                        (allRestaurantList[index].image?[0].contains('heif') ??
                                            false) ||
                                        (allRestaurantList[index].image?[0].contains('svg') ??
                                            false) ||
                                        (allRestaurantList[index].image?[0].contains('raw') ??
                                            false) ||
                                        (allRestaurantList[index].image?[0].contains('cr2') ??
                                            false) ||
                                        (allRestaurantList[index].image?[0].contains('nef') ??
                                            false))
                                    ? CachedNetworkImage(
                                        imageUrl:
                                            'https://forthetable.dedicateddevelopers.us/uploads/restaurant/${allRestaurantList[index].image?[0]}',
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
                                      allRestaurantList[index].name ?? 'No name',
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
                                            allRestaurantList[index].address ??
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
                                          Text(
                                            (allRestaurantList[index].rating != '')
                                                ? (double.parse(allRestaurantList[index].rating ?? '0') * 2).toString()
                                                : (double.tryParse(allRestaurantList[index].rating.toString() ?? '0') ?? 0 * 2).toString(),
                                            style: AppTextStyles.textStylePoppinsRegular
                                                      .copyWith(
                                                    color: AppColors.colorPrimary,
                                                    fontSize: 12.sp,
                                                  ),
                                                )

                                        ],
                                      ),
                                      SizedBox(width: 8.w),
                                      Text(
                                        '${allRestaurantList[index].userRatingsTotal?.isNotEmpty == true ? allRestaurantList[index].userRatingsTotal : '0'} reviews',
                                        style: AppTextStyles.textStylePoppinsRegular.copyWith(
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
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) => 5.verticalSpace,
                  ),
                )
              : Center(
                  child: Text(
                    'No restaurants found',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.textStylePoppins.copyWith(
                      fontSize: 15.sp,
                    ),
                  ),
                ),
    );
  }
}
