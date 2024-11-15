import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/widgets/show_video_post.dart';
import '../../../core/styles/app_colors.dart';

class ViewAttachment extends StatelessWidget {
  final String attachmentUrl;

  const ViewAttachment({super.key, required this.attachmentUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorPrimary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.colorPrimary,
        centerTitle: false,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 10, left: 20, right: 0, bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.colorPrimary.withOpacity(0.20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.arrow_back_ios, color: AppColors.colorWhite, size: 15.h),
              ],
            ),
          ),
        ),
      ),
      body: ShowVideoWidget(videoUrl: attachmentUrl)
    );
  }
}