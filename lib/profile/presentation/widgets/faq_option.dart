import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';

class FaqOption extends StatefulWidget {
  const FaqOption({super.key});

  @override
  State<FaqOption> createState() => _FaqOptionState();
}

class _FaqOptionState extends State<FaqOption> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 1, color: AppColors.colorGrey),
        color: (_isExpanded) ? AppColors.colorPrimary : AppColors.colorWhite,
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.only(left: 8),
          title: Text(
            'Lorem ipsum dolor sit amet?',
            style: AppTextStyles.textStylePoppinsMedium.copyWith(
                fontSize: 13.sp,
                color: (_isExpanded)
                    ? AppColors.colorWhite
                    : AppColors.colorPrimary),
          ),
          trailing: (_isExpanded)
              ? Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.expand_less,
                    color: AppColors.colorWhite,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.expand_more),
                ),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 8, right: 8, bottom: 30).r,
                    child: Text(
                      'Lorem ipsum dolor sit amet consectetur. Turpis ipsum ut eu vestibulum sit. Vitae pulvinar nullam lorem posuere. Comm odonisl suspendisse tincidunt.',
                      style: AppTextStyles.textStylePoppinsRegular.copyWith(
                        fontSize: 11.sp,
                        color: AppColors.colorWhite,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
          onExpansionChanged: (bool value) {
            setState(() {
              _isExpanded = value;
            });
          },
        ),
      ),
    );
  }
}
