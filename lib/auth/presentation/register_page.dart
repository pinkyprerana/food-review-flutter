import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/auth/shared/providers.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/routes/app_router.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/core/utils/common_util.dart';
import 'package:for_the_table/widgets/app_button.dart';
import 'package:for_the_table/widgets/custom_input_field.dart';
import 'package:for_the_table/widgets/custom_richtext.dart';

@RoutePage()
class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final List<String> socialIcons = [
    Assets.googleIcon,
    Assets.appleIcon,
    Assets.facebookIcon,
  ];

  final firstNameFN = FocusNode();
  final lastNameFN = FocusNode();
  final emailFN = FocusNode();
  final contactFN = FocusNode();
  final passwordFN = FocusNode();
  final confirmPasswordFN = FocusNode();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isScreenSmall = size.height < 750;
    final stateNotifier = ref.read(authNotifierProvider.notifier);
    final state = ref.read(authNotifierProvider);
    return PopScope(
      canPop: !state.isLoading,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
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
                  height: isScreenSmall ? null : 0.9.sh,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          isScreenSmall ? 10.verticalSpace : 20.verticalSpace,
                          CustomRichText(
                            firstText: 'Register',
                            secondText: 'Now',
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
                          6.verticalSpace,
                          Text(
                            'Register with us now to our platform',
                            style:
                                AppTextStyles.textStylePoppinsRegular.copyWith(
                              color: AppColors.colorPrimaryAlpha,
                              fontSize: 12.sp,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      isScreenSmall ? 20.verticalSpace : 40.verticalSpace,
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomInputField(
                                controller:
                                    stateNotifier.signupFirstNameTextController,
                                focusNode: firstNameFN,
                                label: 'First Name',
                                hint: 'Enter first name',
                                width: 0.43.sw,
                                keyboardType: TextInputType.text,
                                maxLength: 20,
                                onFieldSubmitted: (p0) => FocusScope.of(context)
                                    .requestFocus(lastNameFN),
                              ),
                              CustomInputField(
                                controller:
                                    stateNotifier.signupLastNameTextController,
                                focusNode: lastNameFN,
                                label: 'Last Name',
                                hint: 'Enter last name',
                                width: 0.43.sw,
                                keyboardType: TextInputType.text,
                                maxLength: 20,
                                onFieldSubmitted: (p0) => FocusScope.of(context)
                                    .requestFocus(emailFN),
                              ),
                            ],
                          ),
                          8.verticalSpace,
                          CustomInputField(
                            controller: stateNotifier.signupEmailTextController,
                            focusNode: emailFN,
                            label: 'Email Address',
                            hint: 'Enter email address',
                            keyboardType: TextInputType.emailAddress,
                            onFieldSubmitted: (p0) =>
                                FocusScope.of(context).requestFocus(contactFN),
                          ),
                          8.verticalSpace,
                          CustomInputField(
                            controller:
                                stateNotifier.signupContactNumberTextController,
                            focusNode: contactFN,
                            label: 'Contact Number',
                            hint: '+1  Enter contact number',
                            keyboardType: TextInputType.phone,
                            maxLength: 14,
                            onFieldSubmitted: (p0) =>
                                FocusScope.of(context).requestFocus(passwordFN),
                          ),
                          8.verticalSpace,
                          CustomInputField(
                            controller:
                                stateNotifier.signupPasswordTextController,
                            focusNode: passwordFN,
                            label: 'Password',
                            hint: 'Enter password',
                            isPassword: true,
                            keyboardType: TextInputType.text,
                            onFieldSubmitted: (p0) => FocusScope.of(context)
                                .requestFocus(confirmPasswordFN),
                          ),
                          8.verticalSpace,
                          CustomInputField(
                            controller: stateNotifier
                                .signupConfirmPasswordTextController,
                            focusNode: confirmPasswordFN,
                            isPassword: true,
                            label: 'Confirm password',
                            hint: 'Enter Confirm password',
                            keyboardType: TextInputType.text,
                            onFieldSubmitted: (p0) => dismissKeyboard(context),
                          ),
                          24.verticalSpace,
                          AppButton(
                            text: 'Register',
                            onPressed: () async {
                              dismissKeyboard(context);
                              // stateNotifier.register(
                              // onSuccess: () {
                              // stateNotifier.clearRegistrationFields();
                              AutoRouter.of(context)
                                  .push(const SelectPreferenceRoute());
                              // },
                              // );
                            },
                          ),
                        ],
                      ),
                      15.verticalSpace,
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0; i < socialIcons.length; i++) ...[
                            Container(
                              height: isScreenSmall ? 50.r : 50.r,
                              width: isScreenSmall ? 50.r : 50.r,
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
                      isScreenSmall ? 20.verticalSpace : const Spacer(),
                      22.verticalSpace,
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Already have an account?',
                            style:
                                AppTextStyles.textStylePoppinsRegular.copyWith(
                              color: AppColors.colorPrimary,
                              fontSize: 12.sp,
                            ),
                          ),
                          GestureDetector(
                            onTap: () =>
                                AutoRouter.of(context).push(const LoginRoute()),
                            child: Text(
                              'Login Now',
                              style: AppTextStyles.textStylePoppinsSemiBold
                                  .copyWith(
                                color: AppColors.colorPrimary,
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      20.verticalSpace,
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
