import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/widgets/app_button.dart';

class FollowersList extends StatelessWidget {
  FollowersList({
    super.key,
  });

  // Dummy data for the followers
  final followers = [
    {
      'name': 'Haylie Lipshutz',
      'image': 'assets/images/temp/follower-sample1.png'
    },
    {
      'name': 'Skylar Bergson',
      'image': 'assets/images/temp/follower-sample2.png'
    },
    {'name': 'Maren Donin', 'image': 'assets/images/temp/follower-sample1.png'},
    {
      'name': 'Gretchen Donin',
      'image': 'assets/images/temp/follower-sample2.png'
    },
    {
      'name': 'Paityn Vaccaro',
      'image': 'assets/images/temp/follower-sample1.png'
    },
    {
      'name': 'Marley Septimus',
      'image': 'assets/images/temp/follower-sample2.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'List Of Your Followers',
          style: AppTextStyles.textStylePoppinsMedium.copyWith(
            color: AppColors.colorPrimary,
            fontSize: 13.sp,
          ),
        ),
        16.verticalSpace,
        Container(
          height: 0.55.sh,
          child: GridView.builder(
            physics: const ClampingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 10.h,
              childAspectRatio: 1,
            ),
            itemCount: 6,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(8.0).r,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: AppColors.colorGrey3),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 24.r,
                      child: Image.asset(
                        followers[index]['image']!,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      followers[index]['name']!,
                      style: AppTextStyles.textStylePoppinsMedium.copyWith(
                        color: AppColors.colorPrimary,
                        fontSize: 13.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Joined May 29, 2024',
                      style: AppTextStyles.textStylePoppinsLight.copyWith(
                        color: AppColors.colorPrimaryAlpha,
                        fontSize: 8.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    10.verticalSpace,
                    AppButton(
                      height: 21.h,
                      width: 64.w,
                      radius: 8,
                      color: AppColors.colorNavy,
                      child: Text(
                        'Follow',
                        style: AppTextStyles.textStylePoppinsBold.copyWith(
                          color: AppColors.colorGrey2,
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
