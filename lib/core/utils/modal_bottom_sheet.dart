import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/styles/app_colors.dart';

Future<void> commonModal(
  BuildContext context, {
  required Widget child,
}) async {
  return showModalBottomSheet<dynamic>(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Wrap(
          children: [
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                          top: 25, bottom: 15, left: 10, right: 10)
                      .r,
                  decoration: const BoxDecoration(
                    color: AppColors.colorWhite,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: child,
                ),
                Positioned(
                    right: -1,
                    top: -2,
                    child: Container(
                      margin: EdgeInsets.only(right: 15, top: 10).r,
                      width: 30.w,
                      height: 30.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.colorPrimary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.close,
                        size: 17,
                        color: AppColors.colorWhite,
                      ),
                    ))
              ],
            ),
          ],
        );
      });
}
