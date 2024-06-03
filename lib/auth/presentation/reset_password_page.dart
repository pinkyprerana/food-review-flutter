import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/auth/shared/providers.dart';
import 'package:for_the_table/core/routes/app_router.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/core/utils/common_util.dart';
import 'package:for_the_table/widgets/app_button.dart';
import 'package:for_the_table/widgets/custom_input_field.dart';
import 'package:for_the_table/widgets/custom_richtext.dart';

@RoutePage()
class ResetPasswordPage extends ConsumerStatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  ConsumerState<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends ConsumerState<ResetPasswordPage> {
  final fgPasswordFN = FocusNode();
  final fgConfirmPasswordFN = FocusNode();

  @override
  Widget build(BuildContext context) {
    final stateNotifier = ref.read(authNotifierProvider.notifier);
    final state = ref.read(authNotifierProvider);
    return Scaffold(
      backgroundColor: AppColors.colorBlack2,
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
                    0.07.sh.verticalSpace,
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomRichText(
                          firstText: 'Reset Your',
                          secondText: 'Password',
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
                          'Reset your old password',
                          style: AppTextStyles.textStylePoppinsRegular.copyWith(
                            color: AppColors.colorPrimaryAlpha,
                            fontSize: 12.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        0.2.sh.verticalSpace,
                        CustomInputField(
                          controller: stateNotifier.fpPasswordTextController,
                          focusNode: fgPasswordFN,
                          label: 'New Password',
                          hint: 'Enter new password',
                          isPassword: true,
                          keyboardType: TextInputType.text,
                          onFieldSubmitted: (p0) => FocusScope.of(context)
                              .requestFocus(fgConfirmPasswordFN),
                        ),
                        10.verticalSpace,
                        CustomInputField(
                          controller:
                              stateNotifier.fpConfirmPasswordTextController,
                          focusNode: fgConfirmPasswordFN,
                          label: 'Confirm New Password',
                          hint: 'Enter confirmed password',
                          isPassword: true,
                          keyboardType: TextInputType.text,
                          onFieldSubmitted: (p0) => dismissKeyboard(context),
                        ),
                        10.verticalSpace,
                        AppButton(
                          text: 'Submit',
                          onPressed: () {
                            dismissKeyboard(context);
                            stateNotifier.resetPassword(
                              onSuccess: () {
                                AutoRouter.of(context).pushAndPopUntil(
                                    const LoginRoute(),
                                    predicate: (_) => false);
                              },
                            );
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
