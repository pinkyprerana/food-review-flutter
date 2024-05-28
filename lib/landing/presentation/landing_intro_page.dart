import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/widgets/app_button.dart';

@RoutePage()
class LandingIntroPage extends StatelessWidget {
  const LandingIntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isScreenSmall = size.height < 750;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        height: 1.sh,
        width: 1.sw,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: isScreenSmall ? 0.65.sh : 0.55.sh,
              child: Image.asset(
                Assets.landingintro,
                scale: 2,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: isScreenSmall ? 0.35.sh : 0.45.sh,
              padding: const EdgeInsets.only(left: 11, right: 11, bottom: 20),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 17),
                        decoration: BoxDecoration(
                            color: AppColors.colorPrimary,
                            borderRadius: BorderRadius.circular(13)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Rate Your Experiences',
                              style: AppTextStyles.textStylePoppinsSemiBold
                                  .copyWith(
                                      fontSize: 13.sp,
                                      color: AppColors.colorWhite),
                            ),
                            9.horizontalSpace,
                            Image.asset(Assets.curryIcon)
                          ],
                        ),
                      ),
                      isScreenSmall ? 10.verticalSpace : 20.verticalSpace,
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            height: 1.1,
                            fontSize: isScreenSmall ? 26.sp : 38.sp,
                          ),
                          children: [
                            TextSpan(
                              text: 'Rate your Food Experiences ',
                              style: AppTextStyles.textStylePoppinsSemiBold
                                  .copyWith(
                                color: AppColors.colorPrimary,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const TextSpan(
                              text: " ",
                            ),
                            TextSpan(
                              text: 'And Share With Others To Explore.',
                              style: AppTextStyles.textStylePoppinsSemiBold
                                  .copyWith(
                                color: AppColors.colorPrimaryAlpha,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  const AppButton(
                    text: 'Get Stared',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
