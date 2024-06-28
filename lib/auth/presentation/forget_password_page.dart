import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/auth/shared/providers.dart';
import 'package:for_the_table/core/routes/app_router.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/core/utils/common_util.dart';
import 'package:for_the_table/core/utils/toast.dart';
import 'package:for_the_table/core/utils/validator.dart';
import 'package:for_the_table/widgets/app_button.dart';
import 'package:for_the_table/widgets/custom_input_field.dart';
import 'package:for_the_table/widgets/custom_richtext.dart';

@RoutePage()
class ForgotPasswordPage extends ConsumerStatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  ConsumerState<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends ConsumerState<ForgotPasswordPage> {
  final emailFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final stateNotifier = ref.read(authNotifierProvider.notifier);
    final state = ref.read(authNotifierProvider);
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
      ),
      // backgroundColor: AppColors.colorBlack2,
      body: GestureDetector(
        onTap: () => dismissKeyboard(context),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 1.sh,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // 0.07.sh.verticalSpace,
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomRichText(
                          firstText: 'Forgot Your',
                          secondText: 'Password?',
                          firstTextStyle:
                              AppTextStyles.textStylePoppinsMedium.copyWith(
                            color: AppColors.colorPrimary,
                            fontSize: 16.sp,
                          ),
                          secondTextStyle:
                              AppTextStyles.textStylePoppinsMedium.copyWith(
                            color: AppColors.colorPrimaryAlpha,
                            fontSize: 16.sp,
                          ),
                        ),
                        10.verticalSpace,
                        Text(
                          'Enter your email address to receive reset link',
                          style: AppTextStyles.textStylePoppinsRegular.copyWith(
                            color: AppColors.colorPrimaryAlpha,
                            fontSize: 12.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        0.2.sh.verticalSpace,
                        CustomInputField(
                          controller: stateNotifier.fpEmailTextController,
                          focusNode: emailFocusNode,
                          label: 'Email Address',
                          hint: 'Enter email address',
                          keyboardType: TextInputType.emailAddress,
                          onFieldSubmitted: (p0) => dismissKeyboard(context),
                        ),
                        10.verticalSpace,
                        AppButton(
                          text: 'Submit',
                          onPressed: () async {
                            dismissKeyboard(context);
                            if (!Validator.validateEmail(
                                stateNotifier.fpEmailTextController.text)) {
                              showToastMessage('Please enter valid email');
                            } else {
                              stateNotifier.sendOTP(() {
                                FocusManager.instance.primaryFocus
                                    ?.unfocus();
                                AutoRouter.of(context).pushAndPopUntil(
                                    const VerifyOtpRoute(),
                                    predicate: (_) => false);
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
