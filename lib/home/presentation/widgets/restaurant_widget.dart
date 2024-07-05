import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';

class RestaurantWidget extends StatelessWidget {
  const RestaurantWidget({
    super.key,
    required this.imgpath,
    required this.address,
    required this.numberOfReviews,
    required this.rating,
    required this.name,
  });

  final String imgpath;
  final String address;
  final String rating;
  final String numberOfReviews;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0).r,
      child: ListTile(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: AppColors.colorGrey, width: 1),
          borderRadius: BorderRadius.circular(15),
        ),
        leading: Container(
          width: 45.w,
          height: 45.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: CachedNetworkImageProvider(imgpath),
                fit: BoxFit.cover,
              )
              // image: DecorationImage(
              //   image: AssetImage(imgpath),
              //   fit: BoxFit.cover,
              // ),
              ),
        ),
        title: Text(
          name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.textStylePoppinsMedium.copyWith(
            fontSize: 13.sp,
            color: AppColors.colorPrimary,
          ),
        ),
        subtitle: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(Assets.locationMarker),
            3.horizontalSpace,
            Expanded(
              child: Text(
                address,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.textStylePoppinsRegular.copyWith(
                  fontSize: 10.sp,
                  color: AppColors.colorPrimaryAlpha,
                ),
              ),
            ),
          ],
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(Assets.star),
                2.horizontalSpace,
                (rating != '')
                    ? Text(
                        rating,
                        style: AppTextStyles.textStylePoppinsRegular.copyWith(
                          fontSize: 10.sp,
                          color: AppColors.colorPrimary,
                        ),
                      )
                    : Text(
                        '0.0',
                        style: AppTextStyles.textStylePoppinsRegular.copyWith(
                          fontSize: 10.sp,
                          color: AppColors.colorPrimary,
                        ),
                      )
              ],
            ),
            (numberOfReviews != '')
                ? Text(
                    '$numberOfReviews reviews',
                    style: AppTextStyles.textStylePoppinsRegular.copyWith(
                      fontSize: 8.sp,
                      color: AppColors.colorPrimaryAlpha,
                    ),
                  )
                : Text(
                    '0 reviews',
                    style: AppTextStyles.textStylePoppinsRegular.copyWith(
                      fontSize: 8.sp,
                      color: AppColors.colorPrimaryAlpha,
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
