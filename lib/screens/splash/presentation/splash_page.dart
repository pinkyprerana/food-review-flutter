import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/infrastructure/hive_database.dart';
import 'package:for_the_table/core/routes/app_router.dart';
import 'package:for_the_table/core/shared/providers.dart';
import 'package:for_the_table/core/utils/app_log.dart';
import 'package:for_the_table/widgets/custom_background.dart';
import 'package:geolocator/geolocator.dart';
import '../../../core/constants/assets.dart';

@RoutePage()
class SplashPage extends ConsumerStatefulWidget {
  final String? peopleId;
  final String? postId;

  const SplashPage({
    super.key,
    this.peopleId,
    this.postId,
  });

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), navigate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: CustomBackground(
        child: Align(
          child: Image.asset(
            Assets.logoTransparent,
          ),
        ),
      ),
    );
  }

  Future<void> navigate() async {
    // final stateOfLocation = ref.watch(locationNotifierProvider);
    final hive = ref.read(hiveProvider);
    final token = hive.box.get(AppPreferenceKeys.token);
    final getStartedDone =
        await hive.box.get(AppPreferenceKeys.getStartedDone) ?? 'false';
    final String? isLocationFetched =
        await hive.box.get(AppPreferenceKeys.isLocationFetched) ?? 'false';
    // final id = await hive.box.get(AppPreferenceKeys.userId);

    final permission = await Geolocator.checkPermission();
    AppLog.log('permissionSplash ${permission.toString()}');

    if (mounted) {
      if (token != null && token.toString().isNotEmpty) {
        if (widget.peopleId != null) {
          AppLog.log('Navigating to PeopleProfileRoute with peopleId: ${widget.peopleId}');
          AutoRouter.of(context).pushAndPopUntil(
              PeopleProfileRoute(
                  peopleId: widget.peopleId!, isDeepLinking: true),
              predicate: (_) => false);
        } else if (widget.postId != null) {
          AutoRouter.of(context).pushAndPopUntil(
              PostDetailsRoute(
                  userId: widget.peopleId!,
                  postId: widget.postId!, isDeepLinking: true),
              predicate: (_) => false);
        } else {
          (permission == LocationPermission.denied ||
                  isLocationFetched == null ||
                  isLocationFetched == 'false')
              ? AutoRouter.of(context).pushAndPopUntil(const LocationRoute(),
                  predicate: (_) => false)
              : AutoRouter.of(context)
                  .pushAndPopUntil(const BaseRoute(), predicate: (_) => false);
        }
      } else if (getStartedDone == 'true') {
        AutoRouter.of(context)
            .pushAndPopUntil(const LoginRoute(), predicate: (_) => false);
      } else {
        AutoRouter.of(context).pushAndPopUntil(const LandingIntroRoute(),
            predicate: (_) => false);
      }
    }
  }
}
