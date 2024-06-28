import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/landing/presentation/widgets/landing_get_started_banner.dart';
import 'package:for_the_table/landing/presentation/widgets/landing_get_started_description.dart';
import 'package:for_the_table/widgets/custom_background.dart';

@RoutePage()
class LandingGetStartedPage extends StatelessWidget {
  const LandingGetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomBackground(
        padding: const EdgeInsets.symmetric(horizontal: 14).r,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const LandingGetStartedBanner(),
            LandingGetStartedDescription(),
          ],
        ),
      ),
    );
  }
}
