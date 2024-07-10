import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import '../../../people_profile/shared/providers.dart';


class FollowOptionWidget extends ConsumerStatefulWidget {
  const FollowOptionWidget({
    super.key,
    required this.imgpath,
    required this.followersId,
    required this.name,
    required this.isFollow,
  });
  final String imgpath;
  final String name;
  final String followersId;
  final bool isFollow;

  @override
  ConsumerState<FollowOptionWidget> createState() => _FollowOptionWidgetState();
}

class _FollowOptionWidgetState extends ConsumerState<FollowOptionWidget> {

  void _handleFollowUnfollowButtonPressed(userId) {
    final followNotifier = ref.read(FollowNotifierProvider.notifier);
    followNotifier.follow_unfollow(() {}, userId);
  }


  @override
  Widget build(BuildContext context) {
    final isFollowing = ref.watch(FollowNotifierProvider).isFollowing;
    return Container(
      margin: const EdgeInsets.only(left: 15).r,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30).r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 1, color: AppColors.colorGrey),
      ),
      child: Column(
        children: [
          2.verticalSpace,
          Container(
            width: 49.w,
            height: 49.h,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: CachedNetworkImage(
              imageUrl: widget.imgpath,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => Image.asset(Assets.avatar, scale: 1,),
              imageBuilder: (context, imageProvider) => Container(
                width: 49.w,
                height: 49.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          10.verticalSpace,
          Text(
            widget.name,
            style: AppTextStyles.textStylePoppinsMedium.copyWith(
              fontSize: 13.sp,
              color: AppColors.colorPrimary,
            ),
          ),
          3.verticalSpace,
          Text(
            'Joined May 23, 2024',
            style: AppTextStyles.textStylePoppinsLight.copyWith(
              fontSize: 8.sp,
              color: AppColors.colorPrimaryAlpha,
            ),
          ),
          15.verticalSpace,
          GestureDetector(
            onTap: (){
              _handleFollowUnfollowButtonPressed(widget.followersId);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15).r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.colorNavy,
              ),
              child: Center(
                child: Text(
                  isFollowing ? 'UNFOLLOW':'FOLLOW',
                  style: AppTextStyles.textStylePoppinsBold.copyWith(
                    fontSize: 10.sp,
                    color: AppColors.colorWhite,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
