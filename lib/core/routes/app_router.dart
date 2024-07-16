import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:for_the_table/auth/presentation/forget_password_page.dart';
import 'package:for_the_table/auth/presentation/login_page.dart';
import 'package:for_the_table/auth/presentation/register_page.dart';
import 'package:for_the_table/auth/presentation/reset_password_page.dart';
import 'package:for_the_table/auth/presentation/verify_otp_page.dart';
import 'package:for_the_table/base/presentation/base_screen.dart';
import 'package:for_the_table/home/presentation/home_page.dart';
import 'package:for_the_table/home/presentation/home_page_new.dart';
import 'package:for_the_table/landing/presentation/landing_get_started_page.dart';
import 'package:for_the_table/landing/presentation/landing_intro_page.dart';
import 'package:for_the_table/location/presentation/location_page.dart';
import 'package:for_the_table/notification/presentation/notification_page.dart';
import 'package:for_the_table/onboarding/presentation/select_preferene_page.dart';
import 'package:for_the_table/post_feed/presentation/comments_page.dart';
import 'package:for_the_table/profile/presentation/add_bio_page.dart';
import 'package:for_the_table/profile/presentation/app_info_page.dart';
import 'package:for_the_table/profile/presentation/disliked_posts_page.dart';
import 'package:for_the_table/profile/presentation/edit_profile_page.dart';
import 'package:for_the_table/profile/presentation/faqs_page.dart';
import 'package:for_the_table/profile/presentation/help_page.dart';
import 'package:for_the_table/profile/presentation/home_city_page.dart';
import 'package:for_the_table/profile/presentation/liked_posts_page.dart';
import 'package:for_the_table/profile/presentation/settings_page.dart';
import 'package:for_the_table/profile/presentation/your_people_page.dart';
import 'package:for_the_table/restaurant/presentation/restaurant_detail_page.dart';
import 'package:for_the_table/splash/presentation/splash_page.dart';
import 'package:for_the_table/list/presentation/list_page.dart';
import 'package:for_the_table/leaderboard/presentation/standings_page.dart';
import 'package:for_the_table/profile/presentation/profile_page.dart';
import '../../people_profile/presentation/people_profile_screen.dart';
import '../../create_post/presentation/photo_click_page.dart';
import '../../create_post/presentation/create_post.dart';
import '../../profile/presentation/widgets/privacy_policy.dart';
import '../../your_lists/presentation/your_people_list.dart';
import '../../saved/presentation/saved.dart';

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
          page: HomeRouteNew.page,
          path: '/homeNew',
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
        AutoRoute(
          page: NotificationRoute.page,
          path: '/notificationRoute',
        ),
        AutoRoute(
          page: CommentsRoute.page,
          path: '/commentsRoute',
        ),
        AutoRoute(
          page: RestaurantDetailRoute.page,
          path: '/restaurantDetailRoute',
        ),
        AutoRoute(
          page: CreatePostRoute.page,
          path: '/createPost',
        ),
        AutoRoute(
          page: HelpRoute.page,
          path: '/helpRoute',
        ),
        AutoRoute(
          page: FaqsRoute.page,
          path: '/faqsRoute',
        ),
        AutoRoute(
          page: LikedPostsRoute.page,
          path: '/likedPostsRoute',
        ),
        AutoRoute(
          page: DislikedPostsRoute.page,
          path: '/dislikedPostsRoute',
        ),
        AutoRoute(
          page: AppInfoRoute.page,
          path: '/appInfoRoute',
        ),
        AutoRoute(
          page: AppInfoRoute.page,
          path: '/appInfoRoute',
        ),
        AutoRoute(
          page: PeopleProfileRoute.page,
          path: '/peopleProfile',
        ),
        AutoRoute(
          page: SavedRoute.page,
          path: '/savedRoute',
        ),
        AutoRoute(
            page: YourPeopleListRoute.page, path: '/followingFollowerRequests'),
        AutoRoute(
          page: PrivacyPolicyRoute.page,
          path: '/privacyPolicyRoute',
        ),
        AutoRoute(
          page: YourPeopleRoute.page,
          path: '/yourPeopleRoute',
        ),
        AutoRoute(
          page: AddBioRoute.page,
          path: '/addBioRoute',
        ),
        AutoRoute(
          page: HomeCityRoute.page,
          path: '/homeCityRoute',
        ),
        AutoRoute(
          page: LocationRoute.page,
          path: '/locationRoute',
        ),
      ];
}
