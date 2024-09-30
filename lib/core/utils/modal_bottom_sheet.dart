import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/styles/app_colors.dart';

Future<void> commonModal(
  BuildContext context, {
  required Widget child,
  required VoidCallback onTap,
  bool? isReviewSource,
}) async {
  return showModalBottomSheet<dynamic>(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      if (isReviewSource ?? false) {
        return Stack(
          children: [
            GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: Container(
                padding: const EdgeInsets.only(top: 25, bottom: 15, left: 10, right: 10).r,
                decoration: const BoxDecoration(
                  color: AppColors.colorWhite,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: child,
              ),
            ),
            Positioned(
              right: -1,
              top: 2,
              child: Container(
                margin: const EdgeInsets.only(right: 15, top: 10).r,
                width: 30.w,
                height: 30.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.colorPrimary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GestureDetector(
                  onTap: () {
                    onTap();
                  },
                  child: const Icon(
                    Icons.close,
                    size: 17,
                    color: AppColors.colorWhite,
                  ),
                ),
              ),
            ),
          ],
        );
      }
      return AnimatedPadding(
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeOut,
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Wrap(
          children: [
            Stack(
              children: [
                GestureDetector(
                  onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                  child: Container(
                    padding: const EdgeInsets.only(top: 25, bottom: 15, left: 10, right: 10).r,
                    decoration: const BoxDecoration(
                      color: AppColors.colorWhite,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    child: child,
                  ),
                ),
                Positioned(
                  right: -1,
                  top: 2,
                  child: Container(
                    margin: const EdgeInsets.only(right: 15, top: 10).r,
                    width: 30.w,
                    height: 30.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.colorPrimary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        onTap();
                      },
                      child: const Icon(
                        Icons.close,
                        size: 17,
                        color: AppColors.colorWhite,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
