import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';

import '../screens/auth/shared/providers.dart';

class ExpandedCommonTextField extends ConsumerStatefulWidget {
  const ExpandedCommonTextField({
    this.label,
    required this.hint,
    this.maxLength,
    this.width,
    this.controller,
    this.focusNode,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.onFieldSubmitted,
    this.expands,
    this.maxLines,
    super.key,
  });
  final String? label;
  final String hint;
  final bool isPassword;
  final TextInputType? keyboardType;
  final int? maxLength;
  final double? width;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmitted;
  final bool? expands;
  final int? maxLines;

  @override
  ConsumerState<ExpandedCommonTextField> createState() =>
      _ExpandedCommonTextFieldState();
}

class _ExpandedCommonTextFieldState extends ConsumerState<ExpandedCommonTextField> {

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authNotifierProvider);
    return Container(
      height: 60.r,
      width: widget.width ?? double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 16).r,
      decoration: BoxDecoration(
          color: AppColors.colorGrey, borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        expands: (widget.expands != null) ? widget.expands! : false,
        maxLines: (widget.maxLines != null) ? widget.maxLines : null,
        controller: widget.controller,
        focusNode: widget.focusNode,
        maxLength: widget.maxLength,
        decoration: InputDecoration(
          counterText: '',
          labelText: (widget.label != null) ? widget.label : null,
          labelStyle: AppTextStyles.textStylePoppinsLight.copyWith(
            color: AppColors.colorPrimaryAlpha,
            fontSize: 11.sp,
          ),
          hintText: widget.hint,
          hintStyle: AppTextStyles.textStylePoppinsRegular.copyWith(
            color: AppColors.colorPrimaryAlpha,
          ),
          border: InputBorder.none,
          floatingLabelBehavior: (widget.label != null)
              ? FloatingLabelBehavior.always
              : FloatingLabelBehavior.never,
          suffix: widget.isPassword
              ? GestureDetector(
            onTap: () => ref.read(authNotifierProvider.notifier).togglePasswordVisibility(),
            child: state.isPasswordVisible
                      ? const Icon(
                          Icons.visibility_outlined,
                          color: AppColors.colorPrimaryAlpha,
                        )
                      : const Icon(
                          Icons.visibility_off_outlined,
                          color: AppColors.colorPrimaryAlpha,
                        ),
                )
              : const Icon(
                  Icons.text_fields_rounded,
                  color: AppColors.colorTransparent,
                ),
          prefixText: widget.keyboardType == TextInputType.phone ? '+1 ' : null,
        ),
        keyboardType: widget.keyboardType,
        obscureText: widget.isPassword && !state.isPasswordVisible,
        style: AppTextStyles.textStylePoppinsRegular.copyWith(fontSize: 13.sp),
        onFieldSubmitted: widget.onFieldSubmitted,
      ),
    );
  }
}
