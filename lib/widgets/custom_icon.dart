import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradientIcon extends StatelessWidget {
  final IconData icon;
  final double size;

  const GradientIcon({
    Key? key,
    required this.icon,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          colors: [Colors.purple, Colors.pink, Colors.orange, Colors.yellow],
          tileMode: TileMode.mirror,
        ).createShader(bounds);
      },
      child: Icon(
        icon,
        size: size,
        color: Colors.white,
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GradientIcon(
          icon: Icons.check_circle_outline_rounded,
          size: 100.h,
        ),
      ),
    );
  }
}
