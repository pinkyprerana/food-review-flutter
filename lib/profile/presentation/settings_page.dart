import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/profile/presentation/widgets/settings_option_widget.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  final List settingOptions = const [
    {
      'icon': Assets.oct,
      'title': 'Manage Account',
    },
    {
      'icon': Assets.noti,
      'title': 'Notifications',
    },
    {
      'icon': Assets.shield,
      'title': 'Privacy Policy',
    },
    {
      'icon': Assets.frame,
      'title': 'App Info',
    },
    {
      'icon': Assets.text,
      'title': 'Help',
    },
    {
      'icon': Assets.close,
      'title': 'Deactivate My Account',
    },
    {
      'icon': Assets.delete,
      'title': 'Delete My Account',
    },
  ];
  // final List belowSettingsOptions = const [
  //   {
  //     'icon': Assets.close,
  //     'title': 'Deactivate My Account',
  //   },
  //   {
  //     'icon': Assets.delete,
  //     'title': 'Delete My Account',
  //   },
  // ];

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
          'Settings',
          style: AppTextStyles.textStylePoppinsBold.copyWith(
            color: AppColors.colorPrimary,
            fontSize: 16.sp,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 1).r,
          child: Column(
            children: [
              ListView.builder(
                  padding: const EdgeInsets.all(0.0),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: settingOptions.length - 2,
                  itemBuilder: (context, index) {
                    return SettingsOptionWidget(
                        title: settingOptions[index]['title'],
                        imgpath: settingOptions[index]['icon']);
                  }),
              // 100.verticalSpace,
              // SettingsOptionWidget(
              //     title: settingOptions[5]['title'],
              //     imgpath: settingOptions[5]['icon']),
              // SettingsOptionWidget(
              //     title: settingOptions[6]['title'],
              //     imgpath: settingOptions[6]['icon']),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 35).r,
        color: AppColors.colorWhite,
        child: Wrap(
          children: [
            SettingsOptionWidget(
                title: settingOptions[5]['title'],
                imgpath: settingOptions[5]['icon']),
            SettingsOptionWidget(
                title: settingOptions[6]['title'],
                imgpath: settingOptions[6]['icon']),
            10.verticalSpace,
          ],
        ),
      ),
    );
  }
}
