import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/routes/app_router.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/core/utils/modal_bottom_sheet.dart';
import 'package:for_the_table/screens/profile/application/profile_notifier.dart';
import 'package:for_the_table/screens/profile/application/profile_state.dart';
import 'package:for_the_table/widgets/app_button.dart';
import 'package:for_the_table/widgets/custom_input_field.dart';
import '../../shared/providers.dart';

class EditOptionWidget extends ConsumerWidget {
  final String title;
  final String imgpath;
  final String subtitle;

  const EditOptionWidget({
    super.key,
    required this.title,
    required this.imgpath,
    this.subtitle = '',
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateNotifier = ref.watch(profileNotifierProvider.notifier);
    final state = ref.watch(profileNotifierProvider);

    return GestureDetector(
      onTap: () {
        if (title == 'Email' || title == 'Change Password' || title == 'Phone Number') {
          getModal(title, context, stateNotifier, state);
        } else if (title == 'Add Bio') {
          AutoRouter.of(context).push(const AddBioRoute());
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0).r,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 1, color: AppColors.colorGrey),
          ),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10).r,
                padding: const EdgeInsets.all(10).r,
                decoration: BoxDecoration(
                  color: AppColors.colorGrey,
                  border: Border.all(color: AppColors.colorGrey, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image(
                  image: AssetImage(imgpath),
                  color: AppColors.colorPrimary,
                ),
              ),
              10.horizontalSpace,
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    (subtitle != '')
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: AppTextStyles.textStylePoppinsMedium.copyWith(
                                  fontSize: 13.sp,
                                  color: AppColors.colorPrimary,
                                ),
                              ),
                              2.verticalSpace,
                              Text(
                                subtitle,
                                style: AppTextStyles.textStylePoppinsRegular.copyWith(
                                  fontSize: 10.sp,
                                  color: AppColors.colorPrimaryAlpha,
                                ),
                              )
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: AppTextStyles.textStylePoppinsMedium.copyWith(
                                  fontSize: 13.sp,
                                  color: AppColors.colorPrimary,
                                ),
                              ),
                              2.verticalSpace,
                            ],
                          ),
                    Container(
                      alignment: Alignment.center,
                      width: 56.w,
                      height: 52.h,
                      decoration: const BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            color: AppColors.colorGrey,
                            width: 1,
                          ),
                        ),
                      ),
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.colorArrowIcon,
                        size: 15.6,
                        weight: 500,
                      ),
                      // color: Colors.blue,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      // child: ListTile(
      //     shape: RoundedRectangleBorder(
      //       side: const BorderSide(color: AppColors.colorGrey, width: 1),
      //       borderRadius: BorderRadius.circular(15),
      //     ),
      //     leading: Container(
      //       padding: const EdgeInsets.all(10).r,
      //       decoration: BoxDecoration(
      //         color: AppColors.colorGrey,
      //         border: Border.all(color: AppColors.colorGrey, width: 1),
      //         borderRadius: BorderRadius.circular(10),
      //       ),
      //       child: Image(
      //         image: AssetImage(imgpath),
      //         color: AppColors.colorPrimary,
      //       ),
      //     ),
      //     title: Text(
      //       title,
      //       style: AppTextStyles.textStylePoppinsMedium.copyWith(
      //         fontSize: 13.sp,
      //         color: AppColors.colorPrimary,
      //       ),
      //     ),
      //     subtitle: (subtitle != '')
      //         ? Text(
      //             subtitle,
      //             style: AppTextStyles.textStylePoppinsRegular.copyWith(
      //               fontSize: 10.sp,
      //               color: AppColors.colorPrimaryAlpha,
      //             ),
      //           )
      //         : null,
      //     trailing: Row(
      //       mainAxisSize: MainAxisSize.min,
      //       children: [
      //         const VerticalDivider(
      //           color: AppColors.colorGrey,
      //           thickness: 1,
      //         ),
      //         5.horizontalSpace,
      //         const Icon(
      //           Icons.arrow_forward_ios,
      //           color: AppColors.colorArrowIcon,
      //           size: 15.6,
      //           weight: 500,
      //         )
      //       ],
      //     )),
    );
  }
}

void getModal(
    String title, BuildContext context, ProfileNotifier stateNotifier, ProfileState state) {
  switch (title) {
    case 'Email':
      {
        commonModal(context, onTap: () {
          stateNotifier.emailAddress.text = '';
          Navigator.pop(context);
        },
            child: Column(
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Change',
                    style: AppTextStyles.textStylePoppinsMedium
                        .copyWith(fontSize: 16.sp, color: AppColors.colorPrimary),
                    children: [
                      TextSpan(
                        text: ' Email Address',
                        style: AppTextStyles.textStylePoppinsMedium.copyWith(
                          fontSize: 16.sp,
                          color: AppColors.colorPrimaryAlpha,
                        ),
                      )
                    ],
                  ),
                ),
                3.verticalSpace,
                Text(
                  'Change your email address below.',
                  style: AppTextStyles.textStylePoppinsRegular
                      .copyWith(fontSize: 13.sp, color: AppColors.colorPrimaryAlpha),
                ),
                20.verticalSpace,
                CustomInputField(
                  controller: stateNotifier.emailAddress,
                  label: 'Email Address',
                  hint: 'Enter email address',
                ),
                10.verticalSpace,
                AppButton(
                  loading: state.isBeingSubmitted,
                  disable: state.isBeingSubmitted,
                  text: 'Submit',
                  onPressed: () async {
                    await stateNotifier.changeEmailAddress(context);
                  },
                )
              ],
            ));
      }
      break;
    case 'Change Password':
      {
        commonModal(context, onTap: () {
          Navigator.pop(context);
        },
            child: Stack(
              children: [
                Column(
                  children: [
                    RichText(
                        text: TextSpan(
                      text: 'Change',
                      style: AppTextStyles.textStylePoppinsMedium
                          .copyWith(fontSize: 16.sp, color: AppColors.colorPrimary),
                      children: [
                        TextSpan(
                          text: ' Password',
                          style: AppTextStyles.textStylePoppinsMedium.copyWith(
                            fontSize: 16.sp,
                            color: AppColors.colorPrimaryAlpha,
                          ),
                        )
                      ],
                    )),
                    3.verticalSpace,
                    Text(
                      'Change your password below.',
                      style: AppTextStyles.textStylePoppinsRegular
                          .copyWith(fontSize: 13.sp, color: AppColors.colorPrimaryAlpha),
                    ),
                    25.verticalSpace,
                    CustomInputField(
                      label: 'Old Password',
                      hint: 'Enter old password',
                      isPassword: true,
                      controller: stateNotifier.oldPasswordController,
                    ),
                    10.verticalSpace,
                    CustomInputField(
                      label: 'New Password',
                      hint: 'Enter new password',
                      isPassword: true,
                      controller: stateNotifier.newPasswordController,
                    ),
                    10.verticalSpace,
                    CustomInputField(
                      label: 'Confirm New Password',
                      hint: 'Confirm new password',
                      isPassword: true,
                      controller: stateNotifier.confirmPasswordController,
                    ),
                    10.verticalSpace,
                    AppButton(
                      text: 'Reset Password',
                      onPressed: () async {
                        await stateNotifier.updatePassword(context);
                      },
                    )
                  ],
                ),
              ],
            ));
      }
      break;
    case 'Phone Number':
      {
        commonModal(context, onTap: () {
          stateNotifier.phoneNumber.text = '';
          Navigator.pop(context);
        },
            child: Stack(
              children: [
                Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Change',
                        style: AppTextStyles.textStylePoppinsMedium
                            .copyWith(fontSize: 16.sp, color: AppColors.colorPrimary),
                        children: [
                          TextSpan(
                            text: 'Phone Number',
                            style: AppTextStyles.textStylePoppinsMedium.copyWith(
                              fontSize: 16.sp,
                              color: AppColors.colorPrimaryAlpha,
                            ),
                          )
                        ],
                      ),
                    ),
                    3.verticalSpace,
                    Text(
                      'Change your phone number below.',
                      style: AppTextStyles.textStylePoppinsRegular
                          .copyWith(fontSize: 13.sp, color: AppColors.colorPrimaryAlpha),
                    ),
                    20.verticalSpace,
                    CustomInputField(
                      controller: stateNotifier.phoneNumber,
                      label: 'Phone Number',
                      hint: 'Phone Number',
                      isPassword: false,
                      maxLength: 15,
                    ),
                    10.verticalSpace,
                    AppButton(
                      loading: state.isLoading,
                      text: 'Save',
                      onPressed: () {
                        stateNotifier.changePhoneNumber(context);
                        // Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ],
            ));
      }
    default:
      {
        null;
      }
      break;
  }
}
