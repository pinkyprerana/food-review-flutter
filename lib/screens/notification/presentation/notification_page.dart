import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/model/notification_model/notification_model.dart';
import 'package:for_the_table/screens/notification/presentation/widgets/notification_widget.dart';

import '../../../core/constants/app_urls.dart';

@RoutePage()
class NotificationPage extends StatelessWidget {
  List<NotificationData> notificationList;
  NotificationPage({required this.notificationList,super.key});

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
          'Notification',
          style: AppTextStyles.textStylePoppinsBold.copyWith(
            color: AppColors.colorPrimary,
            fontSize: 16.sp,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 1).r,
          child: Column(
            children: [
              ListView.builder(
                  padding: const EdgeInsets.all(0.0),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: notificationList.length,//3,
                  itemBuilder: (context, index) {
                    final notifications= notificationList[index];
                    final imgUrl = '${AppUrls.postImageLocation}${notifications.postedUserInfo.profileImage}';
                    return  NotificationWidget(
                        imgpath: imgUrl != ""? imgUrl: Assets.food2,
                        title: notifications.title, //'A. Johnson has liked your post.',
                        subtitle: notifications.message//'1 Hour ago'
                    );
                  }),
              10.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Yesterday',
                    style: AppTextStyles.textStylePoppinsRegular.copyWith(
                      fontSize: 10.sp,
                      color: AppColors.colorPrimaryAlpha,
                    ),
                  ),
                ],
              ),
              ListView.builder(
                  padding: const EdgeInsets.all(0.0),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return const NotificationWidget(
                        imgpath: Assets.food2,
                        title: 'A. Johnson has liked your post.',
                        subtitle: '1 Hour ago');
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
