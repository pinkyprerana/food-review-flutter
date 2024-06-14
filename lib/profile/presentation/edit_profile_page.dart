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
    {'icon': Assets.doc, 'title': 'Profile Description', 'subtitle': ''},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        // leadingWidth: 60,
        automaticallyImplyLeading: false,
        leading: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.colorPrimary.withOpacity(0.20),
          ),
          child: Center(
              child: Image(
            image: AssetImage(Assets.back),
          )),
        ),
        title: Text(
          'Edit Profile',
          style: AppTextStyles.textStylePoppinsBold.copyWith(
            color: AppColors.colorPrimary,
            fontSize: 16.sp,
          ),
        ),
        actions: [
          GestureDetector(
            // onTap: () => AutoRouter.of(context).push(const NotificationRoute()),
            child: Container(
              height: 26.r,
              width: 26.r,
              margin: const EdgeInsets.only(right: 16).r,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.colorGrey2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                  child: Image.asset(
                Assets.bell,
                color: AppColors.colorPrimary,
              )),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16).r,
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
