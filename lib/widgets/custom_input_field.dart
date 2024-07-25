import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import '../screens/auth/shared/providers.dart';

class CustomInputField extends ConsumerStatefulWidget {
  const CustomInputField({
    this.label,
    required this.hint,
    this.maxLength,
    this.width,
    this.controller,
    this.focusNode,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.onFieldSubmitted,
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

  @override
  ConsumerState<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends ConsumerState<CustomInputField> {

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authNotifierProvider);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: TextFormField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        maxLength: widget.maxLength,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.colorGrey,
          alignLabelWithHint: true,
          labelText: (widget.label != null) ? widget.label : null,
          labelStyle: AppTextStyles.textStylePoppinsLight.copyWith(
            color: AppColors.colorPrimaryAlpha,
            fontSize: 11.sp,
          ),
          hintText: widget.hint,
          counterText: "",
          hintStyle: AppTextStyles.textStylePoppinsRegular.copyWith(
            color: AppColors.colorPrimaryAlpha,
          ),
          border: InputBorder.none,
          floatingLabelBehavior:
              (widget.label != null) ? FloatingLabelBehavior.always : FloatingLabelBehavior.never,
          suffixIcon: widget.isPassword
              ? GestureDetector(
            onTap: () => ref.read(authNotifierProvider.notifier).togglePasswordVisibility(),
            child: state.isPasswordVisible
                      ? const Icon(
                          Icons.visibility_off_outlined,
                          color: AppColors.colorPrimaryAlpha,
                        )
                      : const Icon(
                          Icons.visibility_outlined,
                          color: AppColors.colorPrimaryAlpha,
                        ),
                )
              : const Icon(
                  Icons.text_fields_rounded,
                  color: AppColors.colorTransparent,
                ),
          // prefixText: widget.keyboardType == TextInputType.phone ? '+1 ' : null,
        ),
        keyboardType: widget.keyboardType,
        obscureText: widget.isPassword && !state.isPasswordVisible,
        obscuringCharacter: '*',
        style: AppTextStyles.textStylePoppinsRegular.copyWith(fontSize: 13.sp),
        onFieldSubmitted: widget.onFieldSubmitted,
      ),
    );
  }
}
