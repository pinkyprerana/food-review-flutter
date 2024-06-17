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
          ],
        );
      });
}
