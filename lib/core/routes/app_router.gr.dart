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
    CommentsRoute.name: (routeData) {
      final args = routeData.argsAs<CommentsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CommentsPage(
          key: args.key,
          amount: args.amount,
        ),
      );
    },
    CreatePostRoute.name: (routeData) {
      final args = routeData.argsAs<CreatePostRouteArgs>(
          orElse: () => const CreatePostRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CreatePostPage(
          key: args.key,
          imageFile: args.imageFile,
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
    NotificationRoute.name: (routeData) {
      final args = routeData.argsAs<NotificationRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NotificationPage(
          todayNotifications: args.todayNotifications,
          yesterdayNotifications: args.yesterdayNotifications,
          olderNotifications: args.olderNotifications,
          key: args.key,
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
          peopleId: args.peopleId,
          isFollow: args.isFollow,
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
          rating: args.rating,
          numberOfReviews: args.numberOfReviews,
          restaurantId: args.restaurantId,
        ),
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
    YourPeopleListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const YourPeopleListPage(),
      );
    },
    YourPeopleRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const YourPeoplePage(),
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
/// [CommentsPage]
class CommentsRoute extends PageRouteInfo<CommentsRouteArgs> {
  CommentsRoute({
    Key? key,
    required String amount,
    List<PageRouteInfo>? children,
  }) : super(
          CommentsRoute.name,
          args: CommentsRouteArgs(
            key: key,
            amount: amount,
          ),
          initialChildren: children,
        );

  static const String name = 'CommentsRoute';

  static const PageInfo<CommentsRouteArgs> page =
      PageInfo<CommentsRouteArgs>(name);
}

class CommentsRouteArgs {
  const CommentsRouteArgs({
    this.key,
    required this.amount,
  });

  final Key? key;

  final String amount;

  @override
  String toString() {
    return 'CommentsRouteArgs{key: $key, amount: $amount}';
  }
}

/// generated route for
/// [CreatePostPage]
class CreatePostRoute extends PageRouteInfo<CreatePostRouteArgs> {
  CreatePostRoute({
    Key? key,
    XFile? imageFile,
    List<PageRouteInfo>? children,
  }) : super(
          CreatePostRoute.name,
          args: CreatePostRouteArgs(
            key: key,
            imageFile: imageFile,
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
    this.imageFile,
  });

  final Key? key;

  final XFile? imageFile;

  @override
  String toString() {
    return 'CreatePostRouteArgs{key: $key, imageFile: $imageFile}';
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
/// [NotificationPage]
class NotificationRoute extends PageRouteInfo<NotificationRouteArgs> {
  NotificationRoute({
    required List<NotificationData> todayNotifications,
    required List<NotificationData> yesterdayNotifications,
    required List<NotificationData> olderNotifications,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          NotificationRoute.name,
          args: NotificationRouteArgs(
            todayNotifications: todayNotifications,
            yesterdayNotifications: yesterdayNotifications,
            olderNotifications: olderNotifications,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

  static const PageInfo<NotificationRouteArgs> page =
      PageInfo<NotificationRouteArgs>(name);
}

class NotificationRouteArgs {
  const NotificationRouteArgs({
    required this.todayNotifications,
    required this.yesterdayNotifications,
    required this.olderNotifications,
    this.key,
  });

  final List<NotificationData> todayNotifications;

  final List<NotificationData> yesterdayNotifications;

  final List<NotificationData> olderNotifications;

  final Key? key;

  @override
  String toString() {
    return 'NotificationRouteArgs{todayNotifications: $todayNotifications, yesterdayNotifications: $yesterdayNotifications, olderNotifications: $olderNotifications, key: $key}';
  }
}

/// generated route for
/// [PeopleProfilePage]
class PeopleProfileRoute extends PageRouteInfo<PeopleProfileRouteArgs> {
  PeopleProfileRoute({
    Key? key,
    required String peoplename,
    required String peopleimage,
    required String peopleId,
    required bool isFollow,
    List<PageRouteInfo>? children,
  }) : super(
          PeopleProfileRoute.name,
          args: PeopleProfileRouteArgs(
            key: key,
            peoplename: peoplename,
            peopleimage: peopleimage,
            peopleId: peopleId,
            isFollow: isFollow,
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
    required this.peopleId,
    required this.isFollow,
  });

  final Key? key;

  final String peoplename;

  final String peopleimage;

  final String peopleId;

  final bool isFollow;

  @override
  String toString() {
    return 'PeopleProfileRouteArgs{key: $key, peoplename: $peoplename, peopleimage: $peopleimage, peopleId: $peopleId, isFollow: $isFollow}';
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
    required String rating,
    required String numberOfReviews,
    required String restaurantId,
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
            rating: rating,
            numberOfReviews: numberOfReviews,
            restaurantId: restaurantId,
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
    required this.rating,
    required this.numberOfReviews,
    required this.restaurantId,
  });

  final Key? key;

  final String address;

  final String image;

  final String lat;

  final String lng;

  final String name;

  final String description;

  final String rating;

  final String numberOfReviews;

  final String restaurantId;

  @override
  String toString() {
    return 'RestaurantDetailRouteArgs{key: $key, address: $address, image: $image, lat: $lat, lng: $lng, name: $name, description: $description, rating: $rating, numberOfReviews: $numberOfReviews, restaurantId: $restaurantId}';
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

/// generated route for
/// [YourPeopleListPage]
class YourPeopleListRoute extends PageRouteInfo<void> {
  const YourPeopleListRoute({List<PageRouteInfo>? children})
      : super(
          YourPeopleListRoute.name,
          initialChildren: children,
        );

  static const String name = 'YourPeopleListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [YourPeoplePage]
class YourPeopleRoute extends PageRouteInfo<void> {
  const YourPeopleRoute({List<PageRouteInfo>? children})
      : super(
          YourPeopleRoute.name,
          initialChildren: children,
        );

  static const String name = 'YourPeopleRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
