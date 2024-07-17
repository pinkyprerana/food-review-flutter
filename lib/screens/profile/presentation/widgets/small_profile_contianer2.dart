import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/styles/app_colors.dart';

class SmallProfileContainer2 extends StatelessWidget {
  const SmallProfileContainer2({super.key, required this.widget});
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    var isIos = Platform.isIOS;

    return Container(
      // width: isIos ? 90 : double.infinity,
      padding: const EdgeInsets.all(16).r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AppColors.colorSmallProfileContainerBorder,
          width: 1,
        ),
      ),
      child: widget,
    );
  }
}
