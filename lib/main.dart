import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/routes/app_router.dart';
import 'package:for_the_table/core/shared/providers.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/utils/app_widget.dart';
import 'package:for_the_table/firebase_options.dart';
import 'package:for_the_table/screens/notification/shared/providers.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'core/utils/app_log.dart';
import 'model/notification_model/notification_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging.onMessageOpenedApp.listen(_handleNotificationAction);
  await requestNotificationPermission();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(ProviderScope(child: MainApp()));
  });
}

final container = ProviderContainer();
final notificationNotifier = container.read(notificationNotifierProvider.notifier);

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  AppLog.log("Handling a background message: ${message.messageId}");
  // await _showNotification(message);
}

Future<void> requestNotificationPermission() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: true,
    badge: true,
    carPlay: true,
    criticalAlert: true,
    provisional: true,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    AppLog.log('User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    AppLog.log('User granted provisional permission');
  } else {
    AppLog.log('User declined or has not accepted permission');
  }

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    AppLog.log("Received a foreground message: ${message.messageId}");
    if (message.notification != null) {
      _showNotification(message);
    }
  });
}

Future<void> _showNotification(RemoteMessage message) async {
  String? notificationType = message.data['type'];

  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      channelKey: 'high_importance_channel',
      id: DateTime.now().millisecondsSinceEpoch.remainder(100000),
      title: message.notification?.title,
      body: message.notification?.body,
      notificationLayout: NotificationLayout.Default,
      wakeUpScreen: true,
    ),
    actionButtons: [
      NotificationActionButton(
        key: 'open',
        label: 'Open',
        actionType: ActionType.Default,
      ),
    ],
  );

  AppLog.log("notificationType $notificationType");
  _handleNotificationRedirection(notificationType);

  final notifier = container.read(notificationNotifierProvider.notifier);
  if (notifier.mounted) {
    await notifier.getNotificationList();
  }

  final notificationState = container.read(notificationNotifierProvider);
  if (notificationState.todayNotifications.isNotEmpty) {
    final notifications = notificationState.todayNotifications.last.title;
    AppLog.log("Notification title: $notifications");
  } else {
    AppLog.log("No notifications available");
  }

  notificationNotifier.addNotification(NotificationData(
    title: message.notification?.title ?? 'No Title',
    message: message.notification?.body ?? 'No Message',
    postedUserInfo: const UserNotificationInfo(profileImage: '', fullName: ''),
    createdAt: DateTime.now(),
  ));
}


BuildContext? globalContext;

void _handleNotificationRedirection(String? type) {
  MainApp.navigateToNotificationScreen(type);
}

Future<void> _handleNotificationAction(RemoteMessage message) async {
  final type = message.data['type'];
  _handleNotificationRedirection(type);
}
late NotificationData notifications;

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
  static final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

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
          routeInformationParser: appRouter.defaultRouteParser(),
          routerDelegate: appRouter.delegate(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }


   static navigateToNotificationScreen(String? type) {
    if (type == null) return;

    final context = _navigatorKey.currentContext;
    if (context == null) return;

    switch (type) {
      case 'user_accept':
      case 'user_deny':
      case 'user_follow':
      case 'user_unfollow':
        AutoRouter.of(context).push(PeopleProfileRoute(peopleId: notifications.receiverUserInfo?.id??""));
        break;
      case 'post_like':
      case 'post_dislike':
      case 'post_save':
      case 'comment_like':
      case 'comment_add':
         AutoRouter.of(context).push(PostDetailsRoute(postId: notifications.refPostId?? "", userId: notifications.receiverUserInfo?.id??""));
        break;
      default:
        break;
    }
  }
}
