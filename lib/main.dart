import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/routes/app_router.dart';
import 'package:for_the_table/core/shared/providers.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/utils/app_log.dart';
import 'package:for_the_table/core/utils/app_widget.dart';
import 'package:for_the_table/firebase_options.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChannels.textInput.invokeMethod('TextInput.hide');
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(ProviderScope(child: MainApp()));
  });
}

final initializationProvider = FutureProvider<Unit>((ref) async {
  await ref.read(hiveProvider).init();

  ref.read(dioProvider)
    ..options = BaseOptions(
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      validateStatus: (status) {
        return true;
      },
      baseUrl: 'Demo',
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
          // routeInformationParser: appRouter.defaultRouteParser(),
          // routerDelegate: appRouter.delegate(),
          routerConfig: appRouter.config(
            includePrefixMatches: true,
            deepLinkBuilder: (deepLink) {
              AppLog.log('deepLink =========== >> ${deepLink.path}');
              List listOfSubstrings = deepLink.path.split('/');
              AppLog.log(listOfSubstrings.toString());
              if (deepLink.path.startsWith('/splash')) {
                AppLog.log('-----deep link to people profile---------');
                // continue with the platform link
                return DeepLink([
                  SplashRoute(peopleId: listOfSubstrings.last),
                  // PeopleProfileRoute(peopleId: listOfSubstrings.last ?? '')
                ]);
                // return deepLink;
              } else {
                return DeepLink.defaultPath;
                // or DeepLink.path('/')
                // or DeepLink([HomeRoute()])
              }
            },
          ),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
