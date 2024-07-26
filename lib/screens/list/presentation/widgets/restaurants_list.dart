import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/core/utils/app_log.dart';
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

  final List<Map<String, dynamic>> restaurants = [
    {
      'name': 'Joe\'s Pizza',
      'location': 'New York, NY',
      'lat': 40.730610,
      'lng': -73.935242,
      'image': 'assets/images/temp/restaurant-sample1.png',
      'rating': '4.8',
      'reviews': '450 Reviews'
    },
    {
      'name': 'Katz\'s Delicatessen',
      'location': 'New York, NY',
      'lat': 40.722233,
      'lng': -73.987389,
      'image': 'assets/images/temp/restaurant-sample2.png',
      'rating': '4.7',
      'reviews': '980 Reviews'
    },
    {
      'name': 'Le Bernardin',
      'location': 'New York, NY',
      'lat': 40.761620,
      'lng': -73.981726,
      'image': 'assets/images/temp/restaurant-sample1.png',
      'rating': '4.9',
      'reviews': '1300 Reviews'
    },
    {
      'name': 'Lombardi\'s Pizza',
      'location': 'New York, NY',
      'lat': 40.721618,
      'lng': -73.995500,
      'image': 'assets/images/temp/restaurant-sample2.png',
      'rating': '4.6',
      'reviews': '670 Reviews'
    },
    {
      'name': 'Per Se',
      'location': 'New York, NY',
      'lat': 40.768578,
      'lng': -73.981722,
      'image': 'assets/images/temp/restaurant-sample1.png',
      'rating': '4.8',
      'reviews': '950 Reviews'
    },
    {
      'name': 'Shake Shack',
      'location': 'New York, NY',
      'lat': 40.741112,
      'lng': -73.989723,
      'image': 'assets/images/temp/restaurant-sample2.png',
      'rating': '4.5',
      'reviews': '1500 Reviews'
    },
    {
      'name': 'The Modern',
      'location': 'New York, NY',
      'lat': 40.761503,
      'lng': -73.977351,
      'image': 'assets/images/temp/restaurant-sample1.png',
      'rating': '4.7',
      'reviews': '890 Reviews'
    },
    {
      'name': 'Eleven Madison Park',
      'location': 'New York, NY',
      'lat': 40.741635,
      'lng': -73.987462,
      'image': 'assets/images/temp/restaurant-sample2.png',
      'rating': '4.9',
      'reviews': '1200 Reviews'
    },
    {
      'name': 'Peter Luger Steak House',
      'location': 'Brooklyn, NY',
      'lat': 40.709622,
      'lng': -73.962015,
      'image': 'assets/images/temp/restaurant-sample1.png',
      'rating': '4.8',
      'reviews': '800 Reviews'
    },
    {
      'name': 'Russ & Daughters Cafe',
      'location': 'New York, NY',
      'lat': 40.722238,
      'lng': -73.988076,
      'image': 'assets/images/temp/restaurant-sample2.png',
      'rating': '4.6',
      'reviews': '500 Reviews'
    },
  ];

  @override
  void initState() {
    AppLog.log('initState is called');
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final stateNotifier = ref.read(restaurantNotifierProvider.notifier);
      await stateNotifier.getRestaurants();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppLog.log('this is called');
    // final stateNotifier = ref.watch(restaurantNotifierProvider.notifier);
    final state = ref.watch(restaurantNotifierProvider);
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
                  '${state.totalNumberOfRestaurants == 0 ? 'Loading' : state.totalNumberOfRestaurants} Restaurants',
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
                    backgroundColor:
                        isSelected[0] == true ? AppColors.colorBlack : AppColors.colorTransparent,
                    child: Image.asset(
                      isSelected[0] == true ? Assets.listingSelected : Assets.listing,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor:
                        isSelected[1] == true ? AppColors.colorBlack : AppColors.colorTransparent,
                    child: Image.asset(isSelected[1] == true ? Assets.mapSelected : Assets.map),
                  ),
                ],
              ),
            ),
          ],
        ),
        16.verticalSpace,
        isSelected[0] == true
            ? RestaurantListView(
                restaurants: restaurants,
              )
            : RestaurantMapView(restaurants: restaurants),
      ],
    );
  }
}
