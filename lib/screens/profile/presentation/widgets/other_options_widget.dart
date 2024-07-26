import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/routes/app_router.dart';
// import 'package:for_the_table/core/shared/providers.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/core/utils/app_log.dart';
import 'package:for_the_table/core/utils/modal_bottom_sheet.dart';
import 'package:for_the_table/widgets/app_button.dart';
import 'package:for_the_table/widgets/app_outline_button.dart';
import '../../shared/providers.dart';

class OtherOptionsWidget extends ConsumerWidget {
  const OtherOptionsWidget({super.key, required this.title, required this.imgpath});
  final String title;
  final String imgpath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateNotifier = ref.watch(profileNotifierProvider.notifier);
    final state = ref.watch(profileNotifierProvider);

    // final hive = ref.read(hiveProvider);
    return GestureDetector(
      onTap: () {
        if (title == 'Logout') {
          commonModal(context, onTap: () {
            Navigator.pop(context);
          },
              child: Stack(
                children: [
                  Column(
                    children: [
                      RichText(
                          text: TextSpan(
                        text: 'Log',
                        style: AppTextStyles.textStylePoppinsMedium
                            .copyWith(fontSize: 16.sp, color: AppColors.colorPrimary),
                        children: [
                          TextSpan(
                            text: ' Out',
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
                          'Are you Sure Want to logout from Your Account.',
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
                            text: 'Logout',
                            loading: state.isLoading,
                            onPressed: () async {
                              AppLog.log("---------------abc------------------");
                              await stateNotifier.logout(context: context);
                              // await stateNotifier.logout(callback: () async {
                              //   Future.delayed(const Duration(seconds: 3), () {
                              //     print('-----------logging out------------');
                              //     Navigator.of(context).pop();

                              //     // AutoRouter.of(context).pushAndPopUntil(
                              //     //   const LandingIntroRoute(),
                              //     //   predicate: (_) => false,
                              //     // );
                              //   });
                              // });

                              // Navigator.of(context).pop();

                              // AutoRouter.of(context).pushAndPopUntil(
                              //   const LandingIntroRoute(),
                              //   predicate: (_) => false,
                              // );
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ));
        } else if (title == 'FAQs') {
          AutoRouter.of(context).push(const FaqsRoute());
        } else if (title == 'Liked Posts') {
          AutoRouter.of(context).push(const LikedPostsRoute());
        } else if (title == 'Disliked Posts') {
          AutoRouter.of(context).push(const DislikedPostsRoute());
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0).r,
        child: ListTile(
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: AppColors.colorGrey, width: 1),
              borderRadius: BorderRadius.circular(15),
            ),
            leading: Container(
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
            title: Text(
              title,
              style: AppTextStyles.textStylePoppinsMedium.copyWith(
                fontSize: 13.sp,
                color: AppColors.colorPrimary,
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const VerticalDivider(
                  color: AppColors.colorGrey,
                  thickness: 1,
                ),
                15.horizontalSpace,
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.colorArrowIcon,
                      size: 15.6,
                      weight: 500,
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
