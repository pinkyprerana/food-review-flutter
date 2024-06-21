import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/routes/app_router.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/profile/presentation/widgets/other_options_widget.dart';
import 'package:for_the_table/profile/presentation/widgets/recent_activity_widget.dart';
import 'package:for_the_table/profile/presentation/widgets/small_profile_container.dart';
import 'package:for_the_table/widgets/app_button.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List otherOptions = [
    {'icon': Assets.dislike, 'title': 'Disliked Posts'},
    {'icon': Assets.like, 'title': 'Liked Posts'},
    {'icon': Assets.msg, 'title': 'FAQs'},
    {'icon': Assets.logout, 'title': 'Logout'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        leadingWidth: 0,
        title: Text(
          'Profile',
          style: AppTextStyles.textStylePoppinsBold.copyWith(
            color: AppColors.colorPrimary,
            fontSize: 16.sp,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () => AutoRouter.of(context).push(const NotificationRoute()),
            child: Container(
              height: 26.r,
              width: 26.r,
              margin: const EdgeInsets.only(right: 16).r,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.colorGrey2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                  child: Image.asset(
                Assets.bell,
                color: AppColors.colorPrimary,
              )),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Container(
          //color: AppColors.colorWhite,
          margin: const EdgeInsets.only(top: 20).r,
          padding: const EdgeInsets.symmetric(horizontal: 16).r,
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    90.verticalSpace,
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
                                  GestureDetector(
                                    onTap: () => AutoRouter.of(context)
                                        .push(const YourPeopleRoute()),
                                    child: SmallProfileContainer(
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
                                              'Following',
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
              ),
              18.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent Activity',
                    style: AppTextStyles.textStylePoppinsMedium.copyWith(
                      fontSize: 13.sp,
                      color: AppColors.colorPrimary,
                    ),
                  ),
                  Text(
                    'View All',
                    style: AppTextStyles.textStylePoppinsRegular.copyWith(
                      fontSize: 10.sp,
                      color: AppColors.colorPrimaryAlpha,
                    ),
                  ),
                ],
              ),
              10.verticalSpace,
              ListView.builder(
                padding: const EdgeInsets.all(0.0),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return const RecentActivityWidget(
                      imgpath: Assets.sample,
                      subtitle: 'Today, 01:35PM',
                      title: 'You comment John’s post');
                },
                itemCount: 3,
              ),
              18.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Other Options',
                    style: AppTextStyles.textStylePoppinsMedium.copyWith(
                      fontSize: 13.sp,
                      color: AppColors.colorPrimary,
                    ),
                  ),
                ],
              ),
              10.verticalSpace,
              ListView.builder(
                padding: const EdgeInsets.all(0.0),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return OtherOptionsWidget(
                    imgpath: otherOptions[index]['icon'],
                    title: otherOptions[index]['title'],
                  );
                },
                itemCount: otherOptions.length,
              ),
              100.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
