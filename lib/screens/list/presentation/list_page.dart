import 'package:auto_route/auto_route.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/screens/list/presentation/widgets/followers_list.dart';
import 'package:for_the_table/screens/list/presentation/widgets/restaurants_list.dart';
import 'package:for_the_table/screens/restaurant/shared/provider.dart';
import 'package:for_the_table/screens/your_lists/shared/provider.dart';
import 'package:for_the_table/widgets/custom_search_field.dart';
import 'package:for_the_table/widgets/notification_icon.dart';
import '../shared/provider.dart';

@RoutePage()
class ListPage extends ConsumerStatefulWidget {
  const ListPage({super.key});

  @override
  ConsumerState<ListPage> createState() => _ListPageState();
}

class _ListPageState extends ConsumerState<ListPage> {
  List<String> options = [
    'Users',
    'Restaurants',
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final restaurantNotifier = ref.read(restaurantNotifierProvider.notifier);
      final userNotifier = ref.read(yourPeopleNotifierProvider.notifier);
      await restaurantNotifier.getRestaurants(ref: ref);
      await userNotifier.getAllUsersList();
    });
    super.initState();
  }

  int selectedIndex = 0;
  Future<void> searchUserRestaurant() async {
    final restaurantNotifier = ref.watch(restaurantNotifierProvider.notifier);
    final userNotifier = ref.watch(yourPeopleNotifierProvider.notifier);
    if (selectedIndex == 0) {
      await userNotifier.getAllUsersList();
    } else {
      await restaurantNotifier.getRestaurants(ref: ref);
    }
  }

  @override
  Widget build(BuildContext context) {
    final stateNotifier = ref.watch(listProvider.notifier);
    final state = ref.watch(listProvider);
    final followNotifier = ref.watch(yourPeopleNotifierProvider.notifier);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          centerTitle: false,
          leadingWidth: 0,
          title: Text(
            'Your Lists',
            style: AppTextStyles.textStylePoppinsBold.copyWith(
              color: AppColors.colorPrimary,
              fontSize: 16.sp,
            ),
          ),
          actions: const [NotificationIcon()],
        ),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Container(
            color: AppColors.colorWhite,
            //margin: const EdgeInsets.only(top: 0).r,
            padding: const EdgeInsets.symmetric(horizontal: 16).r,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSearchField(
                    height: 50.r,
                    controller: followNotifier.searchController,
                    bgColor: AppColors.colorBackground,
                    isBorder: true,
                    onChanged: (_) async {
                      // await followNotifier.searchUserRestaurant(ref);
                      await searchUserRestaurant();
                      await ref.watch(restaurantNotifierProvider.notifier).getRestaurants(ref: ref);
                    }),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0).r,
                  child: ChipsChoice<int>.single(
                    value: state.listIndex,
                    padding: EdgeInsets.zero,
                    onChanged: (val) {
                      stateNotifier.setListIndex(val);
                      FocusManager.instance.primaryFocus?.unfocus();
                      followNotifier.clearSearch();
                    },
                    choiceItems: C2Choice.listFrom<int, String>(
                      source: options,
                      value: (i, v) => i,
                      label: (i, v) => v,
                      tooltip: (i, v) => v,
                    ),
                    choiceBuilder: (item, i) {
                      final isSelected = state.listIndex;

                      return Padding(
                        padding: const EdgeInsets.only(right: 5.0).r,
                        child: ChoiceChip(
                          showCheckmark: false,
                          label: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(item.label),
                            ],
                          ),
                          selected: isSelected == i,
                          onSelected: (_) {
                            stateNotifier.setListIndex(i);
                            FocusManager.instance.primaryFocus?.unfocus();
                            followNotifier.clearSearch();
                          },
                          selectedColor: AppColors.colorBlack2,
                          backgroundColor: AppColors.colorWhite,
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 8,
                          ).r,
                          labelStyle: TextStyle(
                            color: isSelected == i ? Colors.white : AppColors.colorPrimaryAlpha,
                          ),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: AppColors.colorGrey3),
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                state.listIndex == 0 ? const FollowersList() : const RestaurantsList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
