import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import '../../../../core/constants/assets.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget(
      {super.key,
      required this.imgpath,
      required this.title,
      required this.subtitle});
  final String imgpath;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0).r,
      child: ListTile(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: AppColors.colorGrey, width: 1),
          borderRadius: BorderRadius.circular(15),
        ),
        leading: SizedBox(
          width: 50.w,
          height: 47.h,
          child:  CachedNetworkImage(
            imageUrl: imgpath,
            placeholder: (context, url) => const CircularProgressIndicator(color: AppColors.colorPrimary,),
            errorWidget: (context, url, error) => ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                Assets.avatar,
                scale: 1,
                fit: BoxFit.cover,
              ),
            ),
            imageBuilder: (context, imageProvider) => Container(
              width: 50.w,
              height: 47.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.textStylePoppinsMedium.copyWith(
            fontSize: 13.sp,
            color: AppColors.colorPrimary,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: AppTextStyles.textStylePoppinsRegular.copyWith(
            fontSize: 10.sp,
            color: AppColors.colorPrimaryAlpha,
          ),
        ),
      ),
    );
  }
}
