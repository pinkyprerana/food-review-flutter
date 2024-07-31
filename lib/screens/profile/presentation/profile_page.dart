import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/app_urls.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/routes/app_router.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/screens/profile/presentation/widgets/other_options_widget.dart';
import 'package:for_the_table/screens/profile/presentation/widgets/recent_activity_widget.dart';
import 'package:for_the_table/screens/profile/presentation/widgets/small_profile_container.dart';
import 'package:for_the_table/screens/profile/presentation/widgets/small_profile_contianer2.dart';
import 'package:for_the_table/widgets/app_button.dart';
import 'package:intl/intl.dart';
import '../shared/providers.dart';

@RoutePage()
class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  List otherOptions = [
    {'icon': Assets.dislike, 'title': 'Disliked Posts'},
    {'icon': Assets.like, 'title': 'Liked Posts'},
    {'icon': Assets.msg, 'title': 'FAQs'},
    {'icon': Assets.logout, 'title': 'Logout'},
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final stateNotifier = ref.read(profileNotifierProvider.notifier);
      await stateNotifier.getUserDetails();
      await stateNotifier.fetchUserActivities();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(profileNotifierProvider);
    final stateNotifier = ref.watch(profileNotifierProvider.notifier);
    final deviceSize = MediaQuery.sizeOf(context);

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        leadingWidth: 0,
        title: Text(
          'Profile',
          style: AppTextStyles.textStylePoppinsBold.copyWith(
            color: AppColors.colorPrimary,
            fontSize: 16.sp,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () => AutoRouter.of(context).push(const NotificationRoute()),
            child: Container(
              height: 26.r,
              width: 26.r,
              margin: const EdgeInsets.only(right: 16).r,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.colorGrey2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Image.asset(
                  Assets.bell,
                  color: AppColors.colorPrimary,
                ),
              ),
            ),
          ),
        ],
      ),
      body: (state.fetchedUser == null || state.isLoading)
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColors.colorPrimary,
              ),
            )
          : SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 2).r,
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: AppColors.colorBorder,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Stack(
                        children: [
                          GestureDetector(
                            onTap: () => stateNotifier.uploadBannerImage(context),
                            child: Container(
                              height: 125,
                              decoration: const BoxDecoration(
                                color: AppColors.colorCream,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                ),
                              ),
                              child: (state.fetchedUser?.bannerImage?.isNotEmpty ?? false)
                                  ? ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                      ),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            '${AppUrls.bannerLocation}/${state.fetchedUser?.bannerImage ?? ''}',
                                        fit: BoxFit.cover,
                                        width: double.maxFinite,
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                            ),
                          ),
                          Column(
                            children: [
                              90.verticalSpace,
                              Container(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20, bottom: 25, top: 20)
                                        .r,
                                decoration: const BoxDecoration(
                                  color: AppColors.colorWhite,
                                  // borderRadius: BorderRadius.only(
                                  //   bottomLeft: Radius.circular(15),
                                  //   bottomRight: Radius.circular(15),
                                  // ),
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                ),
                                child: Column(
                                  children: [
                                    deviceSize.height < 700 ? 70.verticalSpace : 40.verticalSpace,
                                    Text(
                                      state.fetchedUser?.fullName ?? '',
                                      style: AppTextStyles.textStylePoppinsSemiBold.copyWith(
                                        fontSize: 16.sp,
                                        color: AppColors.colorText2,
                                      ),
                                    ),
                                    5.verticalSpace,
                                    Text(
                                      'Joined ${DateFormat('MMMM dd, yyyy').format(
                                        DateTime.parse(
                                            state.fetchedUser?.createdAt.toString() ?? ''),
                                      )}',
                                      style: AppTextStyles.textStylePoppinsRegular.copyWith(
                                        fontSize: 10.sp,
                                        color: AppColors.colorText3,
                                      ),
                                    ),
                                    10.verticalSpace,
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        AppButton(
                                          width: 168.w,
                                          text: 'Edit Profile',
                                          onPressed: () =>
                                              AutoRouter.of(context).push(const EditProfileRoute()),
                                        ),
                                        // 8.horizontalSpace,
                                        GestureDetector(
                                          onTap: () =>
                                              AutoRouter.of(context).push(const SettingsRoute()),
                                          child: SmallProfileContainer2(
                                              widget: Center(
                                            child: Image.asset(Assets.settings),
                                          )),
                                        ),
                                        // 8.horizontalSpace,
                                        SmallProfileContainer2(
                                            widget: Center(
                                          child: Image.asset(Assets.share),
                                        )),
                                      ],
                                    ),
                                    10.verticalSpace,
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: () => AutoRouter.of(context)
                                              .push(YourPeopleListRoute(tabIndex: 0)),
                                          child: SmallProfileContainer(
                                            widget: Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      state.userProfileResponseModel?.stats
                                                              ?.followerCount
                                                              .toString() ??
                                                          '',
                                                      style: AppTextStyles.textStylePoppinsBold
                                                          .copyWith(
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
                                                5.horizontalSpace,
                                              ],
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () => AutoRouter.of(context)
                                              .push(YourPeopleListRoute(tabIndex: 1)),
                                          child: SmallProfileContainer(
                                            widget: Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      state.userProfileResponseModel?.stats
                                                              ?.followingCount
                                                              .toString() ??
                                                          '',
                                                      style: AppTextStyles.textStylePoppinsBold
                                                          .copyWith(
                                                        fontSize: 14.sp,
                                                        color: AppColors.colorPrimary,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Following',
                                                      style: AppTextStyles.textStylePoppinsRegular
                                                          .copyWith(
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
                                        GestureDetector(
                                          onTap: () =>
                                              AutoRouter.of(context).push(const SavedRoute()),
                                          child: SmallProfileContainer(
                                            widget: Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      state.userProfileResponseModel?.savePostStats
                                                              ?.savePostCount
                                                              .toString() ??
                                                          '',
                                                      style: AppTextStyles.textStylePoppinsBold
                                                          .copyWith(
                                                        fontSize: 14.sp,
                                                        color: AppColors.colorPrimary,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Saved',
                                                      style: AppTextStyles.textStylePoppinsRegular
                                                          .copyWith(
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
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            top: 50,
                            left: 0,
                            right: 0,
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      stateNotifier.uploadProfileImage(context);
                                    },
                                    child: Container(
                                      width: deviceSize.height < 700 ? 105.w : 110.w,
                                      height: deviceSize.height < 700 ? 105.w : 110.w,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: AppColors.colorWhite, width: 4),
                                        boxShadow: [
                                          BoxShadow(
                                              color: AppColors.colorShadow.withOpacity(0.1),
                                              offset: const Offset(0, 2),
                                              blurRadius: 10,
                                              spreadRadius: 0)
                                        ],
                                        image: DecorationImage(
                                          image:
                                              (state.fetchedUser?.profileImage.isNotEmpty ?? false)
                                                  ? CachedNetworkImageProvider(state.profileImgPath)
                                                      as ImageProvider
                                                  : const AssetImage(Assets.noProfileImage),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            // bottom: -12,
                            top: 150,
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
                          ),
                        ],
                      ),
                    ),
                    18.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recent Activity',
                          style: AppTextStyles.textStylePoppinsMedium.copyWith(
                            fontSize: 13.sp,
                            color: AppColors.colorPrimary,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => AutoRouter.of(context).push(const RecentActivityRoute()),
                          child: Text(
                            'View All',
                            style: AppTextStyles.textStylePoppinsRegular.copyWith(
                              fontSize: 10.sp,
                              color: AppColors.colorPrimaryAlpha,
                            ),
                          ),
                        ),
                      ],
                    ),
                    10.verticalSpace,
                    ListView.builder(
                      padding: const EdgeInsets.all(0.0),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final activitiesList = state.userActivitiesList;
                        return RecentActivityWidget(
                          imgpath: activitiesList?[index].userInfo?.profileImage ?? '',
                          subtitle: activitiesList?[index].createdAt ?? DateTime.now(),
                          title: activitiesList?[index].title ?? '',
                        );
                      },
                      itemCount: (state.userActivitiesList?.length ?? 0) < 3
                          ? state.userActivitiesList?.length
                          : 3,
                    ),
                    18.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Other Options',
                          style: AppTextStyles.textStylePoppinsMedium.copyWith(
                            fontSize: 13.sp,
                            color: AppColors.colorPrimary,
                          ),
                        ),
                      ],
                    ),
                    5.verticalSpace,
                    ListView.builder(
                      padding: const EdgeInsets.all(0.0),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return OtherOptionsWidget(
                          imgpath: otherOptions[index]['icon'],
                          title: otherOptions[index]['title'],
                        );
                      },
                      itemCount: otherOptions.length,
                    ),
                    100.verticalSpace,
                  ],
                ),
              ),
            ),
    );
  }
}
