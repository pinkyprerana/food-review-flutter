import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/routes/app_router.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/core/utils/common_util.dart';
import 'package:for_the_table/core/utils/toast.dart';
import 'package:for_the_table/widgets/app_button.dart';
import 'package:for_the_table/widgets/custom_richtext.dart';
import 'package:pinput/pinput.dart';
import '../shared/providers.dart';


@RoutePage()
class VerifyOtpPage extends ConsumerStatefulWidget {
  const VerifyOtpPage({super.key});

  @override
  ConsumerState<VerifyOtpPage> createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends ConsumerState<VerifyOtpPage> {
  final emailFocusNode = FocusNode();
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final authNotifier = ref.watch(authNotifierProvider.notifier);
      authNotifier.resetTimer();
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final stateNotifier = ref.read(authNotifierProvider.notifier);
    final state = ref.watch(authNotifierProvider);

    final defaultPinTheme = PinTheme(
      width: 60.r,
      height: 60.r,
      textStyle: TextStyle(
        fontSize: 22.sp,
        color: AppColors.colorBlack,
      ),
      decoration: BoxDecoration(
        color: AppColors.colorGrey,
        borderRadius: BorderRadius.circular(8),
      ),
    );

    return Scaffold(
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
                5.horizontalSpace,
                Icon(Icons.arrow_back_ios,
                    color: AppColors.colorPrimary, size: 15.h),
              ],
            ),
          ),
        ),
      ),
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
                          'Enter OTP sent to your registered email address',
                          style: AppTextStyles.textStylePoppinsRegular.copyWith(
                            color: AppColors.colorPrimaryAlpha,
                            fontSize: 12.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        0.2.sh.verticalSpace,
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: Pinput(
                            preFilledWidget: Center(
                              child: Text(
                                '_',
                                style:
                                    AppTextStyles.textStyleLatoLight.copyWith(
                                  color: AppColors.colorPrimaryAlpha
                                      .withOpacity(0.70),
                                  fontSize: 10.sp,
                                ),
                              ),
                            ),
                            controller: stateNotifier.fpOtpTextController,
                            focusNode: focusNode,
                            defaultPinTheme: defaultPinTheme,
                            separatorBuilder: (index) => SizedBox(width: 18.w),
                            hapticFeedbackType: HapticFeedbackType.lightImpact,
                            onCompleted: (pin) {
                              debugPrint('onCompleted: $pin');
                            },
                            onChanged: (value) {
                              debugPrint('onChanged: $value');
                            },
                            errorPinTheme: defaultPinTheme.copyBorderWith(
                              border: Border.all(color: Colors.redAccent),
                            ),
                          ),
                        ),
                        20.verticalSpace,
                        AppButton(
                          loading: state.isLoading,
                          text: 'Submit',
                          onPressed: () {
                            dismissKeyboard(context);
                            if (stateNotifier.fpOtpTextController.text.isEmpty) {
                              showToastMessage('Please enter valid OTP');
                            } else {
                              stateNotifier.verifyOTP(() {
                                FocusManager.instance.primaryFocus
                                    ?.unfocus();
                                AutoRouter.of(context).pushAndPopUntil(const ResetPasswordRoute(), predicate: (_) => false);
                              });
                            }
                            stateNotifier.fpOtpTextController.clear();
                          },
                        ),
                        10.verticalSpace,
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            state.canResendOtp
                                ? GestureDetector(
                                    onTap: () async {
                                      ref.read(authNotifierProvider.notifier).resetTimer();
                                      FocusManager.instance.primaryFocus?.unfocus();
                                      stateNotifier.resendOTP(() {});
                                    },
                                    child: Text(
                                      'Resend OTP',
                                      style: AppTextStyles
                                          .textStylePoppinsSemiBold
                                          .copyWith(
                                        color: AppColors.colorPrimary,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  )
                                : Text(
                                    'Resend OTP in ${state.remainingTime} seconds',
                                    style: AppTextStyles.textStylePoppinsRegular
                                        .copyWith(
                                      color: AppColors.colorPrimaryAlpha,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                          ],
                        )
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
