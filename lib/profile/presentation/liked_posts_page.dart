import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/home/presentation/widgets/post_widget.dart';

@RoutePage()
class LikedPostsPage extends StatelessWidget {
  const LikedPostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Liked Posts',
          style: AppTextStyles.textStylePoppinsBold.copyWith(
            color: AppColors.colorPrimary,
            fontSize: 16.sp,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0).r,
          child: Column(
            children: [
              20.verticalSpace,
              ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(0),
                  itemBuilder: (context, index) {
                    return const PostWidget();
                  }),
              10.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
