import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/routes/app_router.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/widgets/app_button.dart';

class LandingIntroDescription extends StatelessWidget {
  const LandingIntroDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isScreenSmall = size.height < 750;
    return Container(
      height: 0.5.sh,
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20).r,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IntroRatingDescription(isScreenSmall: isScreenSmall),
          const Spacer(),
          AppButton(
            text: 'Get Stared',
            onPressed: () =>
                AutoRouter.of(context).push(const LandingGetStartedRoute()),
          ),
        ],
      ),
    );
  }
}

class IntroRatingDescription extends StatelessWidget {
  const IntroRatingDescription({
    super.key,
    required this.isScreenSmall,
  });

  final bool isScreenSmall;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
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
              Image.asset(Assets.curryIcon)
            ],
          ),
        ),
        20.verticalSpace,
        RichText(
          text: TextSpan(
            style: TextStyle(
              height: 1,
              fontSize: 34.sp,
            ),
            children: [
              TextSpan(
                text: 'Rate your Food \nExperiences',
                style: AppTextStyles.textStylePoppinsSemiBold.copyWith(
                  color: AppColors.colorPrimary,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const TextSpan(
                text: " ",
              ),
              TextSpan(
                text: 'And \nShare With \nOthers To Explore.',
                style: AppTextStyles.textStylePoppinsSemiBold.copyWith(
                  color: AppColors.colorPrimaryAlpha,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}
