import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostDetailsBox extends StatelessWidget {
  const PostDetailsBox({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 0.2.sh,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 20.0),
          child: Container(
              // details in here
              alignment: Alignment.center,
              color: Colors.black.withOpacity(0.4),
              child: child),
        ),
      ),
    );
  }
}
