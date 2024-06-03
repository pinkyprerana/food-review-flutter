import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';

class CustomSearchField extends StatefulWidget {
  const CustomSearchField({
    // required this.label,
    this.hint = 'Search',
    this.maxLength,
    this.width,
    this.controller,
    this.focusNode,
    this.keyboardType = TextInputType.text,
    this.onFieldSubmitted,
    super.key,
  });
  // final String label;
  final String hint;
  final TextInputType? keyboardType;
  final int? maxLength;
  final double? width;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmitted;

  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.r,
      width: widget.width ?? double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 16).r,
      decoration: BoxDecoration(
          color: AppColors.colorGrey, borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        maxLength: widget.maxLength,
        decoration: InputDecoration(
          counterText: '',
          labelStyle: AppTextStyles.textStylePoppinsLight.copyWith(
            color: AppColors.colorPrimaryAlpha,
            fontSize: 11.sp,
          ),
          hintText: widget.hint,
          hintStyle: AppTextStyles.textStylePoppinsRegular.copyWith(
            color: AppColors.colorPrimaryAlpha,
          ),
          border: InputBorder.none,
          // floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
        keyboardType: widget.keyboardType,
        style: AppTextStyles.textStylePoppinsRegular.copyWith(fontSize: 13.sp),
        onFieldSubmitted: widget.onFieldSubmitted,
      ),
    );
  }
}
