import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../core/constants/app_urls.dart';
import '../core/constants/assets.dart';
import '../core/styles/app_colors.dart';
import '../core/styles/app_text_styles.dart';
import '../screens/restaurant/shared/provider.dart';
import '../screens/your_lists/shared/provider.dart';
import 'custom_search_field.dart';

class SearchRestaurantPage extends ConsumerWidget {
  const SearchRestaurantPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restaurantNotifier = ref.watch(restaurantNotifierProvider.notifier);
    final searchNotifier = ref.watch(yourPeopleNotifierProvider.notifier);
    final restaurantState = ref.watch(restaurantNotifierProvider);
    final restaurantList = restaurantState.restaurantList;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: CustomSearchField(
          hint: 'Search Restaurant',
          controller: searchNotifier.searchController,
          onChanged: (_) async {
            await ref.watch(restaurantNotifierProvider.notifier).getRestaurants(ref: ref);
          },
        ),

        // leading: GestureDetector(
        //   onTap: () {
        //     Navigator.pop(context);
        //   },
        //   child: Container(
        //     alignment: Alignment.center,
        //     margin: const EdgeInsets.only(top: 10, left: 20, right: 0, bottom: 10),
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(10),
        //       color: AppColors.colorPrimary.withOpacity(0.20),
        //     ),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         5.horizontalSpace,
        //         Icon(Icons.arrow_back_ios, color: AppColors.colorPrimary, size: 15.h),
        //       ],
        //     ),
        //   ),
        // ),
      ),
      body: SmartRefresher(
        controller: restaurantNotifier.restaurantRefreshController,
        enablePullUp: true,
        enablePullDown: false,
        onLoading: () async {
          await restaurantNotifier.loadMoreRestaurants(context, ref);
          restaurantNotifier.restaurantRefreshController.loadComplete();
        },
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus? mode) {
            if (!restaurantState.isMoreDataFetchable) {
              mode = LoadStatus.noMore;
            }
            Widget body;
            if (mode == LoadStatus.idle) {
              body = const SizedBox.shrink();
            } else if (mode == LoadStatus.loading) {
              body = const CupertinoActivityIndicator();
            } else if (mode == LoadStatus.failed) {
              body = const Text("Load Failed! Click retry!");
            } else if (mode == LoadStatus.canLoading) {
              body = const Text("Release to load more");
            } else {
              body = const Text("No more data");
            }
            return SizedBox(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        child:restaurantList!.isNotEmpty
            ? ListView.separated(
          itemCount: restaurantList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                Navigator.pop(context, restaurantList[index]);
                searchNotifier.searchController.clear();
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
                      child: ((restaurantList[index].image?[0].contains('jpg') ?? false) ||
                          (restaurantList[index].image?[0].contains('png') ??
                              false) ||
                          (restaurantList[index].image?[0].contains('jpeg') ??
                              false) ||
                          (restaurantList[index].image?[0].contains('gif') ??
                              false) ||
                          (restaurantList[index].image?[0].contains('bmp') ??
                              false) ||
                          (restaurantList[index].image?[0].contains('tiff') ??
                              false) ||
                          (restaurantList[index].image?[0].contains('tif') ??
                              false) ||
                          (restaurantList[index].image?[0].contains('webp') ??
                              false) ||
                          (restaurantList[index].image?[0].contains('heic') ??
                              false) ||
                          (restaurantList[index].image?[0].contains('heif') ??
                              false) ||
                          (restaurantList[index].image?[0].contains('svg') ??
                              false) ||
                          (restaurantList[index].image?[0].contains('raw') ??
                              false) ||
                          (restaurantList[index].image?[0].contains('cr2') ??
                              false) ||
                          (restaurantList[index].image?[0].contains('nef') ??
                              false))
                          ? CachedNetworkImage(
                        imageUrl: '${AppUrls.restaurantLocation}${restaurantList[index].image?[0]}',
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
                    ),
                    10.horizontalSpace,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            restaurantList[index].name ?? 'No name',
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
                                  restaurantList[index].address ??
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
                                  (restaurantList[index].rating != '')
                                      ? (double.parse(restaurantList[index].rating ?? '0') * 2).toString()
                                      : '0.0',
                                  style: AppTextStyles.textStylePoppinsRegular
                                      .copyWith(
                                    color: AppColors.colorPrimary,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              (restaurantList[index].userRatingsTotal != '')
                                  ? '${restaurantList[index].userRatingsTotal ?? 0} reviews'
                                  : '0 reviews',
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
        )
            : Center(
          child: Text(
            "No restaurant found",
            style: AppTextStyles.textStylePoppinsLight.copyWith(
              color: AppColors.colorPrimary,
              fontSize: 14.sp,
            ),
          ),
        ),
      ),
    );
  }
}