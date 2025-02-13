import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/utils/app_loader.dart';
import 'package:for_the_table/screens/home/presentation/home_page.dart';
import '../../leaderboard/presentation/standings_page.dart';
import '../../list/presentation/list_page.dart';
import '../../profile/presentation/profile_page.dart';
import '../shared/providers.dart';
import 'bottom_navigation.dart';

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
        return const HomePage();
      // return const HomePageNew();
      // return const PostFeedPage();
      case 1:
        return const ListPage();
      case 2:
        return Container();
      case 3:
        return const StandingsPage();
      case 4:
        return const ProfilePage();
      default:
        return const HomePage();
    }
  }
}
