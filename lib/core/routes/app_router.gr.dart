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
    BaseRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BasePage(),
      );
    },
    CommentsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CommentsPage(),
      );
    },
    EditProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EditProfilePage(),
      );
    },
    FollowListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FollowListPage(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ForgotPasswordPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    HomeRouteNew.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePageNew(),
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
    ListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ListPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginPage(),
      );
    },
    NotificationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NotificationPage(),
      );
    },
    OpenGalleryRoute.name: (routeData) {
      final args = routeData.argsAs<OpenGalleryRouteArgs>(
          orElse: () => const OpenGalleryRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OpenGalleryPage(
          key: args.key,
          imageFile: args.imageFile,
        ),
      );
    },
    PeopleProfileRoute.name: (routeData) {
      final args = routeData.argsAs<PeopleProfileRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PeopleProfilePage(
          key: args.key,
          peoplename: args.peoplename,
          peopleimage: args.peopleimage,
        ),
      );
    },
    PhotoClickRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PhotoClickPage(),
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
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RestaurantDetailPage(),
      );
    },
    SavedRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SavedPage(),
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
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
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
  };
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
/// [CommentsPage]
class CommentsRoute extends PageRouteInfo<void> {
  const CommentsRoute({List<PageRouteInfo>? children})
      : super(
          CommentsRoute.name,
          initialChildren: children,
        );

  static const String name = 'CommentsRoute';

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
/// [FollowListPage]
class FollowListRoute extends PageRouteInfo<void> {
  const FollowListRoute({List<PageRouteInfo>? children})
      : super(
          FollowListRoute.name,
          initialChildren: children,
        );

  static const String name = 'FollowListRoute';

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
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePageNew]
class HomeRouteNew extends PageRouteInfo<void> {
  const HomeRouteNew({List<PageRouteInfo>? children})
      : super(
          HomeRouteNew.name,
          initialChildren: children,
        );

  static const String name = 'HomeRouteNew';

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
/// [OpenGalleryPage]
class OpenGalleryRoute extends PageRouteInfo<OpenGalleryRouteArgs> {
  OpenGalleryRoute({
    Key? key,
    XFile? imageFile,
    List<PageRouteInfo>? children,
  }) : super(
          OpenGalleryRoute.name,
          args: OpenGalleryRouteArgs(
            key: key,
            imageFile: imageFile,
          ),
          initialChildren: children,
        );

  static const String name = 'OpenGalleryRoute';

  static const PageInfo<OpenGalleryRouteArgs> page =
      PageInfo<OpenGalleryRouteArgs>(name);
}

class OpenGalleryRouteArgs {
  const OpenGalleryRouteArgs({
    this.key,
    this.imageFile,
  });

  final Key? key;

  final XFile? imageFile;

  @override
  String toString() {
    return 'OpenGalleryRouteArgs{key: $key, imageFile: $imageFile}';
  }
}

/// generated route for
/// [PeopleProfilePage]
class PeopleProfileRoute extends PageRouteInfo<PeopleProfileRouteArgs> {
  PeopleProfileRoute({
    Key? key,
    required String peoplename,
    required String peopleimage,
    List<PageRouteInfo>? children,
  }) : super(
          PeopleProfileRoute.name,
          args: PeopleProfileRouteArgs(
            key: key,
            peoplename: peoplename,
            peopleimage: peopleimage,
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
    required this.peoplename,
    required this.peopleimage,
  });

  final Key? key;

  final String peoplename;

  final String peopleimage;

  @override
  String toString() {
    return 'PeopleProfileRouteArgs{key: $key, peoplename: $peoplename, peopleimage: $peopleimage}';
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
class RestaurantDetailRoute extends PageRouteInfo<void> {
  const RestaurantDetailRoute({List<PageRouteInfo>? children})
      : super(
          RestaurantDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'RestaurantDetailRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
