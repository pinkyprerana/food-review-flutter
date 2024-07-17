import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/styles/app_colors.dart';

class PostContent extends StatelessWidget {
  const PostContent({
    super.key,
    required this.inFrontContent,
  });
  final Widget inFrontContent;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.8.sh,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8).r,
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        // color: Colors.black,
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          colors: AppColors.postGradient,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: inFrontContent,
    );
  }
}