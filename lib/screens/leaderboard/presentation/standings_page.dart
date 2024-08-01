import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/app_urls.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/routes/app_router.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/screens/leaderboard/shared/provider.dart';
import 'package:for_the_table/widgets/custom_search_field.dart';
import 'package:for_the_table/widgets/notification_icon.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

@RoutePage()
class StandingsPage extends ConsumerStatefulWidget {
  const StandingsPage({super.key});

  @override
  ConsumerState<StandingsPage> createState() => _StandingsPageState();
}

class _StandingsPageState extends ConsumerState<StandingsPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final stateNotifier = ref.read(leaderboardProvider.notifier);
      await stateNotifier.fetchLeaderboardList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final stateNotifier = ref.watch(leaderboardProvider.notifier);
    final state = ref.watch(leaderboardProvider);

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        leadingWidth: 0,
        title: Text(
          'Standings',
          style: AppTextStyles.textStylePoppinsBold.copyWith(
            color: AppColors.colorPrimary,
            fontSize: 16.sp,
          ),
        ),
        actions: const [NotificationIcon()],
      ),
      body: state.isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColors.colorPrimary,
              ),
            )
          : state.leaderboardList.isEmpty
              ? Center(
                  child: Text(
                    'The leaderboard is empty',
                    style: AppTextStyles.textStyleLatoMedium,
                  ),
                )
              : SmartRefresher(
                  controller: stateNotifier.refreshController,
                  enablePullDown: false,
                  enablePullUp: true,
                  onLoading: stateNotifier.loadMoreLeaders,
                  footer: CustomFooter(
                    builder: (BuildContext context, mode) {
                      Widget body;
                      if (mode == LoadStatus.idle) {
                        body = const SizedBox.shrink();
                      } else if (mode == LoadStatus.loading) {
                        body = const CupertinoActivityIndicator();
                      } else if (mode == LoadStatus.failed) {
                        body = Text(
                          "Load Failed!Click retry!",
                          style: AppTextStyles.textStylePoppinsLight,
                        );
                      } else if (mode == LoadStatus.canLoading) {
                        body = Text(
                          "release to load more",
                          style: AppTextStyles.textStylePoppinsLight,
                        );
                      } else {
                        body = Text(
                          "No more Data",
                          style: AppTextStyles.textStylePoppinsLight,
                        );
                      }
                      return SizedBox(
                        height: 55.0,
                        child: Center(child: body),
                      );
                    },
                  ),
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16).r,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomSearchField(
                            height: 50.r,
                            bgColor: AppColors.colorBackground,
                            isBorder: true,
                          ),
                          16.verticalSpace,
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Standing List',
                                        style: AppTextStyles.textStylePoppinsMedium.copyWith(
                                          color: AppColors.colorPrimary,
                                          fontSize: 13.sp,
                                        ),
                                      ),
                                      Text(
                                        '${state.totalStandings} Standings',
                                        style: AppTextStyles.textStylePoppinsRegular.copyWith(
                                          color: AppColors.colorPrimaryAlpha,
                                          fontSize: 10.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              16.verticalSpace,
                              ListView.separated(
                                itemCount: state.leaderboardList.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  final user = state.leaderboardList[index];
                                  final profileImage = '${AppUrls.profilePicLocation}/${user.profileImage}';
                                  return GestureDetector(
                                    onTap: () {
                                      AutoRouter.of(context).push(
                                        PeopleProfileRoute(
                                          // peoplename: user.fullName ?? '',
                                          // peopleimage: profileImage,
                                          peopleId: user.id ?? '',
                                          // isFollow: false,
                                          // isRequested: false,
                                          // isFollowing: false,
                                        ),
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.fromLTRB(9.0, 8.0, 18.0, 8.0).r,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(color: AppColors.colorGrey),
                                      ),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(10.0).r,
                                            child: (user.profileImage?.isNotEmpty ?? false)
                                                ? CachedNetworkImage(
                                                    imageUrl:profileImage,
                                                    width: 48.r,
                                                    height: 48.r,
                                                    fit: BoxFit.cover,
                                                  )
                                                : Image.asset(
                                                    Assets.noProfileImage,
                                                    width: 48.r,
                                                    height: 48.r,
                                                    fit: BoxFit.cover,
                                                  ),
                                          ),
                                          10.horizontalSpace,
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  user.fullName ?? '',
                                                  style:
                                                      AppTextStyles.textStylePoppinsMedium.copyWith(
                                                    color: AppColors.colorPrimary,
                                                    fontSize: 13.sp,
                                                  ),
                                                ),
                                                SizedBox(height: 4.h),
                                                Row(
                                                  children: [
                                                    Image.asset(Assets.locationMarker),
                                                    3.horizontalSpace,
                                                    Expanded(
                                                      child: Text(
                                                        (user.location?.isNotEmpty ?? false)
                                                            ? user.location ?? ''
                                                            : 'NA',
                                                        style: AppTextStyles.textStylePoppinsRegular
                                                            .copyWith(
                                                          color: AppColors.colorPrimaryAlpha,
                                                          fontSize: 10.sp,
                                                        ),
                                                        overflow: TextOverflow.ellipsis,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      Image.asset(Assets.standingIndex),
                                                      // 2.horizontalSpace,
                                                      Text(
                                                        index < 9
                                                            ? '0${index + 1}'
                                                            : '${index + 1}',
                                                        style: AppTextStyles.textStylePoppinsBold
                                                            .copyWith(
                                                          color: AppColors.colorPrimary,
                                                          fontSize: 10.sp,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  4.verticalSpace,
                                                  Container(
                                                    padding: const EdgeInsets.symmetric(
                                                            horizontal: 7, vertical: 3)
                                                        .r,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(80).r,
                                                        color: AppColors.colorPrimary
                                                            .withOpacity(0.1)),
                                                    child: Text(
                                                      user.point.toString(),
                                                      style: AppTextStyles.textStylePoppinsRegular
                                                          .copyWith(
                                                        color: AppColors.colorPrimary,
                                                        fontSize: 8.sp,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (BuildContext context, int index) =>
                                    5.verticalSpace,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
    );
  }
}
