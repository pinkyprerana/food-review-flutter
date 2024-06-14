import 'package:auto_route/auto_route.dart';
import 'package:for_the_table/auth/presentation/forget_password_page.dart';
import 'package:for_the_table/auth/presentation/login_page.dart';
import 'package:for_the_table/auth/presentation/register_page.dart';
import 'package:for_the_table/auth/presentation/reset_password_page.dart';
import 'package:for_the_table/auth/presentation/verify_otp_page.dart';
import 'package:for_the_table/base/presentation/base_screen.dart';
import 'package:for_the_table/home/presentation/home_page.dart';
import 'package:for_the_table/landing/presentation/landing_get_started_page.dart';
import 'package:for_the_table/landing/presentation/landing_intro_page.dart';
import 'package:for_the_table/onboarding/presentation/select_preferene_page.dart';
import 'package:for_the_table/profile/presentation/edit_profile_page.dart';
import 'package:for_the_table/profile/presentation/settings_page.dart';
import 'package:for_the_table/splash/presentation/splash_page.dart';
import 'package:for_the_table/list/presentation/list_page.dart';
import 'package:for_the_table/leaderboard/presentation/standings_page.dart';
import 'package:for_the_table/profile/presentation/profile_page.dart';

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
        AutoRoute(
          page: LandingGetStartedRoute.page,
          path: '/getStarted',
        ),
        AutoRoute(
          page: LoginRoute.page,
          path: '/login',
        ),
        AutoRoute(
          page: RegisterRoute.page,
          path: '/register',
        ),
        AutoRoute(
          page: ForgotPasswordRoute.page,
          path: '/forgetPassword',
        ),
        AutoRoute(
          page: ResetPasswordRoute.page,
          path: '/resetPassword',
        ),
        AutoRoute(
          page: VerifyOtpRoute.page,
          path: '/verifyOtp',
        ),
        AutoRoute(
          page: SelectPreferenceRoute.page,
          path: '/onboarding',
        ),
        AutoRoute(
          page: BaseRoute.page,
          path: '/onboarding',
        ),
        AutoRoute(
          page: HomeRoute.page,
          path: '/home',
        ),
        AutoRoute(
          page: ListRoute.page,
          path: '/list',
        ),
        AutoRoute(
          page: StandingsRoute.page,
          path: '/standings',
        ),
        AutoRoute(
          page: ProfileRoute.page,
          path: '/myProfile',
        ),
        AutoRoute(
          page: EditProfileRoute.page,
          path: '/editProfile',
        ),
        AutoRoute(
          page: SettingsRoute.page,
          path: '/settings',
        ),
      ];
}
