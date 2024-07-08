import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/auth/shared/providers.dart';
import 'package:for_the_table/core/routes/app_router.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/core/utils/app_log.dart';
import 'package:for_the_table/core/utils/common_util.dart';
import 'package:for_the_table/widgets/app_button.dart';
import 'package:for_the_table/widgets/custom_input_field.dart';
import 'package:for_the_table/widgets/custom_richtext.dart';

@RoutePage()
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final passwordNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final stateNotifier = ref.read(authNotifierProvider.notifier);
    final state = ref.read(authNotifierProvider);
    return PopScope(
      canPop: !state.isLoading,
      child: Scaffold(
        backgroundColor: AppColors.colorBlack2,
        body: GestureDetector(
          onTap: () => dismissKeyboard(context),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 0.22.sh,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0).r,
                    child: Center(
                      child: Text('FOR THE TABLE',
                          style:
                              AppTextStyles.textStylePoppinsSemiBold.copyWith(
                            color: AppColors.colorWhite,
                            fontSize: 24.sp,
                          )),
                    ),
                  ),
                ),
                Container(
                  height: 0.78.sh,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomRichText(
                            firstText: 'Login With',
                            secondText: 'Email',
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
                          8.verticalSpace,
                          Text(
                            'Enter your email to login to the platform',
                            style:
                                AppTextStyles.textStylePoppinsRegular.copyWith(
                              color: AppColors.colorPrimaryAlpha,
                              fontSize: 12.sp,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomInputField(
                            label: 'Email',
                            hint: 'Please Enter Email',
                            controller: stateNotifier.loginEmailTextController,
                            keyboardType: TextInputType.emailAddress,
                            onFieldSubmitted: (val) {
                              FocusScope.of(context).requestFocus(passwordNode);
                            },
                          ),
                          8.verticalSpace,
                          CustomInputField(
                            focusNode: passwordNode,
                            controller:
                                stateNotifier.loginPasswordTextController,
                            label: 'Password',
                            hint: 'Please Enter Password',
                            isPassword: true,
                            keyboardType: TextInputType.text,
                            onFieldSubmitted: (val) => dismissKeyboard(context),
                          ),
                          10.verticalSpace,
                          GestureDetector(
                            onTap: () => AutoRouter.of(context)
                                .push(const ForgotPasswordRoute()),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'Forgot Your Password?',
                                style: AppTextStyles.textStylePoppinsRegular
                                    .copyWith(
                                  color: AppColors.colorPrimary,
                                  fontSize: 13.sp,
                                ),
                              ),
                            ),
                          ),
                          10.verticalSpace,
                          AppButton(
                            loading: state.isLoading,
                            text: 'Login',
                            onPressed: () async {
                              AppLog.log('message');

                              await stateNotifier.signIn(() {
                                FocusManager.instance.primaryFocus?.unfocus();
                                AutoRouter.of(context).pushAndPopUntil(
                                    const BaseRoute(),
                                    predicate: (_) => false);
                              });

                              dismissKeyboard(context);
                            },
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Do not have an account?',
                            style:
                                AppTextStyles.textStylePoppinsRegular.copyWith(
                              color: AppColors.colorPrimary,
                              fontSize: 12.sp,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => AutoRouter.of(context)
                                .push(const RegisterRoute()),
                            child: Text(
                              'Register With Us',
                              style: AppTextStyles.textStylePoppinsSemiBold
                                  .copyWith(
                                color: AppColors.colorPrimary,
                                fontSize: 12.sp,
                              ),
                            ),
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
      ),
    );
  }
}
