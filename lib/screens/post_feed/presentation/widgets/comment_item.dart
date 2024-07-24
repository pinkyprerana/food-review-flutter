import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/screens/post_feed/domain/postFeed_model.dart';
import '../../../../core/constants/app_urls.dart';
import '../../shared/provider.dart';

class CommentItem extends ConsumerStatefulWidget {
  final List<CommentInfo> commentInfoList;

  const CommentItem({
    super.key,
    required this.commentInfoList,
  });

  @override
  ConsumerState<CommentItem> createState() => _CommentItemState();
}

class _CommentItemState extends ConsumerState<CommentItem> {
  @override
  Widget build(BuildContext context) {
    final postFeedNotifier = ref.watch(postFeedNotifierProvider.notifier);
    return Column(
      children: widget.commentInfoList.map((commentInfo) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 24.w,
                height: 24.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      "${AppUrls.profilePicLocation}/${commentInfo.commentedUserData.profileImage}",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              5.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      commentInfo.commentedUserData.fullName,
                      style: AppTextStyles.textStylePoppinsMedium.copyWith(
                        fontSize: 12.sp,
                        color: AppColors.colorWhite,
                      ),
                    ),
                    4.verticalSpace,
                    Text(
                      _formatDate(commentInfo.createdAt),
                      style: AppTextStyles.textStylePoppinsRegular.copyWith(
                        fontSize: 10.sp,
                        color: AppColors.colorWhite.withOpacity(0.70),
                      ),
                    ),
                    8.verticalSpace,
                    Text(
                      commentInfo.comment,
                      style: AppTextStyles.textStylePoppinsRegular.copyWith(
                        fontSize: 11.sp,
                        color: AppColors.colorWhite.withOpacity(0.70),
                      ),
                    ),
                    10.verticalSpace,
                    Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: ()=> postFeedNotifier.postCommentLikeUnlike((){},  commentInfo.id),
                        child: commentInfo.isCommentLiked
                            ? Image.asset(Assets.redHeart)
                            : Image.asset(Assets.like),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays > 7) {
      return '${date.day}/${date.month}/${date.year}';
    } else if (difference.inDays > 1) {
      return '${difference.inDays} days ago';
    } else if (difference.inHours > 1) {
      return '${difference.inHours} hours ago';
    } else if (difference.inMinutes > 1) {
      return '${difference.inMinutes} minutes ago';
    } else {
      return 'Just now';
    }
  }
}
