import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/routes/app_router.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';

class RestaurantListView extends StatelessWidget {
  const RestaurantListView({super.key, required this.restaurants});
  final List<Map<String, dynamic>> restaurants;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 0.54.sh,
      child: ListView.separated(
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              AutoRouter.of(context).push(const RestaurantDetailRoute());
            },
            child: Container(
              padding: const EdgeInsets.fromLTRB(9.0, 8.0, 18.0, 8.0).r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: AppColors.colorGrey),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0).r,
                    child: Image.asset(
                      restaurants[index]['image']!,
                      width: 48.r,
                      height: 48.r,
                      fit: BoxFit.cover,
                    ),
                  ),
                  10.horizontalSpace,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          restaurants[index]['name']!,
                          style: AppTextStyles.textStylePoppinsMedium.copyWith(
                            color: AppColors.colorPrimary,
                            fontSize: 13.sp,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          children: [
                            Image.asset(Assets.locationMarker),
                            3.horizontalSpace,
                            Text(
                              restaurants[index]['location']!,
                              style: AppTextStyles.textStylePoppinsRegular
                                  .copyWith(
                                color: AppColors.colorPrimaryAlpha,
                                fontSize: 10.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.star,
                                  color: AppColors.colorPrimary, size: 14.r),
                              SizedBox(width: 4.w),
                              Text(
                                restaurants[index]['rating']!,
                                style: AppTextStyles.textStylePoppinsRegular
                                    .copyWith(
                                  color: AppColors.colorPrimary,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            restaurants[index]['reviews']!,
                            style:
                                AppTextStyles.textStylePoppinsRegular.copyWith(
                              color: AppColors.colorPrimaryAlpha,
                              fontSize: 8.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => 5.verticalSpace,
      ),
    );
  }
}
