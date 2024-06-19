import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/routes/app_router.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/profile/presentation/widgets/small_profile_container.dart';
import 'package:for_the_table/widgets/app_button.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

@RoutePage()
class RestaurantDetailPage extends StatefulWidget {
  const RestaurantDetailPage({super.key});

  @override
  State<RestaurantDetailPage> createState() => _RestaurantDetailPageState();
}

class _RestaurantDetailPageState extends State<RestaurantDetailPage> {
  Completer<GoogleMapController> _controller = Completer();

  CameraPosition _currentPosition = CameraPosition(
    target: LatLng(13.0827, 80.2707),
    zoom: 12,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        // leadingWidth: 60,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            // width: 20.w,
            // height: 20.h,
            alignment: Alignment.center,
            margin:
                const EdgeInsets.only(top: 10, left: 20, right: 0, bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.colorPrimary.withOpacity(0.20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                5.horizontalSpace, //this is for centering the icon
                Icon(Icons.arrow_back_ios,
                    color: AppColors.colorPrimary, size: 15.h),
              ],
            ),
          ),
        ),
        title: Text(
          'Restaurants',
          style: AppTextStyles.textStylePoppinsBold.copyWith(
            color: AppColors.colorPrimary,
            fontSize: 16.sp,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(18.0).r,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                //height: 380.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.colorCream,
                  border: Border.all(width: 1, color: AppColors.colorBorder),
                ),
                child: Column(
                  children: [
                    // const Spacer(),
                    // 90.verticalSpace,
                    Container(
                      width: double.infinity,
                      height: 200.h,
                      color: Colors.red,
                      child: GoogleMap(
                        initialCameraPosition: _currentPosition,
                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete();
                        },
                      ),
                    ),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 25)
                              .r,
                          // height: 286,
                          decoration: BoxDecoration(
                            color: AppColors.colorWhite,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              80.verticalSpace,
                              Text(
                                'Aspendakidis',
                                style: AppTextStyles.textStylePoppinsSemiBold
                                    .copyWith(
                                  fontSize: 16.sp,
                                  color: AppColors.colorText2,
                                ),
                              ),
                              5.verticalSpace,
                              Text(
                                'Joined May 23, 2024',
                                style: AppTextStyles.textStylePoppinsRegular
                                    .copyWith(
                                  fontSize: 10.sp,
                                  color: AppColors.colorText3,
                                ),
                              ),
                              10.verticalSpace,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AppButton(
                                    width: 168.w,
                                    text: 'Edit Profile',
                                    onPressed: () => AutoRouter.of(context)
                                        .push(const EditProfileRoute()),
                                  ),
                                  // 8.horizontalSpace,
                                  GestureDetector(
                                    onTap: () => AutoRouter.of(context)
                                        .push(const SettingsRoute()),
                                    child: SmallProfileContainer(
                                        widget: Center(
                                      child: Image.asset(Assets.settings),
                                    )),
                                  ),
                                  // 8.horizontalSpace,
                                  SmallProfileContainer(
                                      widget: Center(
                                    child: Image.asset(Assets.share),
                                  )),
                                ],
                              ),
                              10.verticalSpace,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SmallProfileContainer(
                                    widget: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '1.2M',
                                              style: AppTextStyles
                                                  .textStylePoppinsBold
                                                  .copyWith(
                                                fontSize: 14.sp,
                                                color: AppColors.colorPrimary,
                                              ),
                                            ),
                                            Text(
                                              'Followers',
                                              style: AppTextStyles
                                                  .textStylePoppinsRegular
                                                  .copyWith(
                                                fontSize: 10.sp,
                                                color: AppColors.colorText3,
                                              ),
                                            ),
                                          ],
                                        ),
                                        5.horizontalSpace,
                                      ],
                                    ),
                                  ),
                                  SmallProfileContainer(
                                    widget: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '1.2M',
                                              style: AppTextStyles
                                                  .textStylePoppinsBold
                                                  .copyWith(
                                                fontSize: 14.sp,
                                                color: AppColors.colorPrimary,
                                              ),
                                            ),
                                            Text(
                                              'Followers',
                                              style: AppTextStyles
                                                  .textStylePoppinsRegular
                                                  .copyWith(
                                                fontSize: 10.sp,
                                                color: AppColors.colorText3,
                                              ),
                                            ),
                                          ],
                                        ),
                                        5.horizontalSpace,
                                      ],
                                    ),
                                  ),
                                  SmallProfileContainer(
                                    widget: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '1.2M',
                                              style: AppTextStyles
                                                  .textStylePoppinsBold
                                                  .copyWith(
                                                fontSize: 14.sp,
                                                color: AppColors.colorPrimary,
                                              ),
                                            ),
                                            Text(
                                              'Followers',
                                              style: AppTextStyles
                                                  .textStylePoppinsRegular
                                                  .copyWith(
                                                fontSize: 10.sp,
                                                color: AppColors.colorText3,
                                              ),
                                            ),
                                          ],
                                        ),
                                        5.horizontalSpace,
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          top: -55,
                          left: 0,
                          right: 0,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Center(
                                child: Container(
                                  width: 110.w,
                                  height: 110.h,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: AppColors.colorWhite,
                                          width: 4),
                                      boxShadow: [
                                        BoxShadow(
                                            color: AppColors.colorShadow
                                                .withOpacity(0.1),
                                            offset: const Offset(0, 2),
                                            blurRadius: 10,
                                            spreadRadius: 0)
                                      ],
                                      image: const DecorationImage(
                                        image: AssetImage(Assets.profileImage),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                              ),
                              Positioned(
                                bottom: -12,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(17),
                                      color: AppColors.colorWhite,
                                    ),
                                    child: Center(
                                      child: Text(
                                        '01',
                                        style: AppTextStyles
                                            .textStylePoppinsMedium
                                            .copyWith(
                                                fontSize: 13.sp,
                                                color: AppColors.colorText),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
