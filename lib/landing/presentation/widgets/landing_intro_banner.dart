import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';

class LandingIntroBanner extends StatelessWidget {
  const LandingIntroBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isScreenSmall = size.height < 750;
    return SizedBox(
      width: double.infinity,
      height: 0.50.sh,
      child: Image.asset(
        Assets.landingintro,
        scale: 2,
        fit: isScreenSmall ? BoxFit.contain : BoxFit.cover,
      ),
    );
  }
}
