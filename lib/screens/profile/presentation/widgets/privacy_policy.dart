import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/app_text_styles.dart';

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
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
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
          'Privacy',
          style: AppTextStyles.textStylePoppinsBold.copyWith(
            color: AppColors.colorPrimary,
            fontSize: 16.sp,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Padding(
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
          ),
        ),
      ),
    );
  }
}
