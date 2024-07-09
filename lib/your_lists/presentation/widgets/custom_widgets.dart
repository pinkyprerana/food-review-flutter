import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_text_styles.dart';


class FilterButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Function() onPressed;

  FilterButton({
    required this.text,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        side: const BorderSide(
          color: AppColors.colorGrey3
        ),
        foregroundColor: AppColors.colorPrimaryAlpha,
        backgroundColor: isSelected ? AppColors.colorBlack : AppColors.colorWhite,
      ),
      child: Text(
        text,
        style: AppTextStyles.textStylePoppinsRegular.copyWith(
          fontSize: 10.sp,
        ),
      ),
    );
  }
}


class CustomCard extends StatelessWidget {
  final String name;
  final String date;
  final String imagePath;
  final Widget button;

  const CustomCard({
    required this.name,
    required this.date,
    required this.imagePath,
     required this.button
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          Container(
            foregroundDecoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(22, 22, 22, 1),
                  Color.fromRGBO(22, 22, 22, 1),
                  Color.fromRGBO(22, 22, 22, 0),
                  Color.fromRGBO(22, 22, 22, 0)
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0.0, 0.3, 0.7, 1],
              ),
            ),
            decoration: BoxDecoration(
              color: AppColors.colorGrey,
              image: DecorationImage(
                image: NetworkImage(
                  CachedNetworkImage(
                    imageUrl: imagePath,
                    placeholder: (context, url) => const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ).imageUrl,
                ),
                fit: BoxFit.cover,
              )
            ),
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  name,
                  style: AppTextStyles.textStylePoppinsMedium.copyWith(
                    fontSize: 13.sp,
                    color: AppColors.colorWhite,
                  ),
                ),
                Text(
                  date,
                  style: AppTextStyles.textStylePoppinsLight.copyWith(
                    fontSize: 8.sp,
                    color: AppColors.colorGrey3,
                  ),
                ),
                8.verticalSpace,
                button,
                15.verticalSpace,
              ],
            ),
          )
        ],
      ),
    );
  }
}