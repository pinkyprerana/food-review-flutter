import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/home/presentation/widgets/post_content.dart';
import 'package:for_the_table/home/presentation/widgets/post_details_box.dart';
import 'package:for_the_table/home/presentation/widgets/post_details_widget.dart';

class HomePostWidget extends StatelessWidget {
  const HomePostWidget({
    super.key,
    required this.img,
    required this.userName,
  });
  final String img;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 0.8.sh,
      width: 1.sw,
      child: Stack(
        children: [
          Center(
            child: PostContent(
              inFrontContent: Image.asset(
                img,
                scale: 2,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.keyboard_arrow_up_rounded,
                  color: AppColors.colorWhite,
                  size: 34.r,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 26.0, bottom: 26, right: 26.0)
                          .r,
                  child: PostDetailsBox(
                    child: PostDetails(
                      userName: userName,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}