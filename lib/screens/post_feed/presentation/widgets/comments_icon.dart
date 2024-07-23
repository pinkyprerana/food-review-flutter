import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/routes/app_router.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';

class CommentsIcon extends StatelessWidget {
  const CommentsIcon({super.key, required this.commentCount});
  final int commentCount;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => AutoRouter.of(context).push(
      //     CommentsRoute(
      //         commentInfoList: widget.commentInfo, postInfoList: widget.postList
      //     )),
      child: Column(
        children: [
          Image.asset(Assets.comments),
          Text(
            (commentCount > 9) ? commentCount.toString() : "0${commentCount.toString()}",
            style: AppTextStyles.textStylePoppinsRegular.copyWith(
              color: AppColors.colorWhite,
              fontSize: 10.sp,
            ),
          )
        ],
      ),
    );
  }
}
