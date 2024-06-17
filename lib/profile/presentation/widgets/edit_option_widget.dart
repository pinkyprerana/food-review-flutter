import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/core/utils/modal_bottom_sheet.dart';
import 'package:for_the_table/widgets/app_button.dart';
import 'package:for_the_table/widgets/custom_input_field.dart';

class EditOptionWidget extends StatelessWidget {
  const EditOptionWidget(
      {super.key,
      required this.title,
      required this.imgpath,
      this.subtitle = ''});
  final String title;
  final String imgpath;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (title == 'Email' || title == 'Change Password')
          ? () {
              getModal(title, context);
            }
          : null,
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
            subtitle: (subtitle != '')
                ? Text(
                    subtitle,
                    style: AppTextStyles.textStylePoppinsRegular.copyWith(
                      fontSize: 10.sp,
                      color: AppColors.colorPrimaryAlpha,
                    ),
                  )
                : null,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const VerticalDivider(
                  color: AppColors.colorGrey,
                  thickness: 1,
                ),
                5.horizontalSpace,
                const Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.colorArrowIcon,
                  size: 15.6,
                  weight: 500,
                )
              ],
            )),
      ),
    );
  }
}

void getModal(String title, BuildContext context) {
  switch (title) {
    case 'Email':
      {
        commonModal(context,
            child: Stack(
              children: [
                Column(
                  children: [
                    RichText(
                        text: TextSpan(
                      text: 'Change',
                      style: AppTextStyles.textStylePoppinsMedium.copyWith(
                          fontSize: 16.sp, color: AppColors.colorPrimary),
                      children: [
                        TextSpan(
                          text: ' Email Address',
                          style: AppTextStyles.textStylePoppinsMedium.copyWith(
                            fontSize: 16.sp,
                            color: AppColors.colorPrimaryAlpha,
                          ),
                        )
                      ],
                    )),
                    3.verticalSpace,
                    Text(
                      'Change your email address below.',
                      style: AppTextStyles.textStylePoppinsRegular.copyWith(
                          fontSize: 13.sp, color: AppColors.colorPrimaryAlpha),
                    ),
                    20.verticalSpace,
                    const CustomInputField(
                      label: 'Email Address',
                      hint: 'Enter email address',
                    ),
                    10.verticalSpace,
                    const AppButton(
                      text: 'Submit',
                    )
                  ],
                ),
              ],
            ));
      }
      break;
    default:
      {
        null;
      }
      break;
  }
}
