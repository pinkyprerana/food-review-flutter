import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/utils/app_log.dart';
import 'package:for_the_table/widgets/custom_icon.dart';
import '../../../core/constants/app_urls.dart';
import '../../../core/constants/assets.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_text_styles.dart';
import '../../profile/presentation/widgets/small_profile_container.dart';
import '../shared/providers.dart';

@RoutePage()
class PeopleProfilePage extends ConsumerStatefulWidget {
  final String peoplename;
  final String peopleimage;
  final String peopleId;
  final bool isFollow;

  const PeopleProfilePage(
      {super.key,
      required this.peoplename,
      required this.peopleimage,
      required this.peopleId,
      required this.isFollow});

  @override
  ConsumerState<PeopleProfilePage> createState() => _PeopleProfilePageState();
}

class _PeopleProfilePageState extends ConsumerState<PeopleProfilePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final notifier = ref.watch(FollowNotifierProvider.notifier);
      await notifier.getAllPostsOfOtherUserProfile(() {}, widget.peopleId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(FollowNotifierProvider);
    final postListOfOtherUser = state.postListOfOtherUser;
    AppLog.log("postListOfOtherUser:--->>> $postListOfOtherUser");
    void handleFollowButtonPressed(userId) {
      final followNotifier = ref.read(FollowNotifierProvider.notifier);
      followNotifier.followUnfollow(() {}, userId);
      // followNotifier.followUnfollow(() {}, userId).then((_) async {
      //   final followNotifier = ref.watch(yourPeopleNotifierProvider.notifier);
      //   await followNotifier.getAllFollowerList();
      // });
    }

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
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
                5.horizontalSpace, //this is for centering the icon
                Icon(Icons.arrow_back_ios, color: AppColors.colorPrimary, size: 15.h),
              ],
            ),
          ),
        ),
        title: Text(
          'Profile',
          style: AppTextStyles.textStylePoppinsBold.copyWith(
            color: AppColors.colorPrimary,
            fontSize: 16.sp,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Container(
          color: AppColors.colorWhite,
          margin: const EdgeInsets.only(top: 20).r,
          padding: const EdgeInsets.symmetric(horizontal: 16).r,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.colorCream,
                  image: const DecorationImage(
                    image: AssetImage(Assets.coverPhoto), //widget.coverphoto
                    fit: BoxFit.fill,
                  ),
                  border: Border.all(width: 1, color: AppColors.colorBorder),
                ),
                child: Column(
                  children: [
                    90.verticalSpace,
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 25).r,
                          decoration: BoxDecoration(
                            color: AppColors.colorWhite,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              80.verticalSpace,
                              Text(
                                widget.peoplename,
                                style: AppTextStyles.textStylePoppinsSemiBold.copyWith(
                                  fontSize: 16.sp,
                                  color: AppColors.colorText2,
                                ),
                              ),
                              5.verticalSpace,
                              Text(
                                'Joined May 23, 2024',
                                style: AppTextStyles.textStylePoppinsRegular.copyWith(
                                  fontSize: 10.sp,
                                  color: AppColors.colorText3,
                                ),
                              ),
                              10.verticalSpace,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      handleFollowButtonPressed(widget.peopleId);
                                    },
                                    child: Container(
                                      width: 158.w,
                                      height: 50.h,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(13),
                                        color: widget.isFollow
                                            ? AppColors.colorBackground
                                            : AppColors.colorBlack,
                                        border: Border.all(
                                          color: AppColors.colorSmallProfileContainerBorder,
                                          width: 1,
                                        ),
                                      ),
                                      child: Text(
                                        widget.isFollow ? 'Unfollow' : 'Follow',
                                        style: AppTextStyles.textStylePoppinsBold.copyWith(
                                          fontSize: 15.sp,
                                          color: widget.isFollow
                                              ? AppColors.colorBlack
                                              : AppColors.colorBackground,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                  20.horizontalSpace,
                                  SmallProfileContainer(
                                      widget: Center(
                                    child: Image.asset(Assets.share),
                                  )),
                                ],
                              ),
                              10.verticalSpace,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: SmallProfileContainer(
                                      widget: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '1.2M',
                                                    style:
                                                        AppTextStyles.textStylePoppinsBold.copyWith(
                                                      fontSize: 14.sp,
                                                      color: AppColors.colorPrimary,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Followers',
                                                    style: AppTextStyles.textStylePoppinsRegular
                                                        .copyWith(
                                                      fontSize: 10.sp,
                                                      color: AppColors.colorText3,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              // 5.horizontalSpace,
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  10.horizontalSpace,
                                  Expanded(
                                    child: SmallProfileContainer(
                                      widget: Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '1.2M',
                                                style: AppTextStyles.textStylePoppinsBold.copyWith(
                                                  fontSize: 14.sp,
                                                  color: AppColors.colorPrimary,
                                                ),
                                              ),
                                              Text(
                                                'Following',
                                                style:
                                                    AppTextStyles.textStylePoppinsRegular.copyWith(
                                                  fontSize: 10.sp,
                                                  color: AppColors.colorText3,
                                                ),
                                              ),
                                            ],
                                          ),
                                          5.horizontalSpace,
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              10.verticalSpace,
                              widget.isFollow
                                  ? Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: SmallProfileContainer(
                                            widget: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '300',
                                                  style:
                                                      AppTextStyles.textStylePoppinsBold.copyWith(
                                                    fontSize: 14.sp,
                                                    color: AppColors.colorPrimary,
                                                  ),
                                                ),
                                                Text(
                                                  'Reviewed Restaurant',
                                                  style: AppTextStyles.textStylePoppinsRegular
                                                      .copyWith(
                                                    fontSize: 10.sp,
                                                    color: AppColors.colorText3,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        10.horizontalSpace,
                                        Expanded(
                                          child: SmallProfileContainer(
                                            widget: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '200',
                                                  style:
                                                      AppTextStyles.textStylePoppinsBold.copyWith(
                                                    fontSize: 14.sp,
                                                    color: AppColors.colorPrimary,
                                                  ),
                                                ),
                                                Text(
                                                  'Saved Restaurant',
                                                  style: AppTextStyles.textStylePoppinsRegular
                                                      .copyWith(
                                                    fontSize: 10.sp,
                                                    color: AppColors.colorText3,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                        ),
                        Positioned(
                          top: -55,
                          left: 0,
                          right: 0,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Center(
                                child: Container(
                                  width: 110.w,
                                  height: 110.h,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: (widget.peopleimage !=
                                                  'https://forthetable.dedicateddevelopers.us/uploads/user/profile_pic/' &&
                                              widget.peopleimage != '')
                                          ? CachedNetworkImageProvider(widget.peopleimage)
                                          : const AssetImage(Assets.noProfileImage),
                                      fit: BoxFit.cover,
                                    ),
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                    border: Border.all(color: AppColors.colorWhite, width: 4),
                                    boxShadow: [
                                      BoxShadow(
                                          color: AppColors.colorShadow.withOpacity(0.1),
                                          offset: const Offset(0, 2),
                                          blurRadius: 10,
                                          spreadRadius: 0)
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: -12,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(17),
                                      color: AppColors.colorWhite,
                                    ),
                                    child: Center(
                                      child: Text(
                                        '01',
                                        style: AppTextStyles.textStylePoppinsMedium
                                            .copyWith(fontSize: 13.sp, color: AppColors.colorText),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              18.verticalSpace,
              Text(
                "Posts",
                style: AppTextStyles.textStylePoppinsMedium.copyWith(
                  fontSize: 13.sp,
                  color: AppColors.colorPrimary,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                width: double.infinity,
                child: widget.isFollow
                    ? postListOfOtherUser.isNotEmpty
                        ? GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 3 / 3,
                            ),
                            itemCount: postListOfOtherUser.length,
                            itemBuilder: (context, index) {
                              final postList = postListOfOtherUser[index];
                              AppLog.log("postList:--->>> $postList");
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  margin: const EdgeInsets.all(2),
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      Image.network(
                                        '${AppUrls.postImageLocation}${postList.file}',
                                        fit: BoxFit.cover,
                                      ),
                                      Positioned(
                                        top: 8,
                                        right: 8,
                                        child: Image.asset(Assets.save),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          )
                        : Align(
                            alignment: Alignment.topCenter,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                GradientIcon(
                                  icon: Icons.no_photography_outlined,
                                  size: 50.h,
                                ),
                                Text(
                                  'No post available',
                                  style: AppTextStyles.textStylePoppinsMedium.copyWith(
                                    fontSize: 12.sp,
                                    color: AppColors.colorPrimaryAlpha,
                                  ),
                                ),
                              ],
                            ),
                          )
                    : Image.asset(Assets.blurred),
              ),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
