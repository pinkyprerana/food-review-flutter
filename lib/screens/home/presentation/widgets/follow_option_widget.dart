import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/app_urls.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/screens/your_lists/shared/provider.dart';
import '../../../people_profile/shared/providers.dart';

class FollowOptionWidget extends ConsumerStatefulWidget {
  const FollowOptionWidget({
    super.key,
    required this.imgpath,
    required this.followersId,
    required this.name,
    required this.isFollow,
    required this.isRequested,
    required this.isFollowing,
  });
  final String imgpath;
  final String name;
  final String followersId;
  final bool isFollow;
  final bool isRequested;
  final bool isFollowing;

  @override
  ConsumerState<FollowOptionWidget> createState() => _FollowOptionWidgetState();
}

class _FollowOptionWidgetState extends ConsumerState<FollowOptionWidget> {
  void _handleFollowUnfollowButtonPressed(userId) {
    final followNotifier = ref.read(FollowNotifierProvider.notifier);
    final yourPeopleNotifier = ref.read(yourPeopleNotifierProvider.notifier);
    followNotifier.followUnfollow(() {}, userId);
    yourPeopleNotifier.getAllUsersList(isFollowState: true);
    // followNotifier.followUnfollow(() {}, userId).then((_) async {
    //   final followNotifier = ref.watch(yourPeopleNotifierProvider.notifier);
    //   await followNotifier.getAllFollowerList();
    // });
  }

  @override
  Widget build(BuildContext context) {
    // final isFollowing = ref.watch(FollowNotifierProvider.select(
    //     (state) => state.userFollowStatus[widget.followersId] ?? widget.isFollow));

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
            height: 49.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              image: DecorationImage(
                image: widget.imgpath == '${AppUrls.profilePicLocation}/'
                    ? const AssetImage(Assets.avatar)
                    : CachedNetworkImageProvider(
                        widget.imgpath,
                      ),
                fit: BoxFit.cover,
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
            onTap: () {
              _handleFollowUnfollowButtonPressed(widget.followersId);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15).r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: widget.isFollow ? AppColors.colorWhite: widget.isRequested ?AppColors.colorGrey2: AppColors.colorNavy,
                border: Border.all(
                  color: AppColors.colorSmallProfileContainerBorder,
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  widget.isFollow ? 'FOLLOWING': widget.isRequested ? 'REQUESTED' : 'FOLLOW',
                  style: AppTextStyles.textStylePoppinsBold.copyWith(
                    fontSize: 10.sp,
                    color: widget.isFollow ? AppColors.colorBlack: widget.isRequested ?AppColors.colorBlack: AppColors.colorWhite,
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
