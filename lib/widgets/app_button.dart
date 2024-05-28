import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/core/utils/common_util.dart';

class AppButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Widget? child;
  final Color? color;
  final Color? textColor;
  final bool loading;
  final bool disable;
  final double? width;
  final double? height;

  const AppButton({
    super.key,
    this.onPressed,
    required this.text,
    this.loading = false,
    this.disable = false,
    this.child,
    this.color,
    this.textColor,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // hoverColor: Colors.transparent,
      // focusColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onPressed,
      child: Container(
        width: width ?? MediaQuery.of(context).size.width,
        height: height ?? 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: color ?? AppColors.colorPrimary,
          // gradient: color == null
          //     ? const LinearGradient(
          //         begin: Alignment(1.00, -0.03),
          //         end: Alignment(-1, 0.03),
          //         colors: [AppColors.colorPrimary1, AppColors.colorPrimary1],
          //       )
          //     : null,
        ),
        alignment: Alignment.center,
        child: loading
            ? loader()
            : child ??
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.textStylePoppinsBold.copyWith(
                    fontSize: 15.sp,
                    color: textColor ?? AppColors.colorWhite,
                    fontWeight: FontWeight.w500,
                  ),
                ),
      ),
    );
  }
}
