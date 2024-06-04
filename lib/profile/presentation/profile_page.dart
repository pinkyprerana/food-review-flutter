import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/widgets/custom_search_field.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
            // onTap: () => AutoRouter.of(context).push(const NotificationRoute()),
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
          color: AppColors.colorWhite,
          margin: const EdgeInsets.only(top: 20).r,
          padding: const EdgeInsets.symmetric(horizontal: 16).r,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSearchField(
                height: 50.r,
                bgColor: AppColors.colorBackground,
                isBorder: true,
              ),
              16.verticalSpace,
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Standing List',
                            style:
                                AppTextStyles.textStylePoppinsMedium.copyWith(
                              color: AppColors.colorPrimary,
                              fontSize: 13.sp,
                            ),
                          ),
                          Text(
                            '10 Users',
                            style:
                                AppTextStyles.textStylePoppinsRegular.copyWith(
                              color: AppColors.colorPrimaryAlpha,
                              fontSize: 10.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  16.verticalSpace,
                  Container(
                    color: Colors.white,
                    height: 0.72.sh,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
