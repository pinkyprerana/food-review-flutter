import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/routes/app_router.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/widgets/app_button.dart';

class LandingGetStartedDescription extends StatelessWidget {
  LandingGetStartedDescription({
    super.key,
  });

  final List<String> socialIcons = [
    Assets.googleIcon,
    Assets.appleIcon,
    Assets.facebookIcon,
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isScreenSmall = size.height < 750;
    return Container(
      height: isScreenSmall ? 0.58.sh : 0.65.sh,
      padding:
          EdgeInsets.only(left: 10, right: 10, bottom: isScreenSmall ? 20 : 40)
              .r,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LoginDescription(isScreenSmall: isScreenSmall),
              isScreenSmall ? 16.verticalSpace : 44.verticalSpace,
              AppButton(
                text: 'Login With Email',
                onPressed: () =>
                    AutoRouter.of(context).push(const LoginRoute()),
              ),
            ],
          ),
          Text(
            'Register With Us',
            style: AppTextStyles.textStylePoppinsSemiBold.copyWith(
              fontSize: 13,
              color: AppColors.colorPrimary,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < socialIcons.length; i++) ...[
                    Container(
                      height: isScreenSmall ? 50.r : 60.r,
                      width: isScreenSmall ? 50.r : 60.r,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: AppColors.colorPrimaryAlpha,
                          borderRadius: BorderRadius.circular(13)),
                      child: Image.asset(socialIcons[i]),
                    ),
                    if (i != socialIcons.length - 1) 16.horizontalSpace
                  ],
                ],
              ),
              isScreenSmall ? 16.verticalSpace : 32.verticalSpace,
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    height: 1,
                    fontSize: 12.sp,
                  ),
                  children: [
                    TextSpan(
                      text: 'By continuing you agree to For The Table',
                      style: AppTextStyles.textStylePoppinsRegular.copyWith(
                        color: AppColors.colorPrimaryAlpha,
                      ),
                    ),
                    const TextSpan(
                      text: " \n",
                    ),
                    TextSpan(
                      text: 'Terms of Services & Privacy Policy',
                      style: AppTextStyles.textStylePoppinsSemiBold.copyWith(
                        color: AppColors.colorPrimaryAlpha,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class LoginDescription extends StatelessWidget {
  const LoginDescription({
    super.key,
    required this.isScreenSmall,
  });

  final bool isScreenSmall;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0).r,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16).r,
            decoration: BoxDecoration(
                color: AppColors.colorPrimary,
                borderRadius: BorderRadius.circular(13)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Rate Your Experiences',
                  style: AppTextStyles.textStylePoppinsSemiBold
                      .copyWith(fontSize: 13.sp, color: AppColors.colorWhite),
                ),
                9.horizontalSpace,
                Image.asset(Assets.thumbsUp)
              ],
            ),
          ),
          isScreenSmall ? 10.verticalSpace : 20.verticalSpace,
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(
                height: 1,
                fontSize: 34.sp,
              ),
              children: [
                TextSpan(
                  text: 'Welcome to \nAPP.',
                  style: AppTextStyles.textStylePoppinsSemiBold.copyWith(
                    color: AppColors.colorPrimary,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const TextSpan(
                  text: " ",
                ),
                TextSpan(
                  text: 'Enjoy Our Experience',
                  style: AppTextStyles.textStylePoppinsSemiBold.copyWith(
                    color: AppColors.colorPrimaryAlpha,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
