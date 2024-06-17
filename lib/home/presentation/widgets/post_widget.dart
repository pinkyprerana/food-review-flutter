import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/styles/app_colors.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10).r,
      width: 343.w,
      height: 295.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
            image: AssetImage(Assets.post2), fit: BoxFit.cover),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0).r,
        child: Column(
          children: [
            const Spacer(),
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  width: 323.w,
                  height: 170.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // color: AppColors.colorWhite.withOpacity(0.3),
                    gradient: LinearGradient(
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff0A0A0A).withOpacity(0.1),
                        Color(0xff000000).withOpacity(0)
                      ],
                    ),
                    //border: Border.all(width: 1, color: Colors.white30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
