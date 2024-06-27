import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';

class CustomInputField extends StatefulWidget {
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
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: TextFormField(
        //expands: (widget.expands != null) ? widget.expands! : false,
        //maxLines: (widget.maxLines != null) ? widget.maxLines : null,
        controller: widget.controller,
        focusNode: widget.focusNode,
        maxLength: widget.maxLength,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.colorGrey,
          alignLabelWithHint: true,
          // contentPadding: EdgeInsets.symmetric(vertical: 15),
          // counterText: '',
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
          suffixIcon: widget.isPassword
              ? GestureDetector(
                  onTap: () => setState(() {
                    isPasswordVisible = !isPasswordVisible;
                    print("IVP: $isPasswordVisible");
                  }),
                  child: isPasswordVisible
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
        obscureText: widget.isPassword && !isPasswordVisible,
        obscuringCharacter: '*',
        style: AppTextStyles.textStylePoppinsRegular.copyWith(fontSize: 13.sp),
        onFieldSubmitted: widget.onFieldSubmitted,
      ),
    );
  }
}
