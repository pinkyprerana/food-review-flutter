import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:for_the_table/core/utils/common_util.dart';

@RoutePage()
class LandingIntroPage extends StatelessWidget {
  const LandingIntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: loaderPrimaryColor(),
        ),
      ),
    );
  }
}
