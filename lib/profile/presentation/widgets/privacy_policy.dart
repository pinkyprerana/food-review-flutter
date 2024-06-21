import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/assets.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_text_styles.dart';

@RoutePage()
class PrivacyPolicyPage extends ConsumerStatefulWidget {
  const PrivacyPolicyPage({super.key});

  @override
  ConsumerState<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends ConsumerState<PrivacyPolicyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: false,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Image.asset(
                      Assets.backArrowButton,
                      scale: 1.5,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  5.horizontalSpace,
                  Text(
                    'Privacy',
                    style: AppTextStyles.textStylePoppinsSemiBold.copyWith(
                      fontSize: 15.sp,
                      color: AppColors.colorBlack,
                    ),
                  ),
                ],
              ),
              20.verticalSpace,
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Policy Details",
                        style: AppTextStyles.textStylePoppinsMedium.copyWith(
                          color: AppColors.colorBlack,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    10.verticalSpace,
                    Text(
                      "Lorem ipsum dolor sit amet consectetur. Et risus habitasse viverra duis sed arcu eget commodo. Et vitae leo sollicitudin id libero accumsan nullam. Pulvinar sit nunc viverra aliquam tincidunt feugiat. Tempus a tellus amet pulvinar feugiat vitae orci elit. Libero nisi mi egestas at arcu nec amet varius pharetra. Scelerisque pellentesque etiam sed tempus bibendum. Massa elementum proin tincidunt laoreet aliquet sed interdum sed. Sagittis cum ac volutpat curabitur lacus nibh eget augue. Imperdiet luctus commodo mauris amet aliquet malesuada. Rhoncus bibendum adipiscing laoreet diam ac suspendisse et vitae lorem. Sed mauris nulla nunc at cursus.\n\nEt dui tincidunt sollicitudin a non pulvinar. Auctor et metus auctor odio convallis metus vitae. Id imperdiet tincidunt tortor quisque.",
                      style: AppTextStyles.textStylePoppinsRegular.copyWith(
                        color: AppColors.colorPrimaryAlpha,
                        fontSize: 12.sp,
                      ),
                    ),
                    50.verticalSpace,
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Terms And Consditions",
                        style: AppTextStyles.textStylePoppinsMedium.copyWith(
                          color: AppColors.colorBlack,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    10.verticalSpace,
                    Text(
                      "Lorem ipsum dolor sit amet consectetur. Et risus habitasse viverra duis sed arcu eget commodo. Et vitae leo sollicitudin id libero accumsan nullam. Pulvinar sit nunc viverra aliquam tincidunt feugiat. Tempus a tellus amet pulvinar feugiat vitae orci elit. Libero nisi mi egestas at arcu nec amet varius pharetra. Scelerisque pellentesque etiam sed tempus bibendum. Massa elementum proin tincidunt laoreet aliquet sed interdum sed. Sagittis cum ac volutpat curabitur lacus nibh eget augue. Imperdiet luctus commodo mauris amet aliquet malesuada. Rhoncus bibendum adipiscing laoreet diam ac suspendisse et vitae lorem. Sed mauris nulla nunc at cursus.\n\nEt dui tincidunt sollicitudin a non pulvinar. Auctor et metus auctor odio convallis metus vitae. Id imperdiet tincidunt tortor quisque.",
                      style: AppTextStyles.textStylePoppinsRegular.copyWith(
                        color: AppColors.colorPrimaryAlpha,
                        fontSize: 12.sp,
                      ),
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
