import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/screens/list/presentation/widgets/restaurants_list_view.dart';
import 'package:for_the_table/screens/list/presentation/widgets/restaurants_map_view.dart';
import '../../../restaurant/shared/provider.dart';

class RestaurantsList extends ConsumerStatefulWidget {
  const RestaurantsList({
    super.key,
  });

  @override
  ConsumerState<RestaurantsList> createState() => _RestaurantsListState();
}

class _RestaurantsListState extends ConsumerState<RestaurantsList> {
  List<bool> isSelected = [true, false];

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

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Restaurant List',
                  style: AppTextStyles.textStylePoppinsMedium.copyWith(
                    color: AppColors.colorPrimary,
                    fontSize: 13.sp,
                  ),
                ),
                Text(
                  '${restaurantState.totalNumberOfRestaurants == 0 ? 'Loading' : restaurantState.totalNumberOfRestaurants} Restaurants',
                  style: AppTextStyles.textStylePoppinsRegular.copyWith(
                    color: AppColors.colorPrimaryAlpha,
                    fontSize: 10.sp,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(2).r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                color: AppColors.colorGrey,
              ),
              child: ToggleButtons(
                borderRadius: BorderRadius.circular(80),
                renderBorder: false,
                selectedColor: AppColors.colorTransparent,
                splashColor: AppColors.colorGrey,
                fillColor: AppColors.colorTransparent,
                isSelected: isSelected,
                onPressed: (int newIndex) {
                  setState(() {
                    for (int index = 0; index < isSelected.length; index++) {
                      if (index == newIndex) {
                        isSelected[index] = true;
                      } else {
                        isSelected[index] = false;
                      }
                    }
                  });
                },
                children: [
                  CircleAvatar(
                    backgroundColor: isSelected[0] == true
                        ? AppColors.colorBlack
                        : AppColors.colorTransparent,
                    child: Image.asset(
                      isSelected[0] == true
                          ? Assets.listingSelected
                          : Assets.listing,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: isSelected[1] == true
                        ? AppColors.colorBlack
                        : AppColors.colorTransparent,
                    child: Image.asset(isSelected[1] == true
                        ? Assets.mapSelected
                        : Assets.map),
                  ),
                ],
              ),
            ),
          ],
        ),
        16.verticalSpace,
        isSelected[0] == true
            ? const RestaurantListView()
            : const RestaurantMapView(),
      ],
    );
  }

  @override
  void dispose() {
    ref.read(restaurantNotifierProvider.notifier).dispose();
    super.dispose();
  }
}
