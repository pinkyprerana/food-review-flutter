import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';

class LandingGetStartedBanner extends StatelessWidget {
  const LandingGetStartedBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isScreenSmall = size.height < 750;
    return SizedBox(
      height: isScreenSmall ? 0.42.sh : 0.35.sh,
      width: double.infinity,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              Assets.ftbCustomShapeImage1,
              fit: BoxFit.contain,
              scale: 2,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              Assets.reviewImg2,
              scale: 2,
            ),
          ),
          Positioned(
            bottom: 28,
            left: 0,
            right: 0,
            child: Image.asset(
              Assets.reviewImg1,
              scale: 2,
            ),
          )
        ],
      ),
    );
  }
}
