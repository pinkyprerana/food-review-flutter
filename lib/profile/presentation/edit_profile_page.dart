import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/profile/presentation/widgets/edit_option_widget.dart';

@RoutePage()
class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});
  final List editOptions = const [
    {'icon': Assets.sms, 'title': 'Email', 'subtitle': 'example@gmail.com'},
    {'icon': Assets.call, 'title': 'Phone Number', 'subtitle': '123 456 7890'},
    {'icon': Assets.lock, 'title': 'Change Password', 'subtitle': ''},
    {'icon': Assets.house, 'title': 'Home City', 'subtitle': ''},
    {'icon': Assets.doc, 'title': 'Add Bio', 'subtitle': ''},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        // leadingWidth: 60,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            // width: 20.w,
            // height: 20.h,
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
        title: Text(
          'Edit Profile',
          style: AppTextStyles.textStylePoppinsBold.copyWith(
            color: AppColors.colorPrimary,
            fontSize: 16.sp,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5).r,
          child: Column(
            children: [
              ListView.builder(
                  padding: const EdgeInsets.all(0.0),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: editOptions.length,
                  itemBuilder: (context, index) {
                    return EditOptionWidget(
                      imgpath: editOptions[index]['icon'],
                      title: editOptions[index]['title'],
                      subtitle: editOptions[index]['subtitle'],
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
