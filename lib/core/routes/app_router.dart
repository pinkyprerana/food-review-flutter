import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:for_the_table/screens/profile/presentation/recent_activity.dart';
import 'package:for_the_table/screens/profile/presentation/saved_restaurants_page.dart';
import '../../screens/auth/presentation/forget_password_page.dart';
import '../../screens/auth/presentation/login_page.dart';
import '../../screens/auth/presentation/register_page.dart';
import '../../screens/auth/presentation/reset_password_page.dart';
import '../../screens/auth/presentation/verify_otp_page.dart';
import '../../screens/base/presentation/base_screen.dart';
import '../../screens/create_post/presentation/create_post.dart';
import '../../screens/create_post/presentation/photo_click_page.dart';
import '../../screens/home/presentation/post_comments_page.dart';
import '../../screens/landing/presentation/landing_get_started_page.dart';
import '../../screens/landing/presentation/landing_intro_page.dart';
import '../../screens/leaderboard/presentation/standings_page.dart';
import '../../screens/list/presentation/list_page.dart';
import '../../screens/location/presentation/location_page.dart';
import '../../screens/message/presentation/message_list_screen.dart';
import '../../screens/message/presentation/direct_message_screen.dart';
import '../../screens/notification/presentation/notification_page.dart';
import '../../screens/onboarding/presentation/select_preferene_page.dart';
import '../../screens/people_profile/presentation/people_profile_screen.dart';
import '../../screens/people_profile/presentation/widget/user_post_details.dart';
import '../../screens/profile/presentation/add_bio_page.dart';
import '../../screens/profile/presentation/app_info_page.dart';
import '../../screens/profile/presentation/disliked_posts_page.dart';
import '../../screens/profile/presentation/edit_profile_page.dart';
import '../../screens/profile/presentation/faqs_page.dart';
import '../../screens/profile/presentation/help_page.dart';
import '../../screens/profile/presentation/home_city_page.dart';
import '../../screens/profile/presentation/liked_posts_page.dart';
import '../../screens/profile/presentation/profile_page.dart';
import '../../screens/profile/presentation/settings_page.dart';
import '../../screens/profile/presentation/widgets/privacy_policy.dart';
import '../../screens/restaurant/presentation/restaurant_detail_page.dart';
import '../../screens/profile/presentation/saved_post_page.dart';
import '../../screens/splash/presentation/splash_page.dart';
import '../../screens/your_lists/presentation/your_people_list.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          path: '/splash',
          // path: '/',
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
          page: PostCommentsRoute.page,
          path: '/postComments',
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
          path: '/peopleProfile/:id',
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
        AutoRoute(
          page: PhotoClickRoute.page,
          path: '/photoClickRoute',
        ),
        AutoRoute(
          page: RecentActivityRoute.page,
          path: '/recentActivityRoute',
        ),
        AutoRoute(
          page: SavedRestaurantsRoute.page,
          path: '/savedRestaurantsRoute',
        ),
        AutoRoute(
          page: PostDetailsRoute.page,
          path: '/postDetailsRoute',
        ),
        AutoRoute(
          page: MessageListRoute.page,
          path: '/messageListRoute',
        ),
        AutoRoute(
          page: DirectMessageRoute.page,
          path: '/directMessageRoute',
        ),
      ];
}
