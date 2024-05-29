import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/styles/app_colors.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({
    super.key,
    this.child,
    this.padding,
  });
  final Widget? child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isScreenSmall = size.height < 750;
    return SizedBox(
      height: 1.sh,
      width: 1.sw,
      child: Stack(
        children: [
          Positioned(
            top: 40,
            child: Transform.rotate(
              // angle: 0,
              angle: (isScreenSmall ? -23.50 : -21.98) * (math.pi / 180),

              child: Container(
                height: 2.sh,
                width: isScreenSmall ? 1.4.sw : 1.5.sw,
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
          ),
          if (child != null)
            Padding(padding: padding ?? EdgeInsets.zero, child: child!),
        ],
      ),
    );
  }
}
