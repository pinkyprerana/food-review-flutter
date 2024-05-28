import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/styles/app_colors.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      child: Transform.rotate(
        // angle: 0,
        angle: (size.height < 750 ? -25.98 : -21.98) * (math.pi / 180),

        child: Container(
          height: 2.sh,
          width: 1.45.sw,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80),
            // color: Colors.green,
            gradient: const LinearGradient(
              colors: AppColors.colorGreyGradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
    );
  }
}
