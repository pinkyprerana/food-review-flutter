import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/screens/home/domain/post_model.dart';
import 'package:for_the_table/screens/home/presentation/widgets/like_icon_widget.dart';
import '../../../../core/constants/app_urls.dart';
import '../../shared/provider.dart';

class CommentItem extends ConsumerStatefulWidget {
  final List<Comment> commentsList;

  const CommentItem({
    super.key,
    required this.commentsList,
  });

  @override
  ConsumerState<CommentItem> createState() => _CommentItemState();
}

class _CommentItemState extends ConsumerState<CommentItem> {
  @override
  Widget build(BuildContext context) {
    final stateNotifier = ref.watch(homeNotifierProvider.notifier);

    return Column(
      children: (widget.commentsList).map((commentInfo) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 24.w,
                height: 24.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: "${AppUrls.profilePicLocation}/${commentInfo.commentedUserData?.profileImage}" ==
                            '${AppUrls.profilePicLocation}/'
                        ? const AssetImage(Assets.avatar)
                        : CachedNetworkImageProvider(
                            "${AppUrls.profilePicLocation}/${commentInfo.commentedUserData?.profileImage}"),
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
                      commentInfo.commentedUserData?.fullName ?? "",
                      style: AppTextStyles.textStylePoppinsMedium.copyWith(
                        fontSize: 12.sp,
                        color: AppColors.colorWhite,
                      ),
                    ),
                    4.verticalSpace,
                    Text(
                      stateNotifier.formatDate(commentInfo.createdAt ?? DateTime.now()),
                      style: AppTextStyles.textStylePoppinsRegular.copyWith(
                        fontSize: 10.sp,
                        color: AppColors.colorWhite.withOpacity(0.70),
                      ),
                    ),
                    8.verticalSpace,
                    Text(
                      commentInfo.comment ?? "",
                      style: AppTextStyles.textStylePoppinsRegular.copyWith(
                        fontSize: 11.sp,
                        color: AppColors.colorWhite.withOpacity(0.70),
                      ),
                    ),
                    10.verticalSpace,
                    Align(
                      alignment: Alignment.topLeft,
                      child: LikeIconWidget(
                        isLiked: commentInfo.isCommentLiked ?? false,
                        onTap: () =>
                            stateNotifier.postCommentLikeUnlike(() {}, commentInfo.id ?? ""),
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
}
