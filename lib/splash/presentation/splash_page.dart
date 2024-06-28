import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/infrastructure/hive_database.dart';
import 'package:for_the_table/core/routes/app_router.dart';
import 'package:for_the_table/core/shared/providers.dart';
import 'package:for_the_table/core/utils/toast.dart';
import 'package:for_the_table/splash/shared/providers.dart';
import 'package:for_the_table/widgets/custom_background.dart';

import '../../core/constants/assets.dart';

@RoutePage()
class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

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
    final stateNotifier = ref.read(splashNotifierProvider.notifier);

    final hive = ref.read(hiveProvider);

    final token = hive.box.get(AppPreferenceKeys.token);

    if (token == null || token.toString().isEmpty) {
      AutoRouter.of(context)
          .pushAndPopUntil(const LandingIntroRoute(), predicate: (_) => false);

      // AutoRouter.of(context)
      //     .pushAndPopUntil(const LoginRoute(), predicate: (_) => false);
    } else {
      showToastMessage('token is true');

      // stateNotifier.getProfile(
      //   onSuccess: (profileResponse) {
      //     final role = profileResponse.role?.roleDisplayName;

      //     if (role == "Influencer") {
      //       if (profileResponse.age == null ||
      //           (profileResponse.location?.isEmpty ?? false)) {
      //         AutoRouter.of(context).pushAndPopUntil(
      //           const InfluencerProfileRoute(),
      //           predicate: (_) => false,
      //         );
      //       } else if (profileResponse.profileImage?.isEmpty ?? false) {
      //         AutoRouter.of(context).pushAndPopUntil(
      //           const InfluencerAddPictureRoute(),
      //           predicate: (_) => false,
      //         );
      //       } else if (profileResponse.socialMedias?.isEmpty ?? false) {
      //         AutoRouter.of(context).pushAndPopUntil(
      //           const InfluencerAddSocialMediaRoute(),
      //           predicate: (_) => false,
      //         );
      //       } else if (profileResponse.influencerTypes?.isEmpty ?? false) {
      //         AutoRouter.of(context).pushAndPopUntil(
      //           const InfluencerSelectTypeRoute(),
      //           predicate: (_) => false,
      //         );
      //       } else if (profileResponse.expertises?.isEmpty ?? false) {
      //         AutoRouter.of(context).pushAndPopUntil(
      //           const InfluencerSelectNicheRoute(),
      //           predicate: (_) => false,
      //         );
      //       } else if (profileResponse.interests?.isEmpty ?? false) {
      //         AutoRouter.of(context).pushAndPopUntil(
      //           const InfluencerSelectContentTypeRoute(),
      //           predicate: (_) => false,
      //         );
      //       } else if (!(profileResponse.signupCompleted ?? true)) {
      //         AutoRouter.of(context).pushAndPopUntil(
      //           const InfluencerSuccessRoute(),
      //           predicate: (_) => false,
      //         );
      //       } else {
      //         AutoRouter.of(context)
      //             .pushAndPopUntil(const BaseRoute(), predicate: (_) => false);
      //       }
      //     } else if (role == "Brand") {
      //       if ((profileResponse.website?.isEmpty ?? false) ||
      //           (profileResponse.location?.isEmpty ?? false)) {
      //         AutoRouter.of(context).pushAndPopUntil(
      //           const BrandOnboarding1Route(),
      //           predicate: (_) => false,
      //         );
      //       } else if (profileResponse.profileImage?.isEmpty ?? false) {
      //         AutoRouter.of(context).pushAndPopUntil(
      //           const BrandOnboarding2Route(),
      //           predicate: (_) => false,
      //         );
      //       } else if (profileResponse.socialMedias?.isEmpty ?? false) {
      //         AutoRouter.of(context).pushAndPopUntil(
      //           const BrandOnboarding3Route(),
      //           predicate: (_) => false,
      //         );
      //       } else if (profileResponse.influencerTypes?.isEmpty ?? false) {
      //         AutoRouter.of(context).pushAndPopUntil(
      //           const BrandOnboarding4Route(),
      //           predicate: (_) => false,
      //         );
      //       } else if (profileResponse.expertises?.isEmpty ?? false) {
      //         AutoRouter.of(context).pushAndPopUntil(
      //           const BrandOnboarding5Route(),
      //           predicate: (_) => false,
      //         );
      //       } else if (profileResponse.interests?.isEmpty ?? false) {
      //         AutoRouter.of(context).pushAndPopUntil(
      //           const BrandOnboarding6Route(),
      //           predicate: (_) => false,
      //         );
      //       } else if (!(profileResponse.signupCompleted ?? true)) {
      //         AutoRouter.of(context).pushAndPopUntil(
      //           const BrandSuccessRoute(),
      //           predicate: (_) => false,
      //         );
      //       } else {
      //         AutoRouter.of(context)
      //             .pushAndPopUntil(const BaseRoute(), predicate: (_) => false);
      //       }
      //     }
      //   },
      //   onFailed: () {
      //     AutoRouter.of(context)
      //         .pushAndPopUntil(const LoginRoute(), predicate: (_) => false);
      //   },
      // );
    }
  }
}
