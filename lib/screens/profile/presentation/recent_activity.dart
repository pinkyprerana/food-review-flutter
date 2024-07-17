import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/screens/profile/presentation/widgets/recent_activity_widget.dart';
import 'package:for_the_table/screens/profile/shared/providers.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

@RoutePage()
class RecentActivityPage extends ConsumerStatefulWidget {
  const RecentActivityPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RecentActivityPageState();
}

class _RecentActivityPageState extends ConsumerState<RecentActivityPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final stateNotifier = ref.read(profileNotifierProvider.notifier);
      await stateNotifier.fetchUserActivities(perpage: 10);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final stateNotifier = ref.read(profileNotifierProvider.notifier);
    final state = ref.watch(profileNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        // leadingWidth: 60,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 10, left: 20, right: 0, bottom: 10).r,
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
          'Recent Activities',
          style: AppTextStyles.textStylePoppinsBold.copyWith(
            color: AppColors.colorPrimary,
            fontSize: 16.sp,
          ),
        ),
      ),
      body: state.isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColors.colorPrimary,
              ),
            )
          : SmartRefresher(
              controller: stateNotifier.refreshController,
              enablePullUp: true,
              enablePullDown: false,
              onLoading: () {
                stateNotifier.loadMoreActivities();
              },
              footer: CustomFooter(
                builder: (BuildContext context, mode) {
                  if (!state.isMoreDataFetchable) {
                    mode = LoadStatus.noMore;
                  }
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
              child: ListView.separated(
                itemBuilder: (context, index) {
                  final activitiesList = state.userActivitiesList;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: RecentActivityWidget(
                      imgpath: activitiesList?[index].imagePath ?? '',
                      subtitle: activitiesList?[index].createdAt ?? DateTime.now(),
                      title: activitiesList?[index].title ?? '',
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) => 5.verticalSpace,
                itemCount: state.userActivitiesList?.length ?? 0,
              ),
            ),
    );
  }
}
