import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/constants/app_urls.dart';
import 'package:for_the_table/core/routes/app_router.dart';
import 'package:for_the_table/core/shared/providers.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/utils/app_widget.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:uni_links/uni_links.dart';
import 'core/utils/app_log.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initUniLinks();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(ProviderScope(child: MainApp()));
  });
}

Future<void> initUniLinks() async {
  try {
    // For app launch from a cold start
    final initialLink = await getInitialLink();
    if (initialLink != null) {
      handleDeepLink(initialLink);
    }
    // While the app is in background
    linkStream.listen((String? link) {
      if (link != null) {
        handleDeepLink(link);
      }
    });
  } catch (e) {
    AppLog.log('Failed to get initial link: $e');
  }
}

void handleDeepLink(String link) {
  final uri = Uri.parse(link);
  if (uri.path.startsWith('/user/profile')) {
  }
}

final initializationProvider = FutureProvider<Unit>((ref) async {
  await ref.read(hiveProvider).init();

  final dio = ref.read(dioProvider);
  dio
    ..options = BaseOptions(
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      validateStatus: (status) => true,
      baseUrl: AppUrls.baseUrl,
    )
    ..interceptors.add(
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
      // Uncomment and configure if needed
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

