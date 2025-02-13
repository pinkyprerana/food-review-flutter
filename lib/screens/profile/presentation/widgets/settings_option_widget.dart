import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/routes/app_router.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/core/utils/modal_bottom_sheet.dart';
import 'package:for_the_table/screens/profile/application/profile_notifier.dart';
import 'package:for_the_table/screens/profile/shared/providers.dart';
import 'package:for_the_table/widgets/app_button.dart';
import 'package:for_the_table/widgets/app_outline_button.dart';

class SettingsOptionWidget extends ConsumerWidget {
  const SettingsOptionWidget({
    super.key,
    required this.title,
    required this.imgpath,
  });
  final String title;
  final String imgpath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileNotifier = ref.watch(profileNotifierProvider.notifier);
    return GestureDetector(
      onTap: () {
        if (title == 'Help') {
          AutoRouter.of(context).push(const HelpRoute());
        } else if (title == 'Notifications') {
          AutoRouter.of(context).push( const NotificationRoute());
        } else if (title == 'Deactivate My Account') {
          getModal(title, context, profileNotifier: profileNotifier);
        } else if (title == 'Manage Account') {
          AutoRouter.of(context).push(const EditProfileRoute());
        } else if (title == 'App Info') {
          AutoRouter.of(context).push(const AppInfoRoute());
        } else if (title == 'Privacy Policy') {
          AutoRouter.of(context).push(const PrivacyPolicyRoute());
        } else {
          getModal('Delete My Account', context, profileNotifier: profileNotifier);
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0).r,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 1, color: AppColors.colorGrey)),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: AppTextStyles.textStylePoppinsMedium.copyWith(
                            fontSize: 13.sp,
                            color: AppColors.colorPrimary,
                          ),
                        ),
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
      ),
    );
  }

  void getModal(String title, BuildContext context, {ProfileNotifier? profileNotifier}) {
    switch (title) {
      case 'Deactivate My Account':
        {
          commonModal(
            context,
            onTap: () {
              Navigator.pop(context);
            },
            child: Stack(
              children: [
                Column(
                  children: [
                    RichText(
                        text: TextSpan(
                      text: 'Deactivate',
                      style: AppTextStyles.textStylePoppinsMedium
                          .copyWith(fontSize: 16.sp, color: AppColors.colorPrimary),
                      children: [
                        TextSpan(
                          text: '',
                          style: AppTextStyles.textStylePoppinsMedium.copyWith(
                            fontSize: 16.sp,
                            color: AppColors.colorPrimaryAlpha,
                          ),
                        )
                      ],
                    )),
                    3.verticalSpace,
                    Center(
                      child: Text(
                        'This will deactivate your account.',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.textStylePoppinsRegular
                            .copyWith(fontSize: 13.sp, color: AppColors.colorPrimaryAlpha),
                      ),
                    ),
                    20.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppOutlineButton(
                          width: 166.w,
                          text: 'Cancel',
                          textColor: AppColors.colorPrimary,
                          onPressed: () => Navigator.pop(context),
                        ),
                        5.horizontalSpace,
                        AppButton(
                          width: 166.w,
                          text: 'Deactivate',
                          onPressed: () {
                            profileNotifier?.deactivateAccount(
                              onSuccess: () {
                                AutoRouter.of(context).pushAndPopUntil(
                                  const LandingIntroRoute(),
                                  predicate: (_) => false,
                                );
                              },
                            );
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          );
        }
      case 'Delete My Account':
        {
          commonModal(
            context,
            onTap: () {
              Navigator.pop(context);
            },
            child: Stack(
              children: [
                Column(
                  children: [
                    RichText(
                        text: TextSpan(
                      text: 'Delete',
                      style: AppTextStyles.textStylePoppinsMedium
                          .copyWith(fontSize: 16.sp, color: AppColors.colorPrimary),
                      children: [
                        TextSpan(
                          text: '',
                          style: AppTextStyles.textStylePoppinsMedium.copyWith(
                            fontSize: 16.sp,
                            color: AppColors.colorPrimaryAlpha,
                          ),
                        )
                      ],
                    )),
                    3.verticalSpace,
                    Center(
                      child: Text(
                        'This will permanently delete Your account',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.textStylePoppinsRegular
                            .copyWith(fontSize: 13.sp, color: AppColors.colorPrimaryAlpha),
                      ),
                    ),
                    20.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppOutlineButton(
                          width: 166.w,
                          text: 'Cancel',
                          textColor: AppColors.colorPrimary,
                          onPressed: () => Navigator.pop(context),
                        ),
                        5.horizontalSpace,
                        AppButton(
                          width: 166.w,
                          text: 'Delete',
                          onPressed: () {
                            profileNotifier?.deleteAccount(
                              onSuccess: () {
                                AutoRouter.of(context).pushAndPopUntil(
                                  const LandingIntroRoute(),
                                  predicate: (_) => false,
                                );
                              },
                            );
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          );
        }
      default:
        {
          null;
        }
    }
  }
}
