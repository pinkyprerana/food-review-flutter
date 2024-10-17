import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/screens/profile/shared/providers.dart';
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
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_)async{
      final profileNotifier = ref.read(profileNotifierProvider.notifier);
      await profileNotifier.getPrivacyPolicy();
      await profileNotifier.getTermsAndConditions();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(profileNotifierProvider);

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
                if (profileState.isLoading) ...[
                  const Center(child: CircularProgressIndicator(color: AppColors.colorPrimary)),
                ] else if (profileState.privacyPolicy.isEmpty) ...[
                  Align(
                    alignment: Alignment.topLeft,
                     child: Text(
                      "Privacy Policy will appear here",
                       style: AppTextStyles.textStylePoppinsRegular.copyWith(
                         color: AppColors.colorPrimaryAlpha,
                         fontSize: 12.sp,
                       ),
                        ),
                   ),
                ] else ...[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      profileState.privacyPolicy,
                      style: AppTextStyles.textStylePoppinsRegular.copyWith(
                        color: AppColors.colorPrimaryAlpha,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ],
                50.verticalSpace,
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Terms And Conditions",
                    style: AppTextStyles.textStylePoppinsMedium.copyWith(
                      color: AppColors.colorBlack,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                10.verticalSpace,
                if (profileState.isLoading) ...[
                  const Center(child: CircularProgressIndicator(color: AppColors.colorPrimary)),
                ] else if (profileState.termsAndConditions.isEmpty) ...[
                   Align(
                     alignment: Alignment.topLeft,
                     child: Text(
                      "Terms and Conditions will appear here",
                      style: AppTextStyles.textStylePoppinsRegular.copyWith(
                        color: AppColors.colorPrimaryAlpha,
                        fontSize: 12.sp,
                      ),
                     ),
                   ),
                ] else ...[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      profileState.termsAndConditions,
                      style: AppTextStyles.textStylePoppinsRegular.copyWith(
                        color: AppColors.colorPrimaryAlpha,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
