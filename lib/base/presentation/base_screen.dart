import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/base/presentation/bottom_navigation.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/utils/app_loader.dart';
import 'package:for_the_table/home/presentation/home_page.dart';
import 'package:for_the_table/home/presentation/home_page_new.dart';
import 'package:for_the_table/leaderboard/presentation/standings_page.dart';
import 'package:for_the_table/list/presentation/list_page.dart';
import 'package:for_the_table/post_feed/presentation/post_feed_page.dart';
import 'package:for_the_table/profile/presentation/profile_page.dart';

import '../../photo/presentation/photo_click_page.dart';
import '../shared/providers.dart';

@RoutePage()
class BasePage extends ConsumerStatefulWidget {
  const BasePage({super.key});

  @override
  ConsumerState<BasePage> createState() => BasePageState();
}

class BasePageState extends ConsumerState<BasePage> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(baseNotifierProvider);
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        extendBody: true,
        bottomNavigationBar: const BottomNavigation(),
        // appBar: AppBar(
        //   systemOverlayStyle: state.bottomNavIndex == 2
        //       ? SystemUiOverlayStyle.dark
        //       : SystemUiOverlayStyle.light,
        //   backgroundColor: AppColors.colorTransparent,
        //   elevation: 0,
        //   automaticallyImplyLeading: false,
        // ),
        body: Stack(
          children: [
            Offstage(
              offstage: (state.bottomNavIndex != 0),
              child: const AppLoader(color: AppColors.colorWhite),
            ),
            widgetView(state.bottomNavIndex),
          ],
        ),
      ),
    );
  }

  Widget widgetView(int index) {
    switch (index) {
      case 0:
        // return const HomePage();
        return const HomePageNew();
      case 1:
        return const ListPage();
      case 2:
        return Container();
      case 3:
        return const StandingsPage();
      case 4:
        return const ProfilePage();
      default:
        return const PostFeedPage();
    }
  }
}
