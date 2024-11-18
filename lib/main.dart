import 'package:auto_route/auto_route.dart';
import 'dart:io';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/constants/app_urls.dart';
import 'package:for_the_table/core/routes/app_router.dart';
import 'package:for_the_table/core/shared/providers.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/utils/app_log.dart';
import 'package:for_the_table/core/utils/app_widget.dart';
import 'package:for_the_table/firebase_options.dart';
import 'package:for_the_table/screens/notification/shared/providers.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'model/notification_model/notification_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await requestNotificationPermission();
  FirebaseMessaging.instance.setAutoInitEnabled(true);
  await FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
  AwesomeNotifications().initialize(
    'resource://drawable/notification_icon',
    [
      NotificationChannel(
        channelKey: 'high_importance_channel',
        channelName: 'High Importance Notifications',
        channelDescription: 'Notifications with high importance',
        defaultColor: AppColors.colorPrimary,
        ledColor: AppColors.colorWhite,
        importance: NotificationImportance.High,
        playSound: true,
        // soundSource: 'resource://raw/res_custom_notification',
      ),
    ],
  );

  FirebaseMessaging.instance.getInitialMessage().then((message) {
    if (message != null) {
        _handleNotificationAction(message);
        AppLog.log("initial message found");
      }else{
        AppLog.log("No initial message found");
      }
  });
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    AppLog.log("Payload: ${message.data.toString()}");
  });
  // FirebaseMessaging.onMessageOpenedApp.listen(_handleNotificationAction);
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    AppLog.log('A new onMessageOpenedApp event was published!');
    if (message.data['type'] != null) {
      _handleNotificationAction(message);
    }
  });


  AwesomeNotifications().setListeners(
      onActionReceivedMethod: NotificationController.onActionReceivedMethod,
  );

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(ProviderScope(child: MainApp()));
  });
}

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
final container = ProviderContainer();
final notificationNotifier = container.read(notificationNotifierProvider.notifier);
NotificationData? notifications;

void _handleNotificationAction(RemoteMessage message) async {
  final type = message.data['type'];
  final title = message.data['title'];
  final body = message.data['body'];
  final postId = message.data['ref_post_id'];
  final userId = message.data['user_id'];
  final receiverId = message.data['ref_user_follow_id'];
  final profileImage = "${AppUrls.profilePicLocation}/${message.data['user_profile_image']}";
  final userName = message.data['user_full_name'];


  notifications = NotificationData(
    title: title,
    message: body,
    refPostId: postId,
    postedUserInfo: UserNotificationInfo(
        profileImage: profileImage,
        fullName: userName,
        id: userId
    ),
    createdAt: DateTime.now(),
    receiverUserInfo: UserNotificationInfo(id: receiverId),
  );
  if (type != null) {
    _safeNavigateToNotificationScreen(type);
  } else {
    AppLog.log("Notification type is null");
  }
}

void _safeNavigateToNotificationScreen(String type) {
  final context = scaffoldMessengerKey.currentContext;

  if (context != null) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _navigateToNotificationScreen(context, type);
    });
  } else {
    AppLog.log("Context is null, delaying navigation");
    _delayedNavigateToNotificationScreen(type);
  }
}

void _delayedNavigateToNotificationScreen(String type) {
// Use a listener on scaffoldMessengerKey to detect when context is ready
  scaffoldMessengerKey.currentState?.mounted ?? WidgetsBinding.instance.addPostFrameCallback((_) {
    final context = scaffoldMessengerKey.currentContext;
    if (context != null) {
      _navigateToNotificationScreen(context, type);
    }
  });
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  AppLog.log("Handling a background message: ${message.messageId}");
  // _handleNotificationAction(message);
}

Future<void> requestNotificationPermission() async {
  NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: true,
    badge: true,
    carPlay: true,
    criticalAlert: true,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    AppLog.log('Firebase Messaging: User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    AppLog.log('Firebase Messaging: User granted provisional permission');
  } else {
    AppLog.log('Firebase Messaging: User declined permission');
    openAppSettings();
  }

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    AppLog.log("Received a foreground message: ${message.messageId}");
    if (message.notification != null) {
      _showNotification(message);
    }
  });
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    AppLog.log('A new onMessageOpenedApp event was published!');
    if (message.data['type'] != null) {
      _handleNotificationAction(message);
    }
  });
}

Future<void> _showNotification(RemoteMessage message) async {
  final title = message.data['title'];
  final body = message.data['body'];
  final profileImage = "${AppUrls.profilePicLocation}/${message.data['user_profile_image']}";
  final userName = message.data['user_full_name'];
  final receiverId = message.data['ref_user_follow_id'];

  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      channelKey: 'high_importance_channel',
      id: DateTime.now().millisecondsSinceEpoch.remainder(100000),
      title: message.notification?.title,
      body: message.notification?.body,
      notificationLayout: NotificationLayout.Default,
      wakeUpScreen: true,
      payload: {
        'user_profile_image': profileImage,
        'user_full_name': userName,
        'type': message.data['type'],
        'click_action': "FLUTTER_NOTIFICATION_CLICK"
      },
    ),
    actionButtons: [
      NotificationActionButton(
        key: 'open',
        label: 'Open',
        actionType: ActionType.Default,
      ),
    ],
  );

  notificationNotifier.addNotification(NotificationData(
    title: title,
    message: body,
    postedUserInfo: UserNotificationInfo(
        profileImage: profileImage,
        fullName: userName),
    createdAt: DateTime.now(),
    receiverUserInfo: UserNotificationInfo(id: receiverId),
  ));
}

void _navigateToNotificationScreen(BuildContext context, String type) {
  final userId = notifications?.postedUserInfo?.id;
  final receiverId = notifications?.receiverUserInfo?.id;
  final postId = notifications?.refPostId;

  final autoRouter = AppRouter();
  switch (type) {
    case 'user_accept':
    case 'user_deny':
    case 'user_follow':
    case 'user_unfollow':
      autoRouter.pushAndPopUntil(
        PeopleProfileRoute(
          peopleId: userId ?? '',
            // isDeepLinking: true
        ),
        predicate: (_) => false,
      );
      AppLog.log("Navigating to PeopleProfileRoute");
      break;
    case 'post_like':
    case 'post_dislike':
    case 'post_save':
    case 'comment_like':
    case 'comment_add':
      autoRouter.pushAndPopUntil(
        PostDetailsRoute(
          postId: postId,
          userId: receiverId,
            // isDeepLinking: true
        ),
        predicate: (_) => false,
      );
      AppLog.log("Navigating to PostDetailsRoute");
      break;
    case 'chat':
      autoRouter.pushAndPopUntil(
        DirectMessageRoute(
            peopleId: notifications?.postedUserInfo?.id??""
          // isDeepLinking: true
        ),
        predicate: (_) => false,
      );
      AppLog.log("Navigating to DirectMessageRoute");
    default:
      AppLog.log('Unhandled notification type: $type');
      break;
  }
}

final initializationProvider = FutureProvider<Unit>((ref) async {
  await ref.read(hiveProvider).init();

  ref.read(dioProvider)
    ..options = BaseOptions(
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      validateStatus: (_) => true,
      headers: {
        HttpHeaders.userAgentHeader: 'dio',
        'api': '1.0.0',
      },
      // contentType: Headers.jsonContentType,
      // responseType: ResponseType.plain,
      baseUrl: 'https://forthetable.dedicateddevelopers.us/api',
    )
    ..interceptors;

  ref.read(dioProvider).interceptors.add(
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
    ),
  );

  return unit;
});

class MainApp extends ConsumerWidget {
  MainApp({super.key});
  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(initializationProvider, (_, __) {});
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
      // statusBarColor: AppColors.colorTransparent,
    ));
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      useInheritedMediaQuery: true,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          scaffoldMessengerKey: scaffoldMessengerKey,
          theme: ThemeData(
            // inputDecorationTheme: InputDecorationTheme(
            //   contentPadding: EdgeInsets.symmetric(
            //     vertical: 10,
            //     horizontal: 20,
            //   ),
            // ),
            pageTransitionsTheme: const PageTransitionsTheme(builders: {
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            }),
            scaffoldBackgroundColor: AppColors.colorBackground,
            appBarTheme: const AppBarTheme(color: AppColors.colorWhite),
            // bottomSheetTheme: BottomSheetThemeData(
            //   backgroundColor: Colors.black.withOpacity(0),
            // ),
            useMaterial3: true,
          ),
          title: 'For The Table',
          routerConfig: appRouter.config(
            includePrefixMatches: true,
            deepLinkBuilder: (deepLink) {
              List listOfSubstrings = deepLink.path.split('/');
              AppLog.log(listOfSubstrings.toString());
              if (deepLink.path.startsWith('/splash')) {
                return DeepLink([
                  SplashRoute(peopleId: listOfSubstrings.last),
                ]);
              }else {
                return DeepLink.defaultPath;
              }
            },
          ),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

class NotificationController {
  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(ReceivedAction receivedAction) async {
    final notificationType = receivedAction.payload?['type'];
    if (notificationType != null) {
      _safeNavigateToNotificationScreen(notificationType);
    }
  }
}