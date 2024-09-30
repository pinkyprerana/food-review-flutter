import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:for_the_table/screens/landing/presentation/widgets/landing_intro_banner.dart';
import 'package:for_the_table/screens/landing/presentation/widgets/landing_intro_description.dart';
import 'package:for_the_table/widgets/custom_background.dart';

@RoutePage()
class LandingIntroPage extends StatelessWidget {
  const LandingIntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomBackground(
        padding: EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LandingIntroBanner(),
            LandingIntroDescription(),
          ],
        ),
      ),
    );
  }
}
