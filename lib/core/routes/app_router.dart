import 'package:auto_route/auto_route.dart';
import 'package:for_the_table/landing/presentation/landing_intro_page.dart';
import 'package:for_the_table/splash/presentation/splash_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          path: '/splash',
          initial: true,
        ),
        AutoRoute(
          page: LandingIntroRoute.page,
          path: '/intro',
        ),
      ];
}
