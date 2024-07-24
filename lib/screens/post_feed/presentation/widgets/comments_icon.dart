import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import '../../shared/provider.dart';

class CommentsIcon extends ConsumerStatefulWidget {
  const CommentsIcon({super.key, required this.commentCount});
  final int commentCount;
  @override
  ConsumerState<CommentsIcon> createState()=> _CommentsIconState();
}

class _CommentsIconState extends ConsumerState<CommentsIcon> {
  @override
  Widget build(BuildContext context) {
    final postFeedState = ref.watch(postFeedNotifierProvider);
    final postFeedList = postFeedState.postList;
    return GestureDetector(
      // onTap: () => AutoRouter.of(context).push(
      //     CommentsRoute(postInfoList: postFeedList)),
      child: Column(
        children: [
          Image.asset(Assets.comments),
          Text(
            (widget.commentCount > 9) ? widget.commentCount.toString() : "0${widget.commentCount.toString()}",
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
