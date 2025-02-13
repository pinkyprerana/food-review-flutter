// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddBioRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddBioPage(),
      );
    },
    AppInfoRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AppInfoPage(),
      );
    },
    BaseRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BasePage(),
      );
    },
    CreatePostRoute.name: (routeData) {
      final args = routeData.argsAs<CreatePostRouteArgs>(
          orElse: () => const CreatePostRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CreatePostPage(
          key: args.key,
          file: args.file,
        ),
      );
    },
    DirectMessageRoute.name: (routeData) {
      final args = routeData.argsAs<DirectMessageRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DirectMessageScreen(
          peopleId: args.peopleId,
          key: args.key,
        ),
      );
    },
    DislikedPostsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DislikedPostsPage(),
      );
    },
    EditProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EditProfilePage(),
      );
    },
    FaqsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FaqsPage(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ForgotPasswordPage(),
      );
    },
    HelpRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HelpPage(),
      );
    },
    HomeCityRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeCityPage(),
      );
    },
    LandingGetStartedRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LandingGetStartedPage(),
      );
    },
    LandingIntroRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LandingIntroPage(),
      );
    },
    LikedPostsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LikedPostsPage(),
      );
    },
    ListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ListPage(),
      );
    },
    LocationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LocationPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginPage(),
      );
    },
    MessageListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MessageListScreen(),
      );
    },
    NotificationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NotificationPage(),
      );
    },
    PeopleProfileRoute.name: (routeData) {
      final args = routeData.argsAs<PeopleProfileRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PeopleProfilePage(
          key: args.key,
          peopleId: args.peopleId,
          isDeepLinking: args.isDeepLinking,
        ),
      );
    },
    PhotoClickRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PhotoClickPage(),
      );
    },
    PostCommentsRoute.name: (routeData) {
      final args = routeData.argsAs<PostCommentsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PostCommentsPage(
          key: args.key,
          postId: args.postId,
        ),
      );
    },
    PostDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<PostDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PostDetailsPage(
          key: args.key,
          postId: args.postId,
          userId: args.userId,
          isDeepLinking: args.isDeepLinking,
        ),
      );
    },
    PrivacyPolicyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PrivacyPolicyPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfilePage(),
      );
    },
    RecentActivityRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RecentActivityPage(),
      );
    },
    RegisterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegisterPage(),
      );
    },
    ResetPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ResetPasswordPage(),
      );
    },
    RestaurantDetailRoute.name: (routeData) {
      final args = routeData.argsAs<RestaurantDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RestaurantDetailPage(
          key: args.key,
          address: args.address,
          image: args.image,
          lat: args.lat,
          lng: args.lng,
          name: args.name,
          description: args.description,
          restaurantId: args.restaurantId,
          isBookmarked: args.isBookmarked,
        ),
      );
    },
    SavedRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SavedPage(),
      );
    },
    SavedRestaurantsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SavedRestaurantsPage(),
      );
    },
    SelectPreferenceRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SelectPreferencePage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsPage(),
      );
    },
    SplashRoute.name: (routeData) {
      final args = routeData.argsAs<SplashRouteArgs>(
          orElse: () => const SplashRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SplashPage(
          key: args.key,
          peopleId: args.peopleId,
          postId: args.postId,
        ),
      );
    },
    StandingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StandingsPage(),
      );
    },
    VerifyOtpRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const VerifyOtpPage(),
      );
    },
    YourPeopleListRoute.name: (routeData) {
      final args = routeData.argsAs<YourPeopleListRouteArgs>(
          orElse: () => const YourPeopleListRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: YourPeopleListPage(
          key: args.key,
          tabIndex: args.tabIndex,
        ),
      );
    },
  };
}

/// generated route for
/// [AddBioPage]
class AddBioRoute extends PageRouteInfo<void> {
  const AddBioRoute({List<PageRouteInfo>? children})
      : super(
          AddBioRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddBioRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AppInfoPage]
class AppInfoRoute extends PageRouteInfo<void> {
  const AppInfoRoute({List<PageRouteInfo>? children})
      : super(
          AppInfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppInfoRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BasePage]
class BaseRoute extends PageRouteInfo<void> {
  const BaseRoute({List<PageRouteInfo>? children})
      : super(
          BaseRoute.name,
          initialChildren: children,
        );

  static const String name = 'BaseRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CreatePostPage]
class CreatePostRoute extends PageRouteInfo<CreatePostRouteArgs> {
  CreatePostRoute({
    Key? key,
    XFile? file,
    List<PageRouteInfo>? children,
  }) : super(
          CreatePostRoute.name,
          args: CreatePostRouteArgs(
            key: key,
            file: file,
          ),
          initialChildren: children,
        );

  static const String name = 'CreatePostRoute';

  static const PageInfo<CreatePostRouteArgs> page =
      PageInfo<CreatePostRouteArgs>(name);
}

class CreatePostRouteArgs {
  const CreatePostRouteArgs({
    this.key,
    this.file,
  });

  final Key? key;

  final XFile? file;

  @override
  String toString() {
    return 'CreatePostRouteArgs{key: $key, file: $file}';
  }
}

/// generated route for
/// [DirectMessageScreen]
class DirectMessageRoute extends PageRouteInfo<DirectMessageRouteArgs> {
  DirectMessageRoute({
    required String peopleId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          DirectMessageRoute.name,
          args: DirectMessageRouteArgs(
            peopleId: peopleId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DirectMessageRoute';

  static const PageInfo<DirectMessageRouteArgs> page =
      PageInfo<DirectMessageRouteArgs>(name);
}

class DirectMessageRouteArgs {
  const DirectMessageRouteArgs({
    required this.peopleId,
    this.key,
  });

  final String peopleId;

  final Key? key;

  @override
  String toString() {
    return 'DirectMessageRouteArgs{peopleId: $peopleId, key: $key}';
  }
}

/// generated route for
/// [DislikedPostsPage]
class DislikedPostsRoute extends PageRouteInfo<void> {
  const DislikedPostsRoute({List<PageRouteInfo>? children})
      : super(
          DislikedPostsRoute.name,
          initialChildren: children,
        );

  static const String name = 'DislikedPostsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EditProfilePage]
class EditProfileRoute extends PageRouteInfo<void> {
  const EditProfileRoute({List<PageRouteInfo>? children})
      : super(
          EditProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FaqsPage]
class FaqsRoute extends PageRouteInfo<void> {
  const FaqsRoute({List<PageRouteInfo>? children})
      : super(
          FaqsRoute.name,
          initialChildren: children,
        );

  static const String name = 'FaqsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ForgotPasswordPage]
class ForgotPasswordRoute extends PageRouteInfo<void> {
  const ForgotPasswordRoute({List<PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HelpPage]
class HelpRoute extends PageRouteInfo<void> {
  const HelpRoute({List<PageRouteInfo>? children})
      : super(
          HelpRoute.name,
          initialChildren: children,
        );

  static const String name = 'HelpRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeCityPage]
class HomeCityRoute extends PageRouteInfo<void> {
  const HomeCityRoute({List<PageRouteInfo>? children})
      : super(
          HomeCityRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeCityRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LandingGetStartedPage]
class LandingGetStartedRoute extends PageRouteInfo<void> {
  const LandingGetStartedRoute({List<PageRouteInfo>? children})
      : super(
          LandingGetStartedRoute.name,
          initialChildren: children,
        );

  static const String name = 'LandingGetStartedRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LandingIntroPage]
class LandingIntroRoute extends PageRouteInfo<void> {
  const LandingIntroRoute({List<PageRouteInfo>? children})
      : super(
          LandingIntroRoute.name,
          initialChildren: children,
        );

  static const String name = 'LandingIntroRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LikedPostsPage]
class LikedPostsRoute extends PageRouteInfo<void> {
  const LikedPostsRoute({List<PageRouteInfo>? children})
      : super(
          LikedPostsRoute.name,
          initialChildren: children,
        );

  static const String name = 'LikedPostsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ListPage]
class ListRoute extends PageRouteInfo<void> {
  const ListRoute({List<PageRouteInfo>? children})
      : super(
          ListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LocationPage]
class LocationRoute extends PageRouteInfo<void> {
  const LocationRoute({List<PageRouteInfo>? children})
      : super(
          LocationRoute.name,
          initialChildren: children,
        );

  static const String name = 'LocationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MessageListScreen]
class MessageListRoute extends PageRouteInfo<void> {
  const MessageListRoute({List<PageRouteInfo>? children})
      : super(
          MessageListRoute.name,
          initialChildren: children,
        );

  static const String name = 'MessageListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NotificationPage]
class NotificationRoute extends PageRouteInfo<void> {
  const NotificationRoute({List<PageRouteInfo>? children})
      : super(
          NotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PeopleProfilePage]
class PeopleProfileRoute extends PageRouteInfo<PeopleProfileRouteArgs> {
  PeopleProfileRoute({
    Key? key,
    required String peopleId,
    bool? isDeepLinking,
    List<PageRouteInfo>? children,
  }) : super(
          PeopleProfileRoute.name,
          args: PeopleProfileRouteArgs(
            key: key,
            peopleId: peopleId,
            isDeepLinking: isDeepLinking,
          ),
          initialChildren: children,
        );

  static const String name = 'PeopleProfileRoute';

  static const PageInfo<PeopleProfileRouteArgs> page =
      PageInfo<PeopleProfileRouteArgs>(name);
}

class PeopleProfileRouteArgs {
  const PeopleProfileRouteArgs({
    this.key,
    required this.peopleId,
    this.isDeepLinking,
  });

  final Key? key;

  final String peopleId;

  final bool? isDeepLinking;

  @override
  String toString() {
    return 'PeopleProfileRouteArgs{key: $key, peopleId: $peopleId, isDeepLinking: $isDeepLinking}';
  }
}

/// generated route for
/// [PhotoClickPage]
class PhotoClickRoute extends PageRouteInfo<void> {
  const PhotoClickRoute({List<PageRouteInfo>? children})
      : super(
          PhotoClickRoute.name,
          initialChildren: children,
        );

  static const String name = 'PhotoClickRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PostCommentsPage]
class PostCommentsRoute extends PageRouteInfo<PostCommentsRouteArgs> {
  PostCommentsRoute({
    Key? key,
    required String postId,
    List<PageRouteInfo>? children,
  }) : super(
          PostCommentsRoute.name,
          args: PostCommentsRouteArgs(
            key: key,
            postId: postId,
          ),
          initialChildren: children,
        );

  static const String name = 'PostCommentsRoute';

  static const PageInfo<PostCommentsRouteArgs> page =
      PageInfo<PostCommentsRouteArgs>(name);
}

class PostCommentsRouteArgs {
  const PostCommentsRouteArgs({
    this.key,
    required this.postId,
  });

  final Key? key;

  final String postId;

  @override
  String toString() {
    return 'PostCommentsRouteArgs{key: $key, postId: $postId}';
  }
}

/// generated route for
/// [PostDetailsPage]
class PostDetailsRoute extends PageRouteInfo<PostDetailsRouteArgs> {
  PostDetailsRoute({
    Key? key,
    required String? postId,
    required String? userId,
    bool? isDeepLinking,
    List<PageRouteInfo>? children,
  }) : super(
          PostDetailsRoute.name,
          args: PostDetailsRouteArgs(
            key: key,
            postId: postId,
            userId: userId,
            isDeepLinking: isDeepLinking,
          ),
          initialChildren: children,
        );

  static const String name = 'PostDetailsRoute';

  static const PageInfo<PostDetailsRouteArgs> page =
      PageInfo<PostDetailsRouteArgs>(name);
}

class PostDetailsRouteArgs {
  const PostDetailsRouteArgs({
    this.key,
    required this.postId,
    required this.userId,
    this.isDeepLinking,
  });

  final Key? key;

  final String? postId;

  final String? userId;

  final bool? isDeepLinking;

  @override
  String toString() {
    return 'PostDetailsRouteArgs{key: $key, postId: $postId, userId: $userId, isDeepLinking: $isDeepLinking}';
  }
}

/// generated route for
/// [PrivacyPolicyPage]
class PrivacyPolicyRoute extends PageRouteInfo<void> {
  const PrivacyPolicyRoute({List<PageRouteInfo>? children})
      : super(
          PrivacyPolicyRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrivacyPolicyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RecentActivityPage]
class RecentActivityRoute extends PageRouteInfo<void> {
  const RecentActivityRoute({List<PageRouteInfo>? children})
      : super(
          RecentActivityRoute.name,
          initialChildren: children,
        );

  static const String name = 'RecentActivityRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegisterPage]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute({List<PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ResetPasswordPage]
class ResetPasswordRoute extends PageRouteInfo<void> {
  const ResetPasswordRoute({List<PageRouteInfo>? children})
      : super(
          ResetPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetPasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RestaurantDetailPage]
class RestaurantDetailRoute extends PageRouteInfo<RestaurantDetailRouteArgs> {
  RestaurantDetailRoute({
    Key? key,
    required String address,
    required String image,
    required String lat,
    required String lng,
    required String name,
    required String description,
    required String restaurantId,
    required bool isBookmarked,
    List<PageRouteInfo>? children,
  }) : super(
          RestaurantDetailRoute.name,
          args: RestaurantDetailRouteArgs(
            key: key,
            address: address,
            image: image,
            lat: lat,
            lng: lng,
            name: name,
            description: description,
            restaurantId: restaurantId,
            isBookmarked: isBookmarked,
          ),
          initialChildren: children,
        );

  static const String name = 'RestaurantDetailRoute';

  static const PageInfo<RestaurantDetailRouteArgs> page =
      PageInfo<RestaurantDetailRouteArgs>(name);
}

class RestaurantDetailRouteArgs {
  const RestaurantDetailRouteArgs({
    this.key,
    required this.address,
    required this.image,
    required this.lat,
    required this.lng,
    required this.name,
    required this.description,
    required this.restaurantId,
    required this.isBookmarked,
  });

  final Key? key;

  final String address;

  final String image;

  final String lat;

  final String lng;

  final String name;

  final String description;

  final String restaurantId;

  final bool isBookmarked;

  @override
  String toString() {
    return 'RestaurantDetailRouteArgs{key: $key, address: $address, image: $image, lat: $lat, lng: $lng, name: $name, description: $description, restaurantId: $restaurantId, isBookmarked: $isBookmarked}';
  }
}

/// generated route for
/// [SavedPage]
class SavedRoute extends PageRouteInfo<void> {
  const SavedRoute({List<PageRouteInfo>? children})
      : super(
          SavedRoute.name,
          initialChildren: children,
        );

  static const String name = 'SavedRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SavedRestaurantsPage]
class SavedRestaurantsRoute extends PageRouteInfo<void> {
  const SavedRestaurantsRoute({List<PageRouteInfo>? children})
      : super(
          SavedRestaurantsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SavedRestaurantsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SelectPreferencePage]
class SelectPreferenceRoute extends PageRouteInfo<void> {
  const SelectPreferenceRoute({List<PageRouteInfo>? children})
      : super(
          SelectPreferenceRoute.name,
          initialChildren: children,
        );

  static const String name = 'SelectPreferenceRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<SplashRouteArgs> {
  SplashRoute({
    Key? key,
    String? peopleId,
    String? postId,
    List<PageRouteInfo>? children,
  }) : super(
          SplashRoute.name,
          args: SplashRouteArgs(
            key: key,
            peopleId: peopleId,
            postId: postId,
          ),
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<SplashRouteArgs> page = PageInfo<SplashRouteArgs>(name);
}

class SplashRouteArgs {
  const SplashRouteArgs({
    this.key,
    this.peopleId,
    this.postId,
  });

  final Key? key;

  final String? peopleId;

  final String? postId;

  @override
  String toString() {
    return 'SplashRouteArgs{key: $key, peopleId: $peopleId, postId: $postId}';
  }
}

/// generated route for
/// [StandingsPage]
class StandingsRoute extends PageRouteInfo<void> {
  const StandingsRoute({List<PageRouteInfo>? children})
      : super(
          StandingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'StandingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [VerifyOtpPage]
class VerifyOtpRoute extends PageRouteInfo<void> {
  const VerifyOtpRoute({List<PageRouteInfo>? children})
      : super(
          VerifyOtpRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerifyOtpRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [YourPeopleListPage]
class YourPeopleListRoute extends PageRouteInfo<YourPeopleListRouteArgs> {
  YourPeopleListRoute({
    Key? key,
    int? tabIndex,
    List<PageRouteInfo>? children,
  }) : super(
          YourPeopleListRoute.name,
          args: YourPeopleListRouteArgs(
            key: key,
            tabIndex: tabIndex,
          ),
          initialChildren: children,
        );

  static const String name = 'YourPeopleListRoute';

  static const PageInfo<YourPeopleListRouteArgs> page =
      PageInfo<YourPeopleListRouteArgs>(name);
}

class YourPeopleListRouteArgs {
  const YourPeopleListRouteArgs({
    this.key,
    this.tabIndex,
  });

  final Key? key;

  final int? tabIndex;

  @override
  String toString() {
    return 'YourPeopleListRouteArgs{key: $key, tabIndex: $tabIndex}';
  }
}
