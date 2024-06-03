import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/base/presentation/bottom_item.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/styles/app_colors.dart';

// import '../../../core/utils/app_constants.dart';
import '../shared/providers.dart';

class BottomNavigation extends ConsumerWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final controller =
    //     NotchBottomBarController(); // Define NotchBottomBarController
    // final pageController = PageController(); // Define PageController

    final state = ref.watch(baseNotifierProvider);
    final stateNotifier = ref.watch(baseNotifierProvider.notifier);

    final Size size = MediaQuery.of(context).size;
    // final pageController0 = PageController(initialPage: 0);
    List<Map> bottomItems = [
      {
        'icon': Assets.feedInactive,
        'active': Assets.feedActive,
        'name': 'Home'
      },
      {
        'icon': Assets.listInactive,
        'active': Assets.listActive,
        'name': 'List'
      },
      {'icon': Assets.post, 'active': Assets.post, 'name': 'Post'},
      {
        'icon': Assets.leaderboardInactive,
        'active': Assets.leaderboardActive,
        'name': 'Standings'
      },
      {
        'icon': Assets.profileInactive,
        'active': Assets.profileActive,
        'name': 'Profile'
      },
    ];

    // int currentIndex = 0;
    // onTabTapped(int index) {
    //   // setState(() {
    //   currentIndex = index;
    //   switch (currentIndex) {
    //     case 0:
    //       AppConstants.HOME.toUpperCase();
    //       break;
    //     case 1:
    //       AppConstants.TASKS.toUpperCase();
    //       break;
    //     case 2:
    //       AppConstants.MYTASKS.toUpperCase();
    //       break;
    //     case 3:
    //       AppConstants.WALLET.toUpperCase();
    //       break;
    //     case 4:
    //       AppConstants.PROFILE.toUpperCase();
    //       break;
    //     default:
    //       AppConstants.HOME.toUpperCase();
    //   }
    //   // });
    // }

    return SizedBox(
      width: size.width,
      height: 80,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.colorWhite,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    color: AppColors.colorBlack.withOpacity(0.15),
                    blurRadius: 54,
                    spreadRadius: 0,
                    offset: const Offset(0, -1)),
              ],
            ),
          ),
          // GestureDetector(
          //   onTap: () => stateNotifier.tapBottomNavIndex(2),
          //   child: Center(
          //     heightFactor: 0.5,
          //     child: Container(
          //       width: 70,
          //       height: 70,
          //       color: AppColors.colorTransparent,
          //       child: Image.asset(state.bottomNavIndex == 2
          //           ? Assets.bHome
          //           : Assets.bHomeInActive),
          //     ),
          //   ),
          // ),
          Center(
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                    5,
                    (index) => GestureDetector(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          if (index == 1) {
                            // cartNotifier.listItems();
                            stateNotifier.tapBottomNavIndex(index);
                          } else {
                            stateNotifier.tapBottomNavIndex(index);
                          }
                        },
                        child: BottomItem(
                          icon: state.bottomNavIndex == index
                              ? bottomItems[index]['active']
                              : bottomItems[index]['icon'],
                          text: '',
                          active: state.bottomNavIndex == index,
                        )))),
          ),
        ],
      ),
    );

    // SizedBox(
    //   height: 90.h,
    //   width: size.width,
    //   child: AnimatedNotchBottomBar(
    //     notchBottomBarController: controller,
    //     color: AppColors.colorWhite,
    //     itemLabelStyle: TextStyle(
    //         color: AppColors.colorPrimary,
    //         fontSize: isDesktop(context)
    //             ? AppConfigs.TIMELINE_TEXT
    //             : AppConfigs.TIMELINE_TEXT,
    //         fontFamily: AppConfigs.font,
    //         overflow: TextOverflow.ellipsis),
    //     showLabel: true,
    //     shadowElevation: 0,
    //     kBottomRadius: 0, //28.0,
    //     notchColor: AppColors.colorWhite,
    //     removeMargins: true,
    //     bottomBarWidth: size.width,
    //     showBlurBottomBar: false,
    //     durationInMilliSeconds: 300,
    //     bottomBarItems: [
    //       ///1
    //       BottomBarItem(
    //         inActiveItem: Icon(
    //           Icons.list_alt,
    //           color: AppColors.colorBlack,
    //           size: isDesktop(context)
    //               ? AppConfigs.ICON_SIZE
    //               : AppConfigs.ICON_SMALL_SIZE,
    //         ),
    //         activeItem: Icon(
    //           Icons.list_alt,
    //           color: AppColors.colorPrimary,
    //           size: isDesktop(context)
    //               ? AppConfigs.ICON_SIZE
    //               : AppConfigs.ICON_SMALL_SIZE,
    //         ),
    //         itemLabel: AppConstants.HOME,
    //       ),

    //       ///2
    //       BottomBarItem(
    //         inActiveItem: Icon(
    //           Icons.wallet,
    //           color: AppColors.colorBlack,
    //           size: isDesktop(context)
    //               ? AppConfigs.ICON_SIZE
    //               : AppConfigs.ICON_SMALL_SIZE,
    //         ),
    //         activeItem: Icon(
    //           Icons.wallet,
    //           color: AppColors.colorPrimary,
    //           size: isDesktop(context)
    //               ? AppConfigs.ICON_SIZE
    //               : AppConfigs.ICON_SMALL_SIZE,
    //         ),
    //         itemLabel: AppConstants.TASKS.toUpperCase(),
    //       ),

    //       ///3
    //       BottomBarItem(
    //         inActiveItem: Icon(
    //           Icons.home,
    //           color: AppColors.colorBlack,
    //           size: isDesktop(context)
    //               ? AppConfigs.ICON_SIZE
    //               : AppConfigs.ICON_SMALL_SIZE,
    //         ),
    //         activeItem: Icon(
    //           Icons.home,
    //           color: AppColors.colorPrimary,
    //           size: isDesktop(context)
    //               ? AppConfigs.ICON_SIZE
    //               : AppConfigs.ICON_SMALL_SIZE,
    //         ),
    //         itemLabel: AppConstants.MYTASKS.toUpperCase(),
    //       ),

    //       ///4
    //       BottomBarItem(
    //         inActiveItem: Icon(
    //           Icons.task_alt_sharp,
    //           color: AppColors.colorBlack,
    //           size: isDesktop(context)
    //               ? AppConfigs.ICON_SIZE
    //               : AppConfigs.ICON_SMALL_SIZE,
    //         ),
    //         activeItem: Icon(
    //           Icons.task_alt_sharp,
    //           color: AppColors.colorPrimary,
    //           size: isDesktop(context)
    //               ? AppConfigs.ICON_SIZE
    //               : AppConfigs.ICON_SMALL_SIZE,
    //         ),
    //         itemLabel: AppConstants.WALLET.toUpperCase(),
    //       ),

    //       ///5
    //       BottomBarItem(
    //         inActiveItem: Icon(
    //           Icons.person,
    //           color: AppColors.colorBlack,
    //           size: isDesktop(context)
    //               ? AppConfigs.ICON_SIZE
    //               : AppConfigs.ICON_SMALL_SIZE,
    //         ),
    //         activeItem: Icon(
    //           Icons.person,
    //           color: AppColors.colorPrimary,
    //           size: isDesktop(context)
    //               ? AppConfigs.ICON_SIZE
    //               : AppConfigs.ICON_SMALL_SIZE,
    //         ),
    //         itemLabel: AppConstants.PROFILE.toUpperCase(),
    //       ),
    //     ],
    //     onTap: (index) {
    //       /// perform action on tab change and to update pages you can update pages without pages
    //       print('current selected index $index');
    //       // pageController0.jumpToPage(index);
    //       onTabTapped(index);
    //     },

    //     kIconSize: 24.0,
    //   ),
    // );
  }
}
