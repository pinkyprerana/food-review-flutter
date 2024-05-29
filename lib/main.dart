import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/routes/app_router.dart';
import 'package:for_the_table/core/shared/providers.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/utils/app_widget.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
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
}
