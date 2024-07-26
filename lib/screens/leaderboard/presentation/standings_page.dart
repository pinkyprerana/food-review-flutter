import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/routes/app_router.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/widgets/custom_search_field.dart';
import 'package:for_the_table/widgets/notification_icon.dart';

@RoutePage()
class StandingsPage extends ConsumerStatefulWidget {
  const StandingsPage({super.key});

  @override
  ConsumerState<StandingsPage> createState() => _StandingsPageState();
}

class _StandingsPageState extends ConsumerState<StandingsPage> {
  final List<Map<String, dynamic>> users = [
    {
      'name': 'David Brown',
      'address': '404 Cedar St, New York, NY',
      'image': 'assets/images/temp/user-sample1.png',
      'score': 2456
    },
    {
      'name': 'Jane Smith',
      'address': '456 Elm St, New York, NY',
      'image': 'assets/images/temp/user-sample2.png',
      'score': 2444
    },
    {
      'name': 'Jessica Martinez',
      'address': '303 Birch St, New York, NY',
      'image': 'assets/images/temp/user-sample2.png',
      'score': 2190
    },
    {
      'name': 'Michael Wilson',
      'address': '202 Oak St, New York, NY',
      'image': 'assets/images/temp/user-sample1.png',
      'score': 1203
    },
    {
      'name': 'Amanda Taylor',
      'address': '707 Poplar St, New York, NY',
      'image': 'assets/images/temp/user-sample2.png',
      'score': 1580
    },
    {
      'name': 'Robert Johnson',
      'address': '789 Maple St, New York, NY',
      'image': 'assets/images/temp/user-sample1.png',
      'score': 1532
    },
    {
      'name': 'Emily Davis',
      'address': '101 Pine St, New York, NY',
      'image': 'assets/images/temp/user-sample2.png',
      'score': 1890
    },
    {
      'name': 'Sarah Lee',
      'address': '505 Willow St, New York, NY',
      'image': 'assets/images/temp/user-sample2.png',
      'score': 876
    },
    {
      'name': 'John Doe',
      'address': '123 Main St, New York, NY',
      'image': 'assets/images/temp/user-sample1.png',
      'score': 433
    },
    {
      'name': 'Chris Jones',
      'address': '606 Aspen St, Brooklyn, NY',
      'image': 'assets/images/temp/user-sample1.png',
      'score': 431
    }
  ];

  @override
  Widget build(BuildContext context) {
    // final notificationState = ref.watch(notificationNotifierProvider);
    // final todayNotifications = notificationState.todayNotifications;
    // final yesterdayNotifications = notificationState.yesterdayNotifications;
    // final olderNotifications = notificationState.olderNotifications;
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
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Container(
          color: AppColors.colorWhite,
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
                            '10 Standings',
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
                  Container(
                    color: Colors.white,
                    height: 0.72.sh,
                    child: ListView.separated(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.fromLTRB(9.0, 8.0, 18.0, 8.0).r,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: AppColors.colorGrey),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  AutoRouter.of(context).push(PeopleProfileRoute(
                                      peoplename: users[index]['name'],
                                      peopleimage: users[index]['image']!,
                                      peopleId: "",
                                      isFollow: true,
                                    isRequested: false,
                                    isFollowing: false,
                                  ));
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0).r,
                                  child: Image.asset(
                                    users[index]['image']!,
                                    width: 48.r,
                                    height: 48.r,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              10.horizontalSpace,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      users[index]['name']!,
                                      style: AppTextStyles.textStylePoppinsMedium.copyWith(
                                        color: AppColors.colorPrimary,
                                        fontSize: 13.sp,
                                      ),
                                    ),
                                    SizedBox(height: 4.h),
                                    Row(
                                      children: [
                                        Image.asset(Assets.locationMarker),
                                        3.horizontalSpace,
                                        Text(
                                          users[index]['address']!,
                                          style: AppTextStyles.textStylePoppinsRegular.copyWith(
                                            color: AppColors.colorPrimaryAlpha,
                                            fontSize: 10.sp,
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
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.asset(Assets.standingIndex),
                                          // 2.horizontalSpace,
                                          Text(
                                            index < 9 ? '0${index + 1}' : '${index + 1}',
                                            style: AppTextStyles.textStylePoppinsBold.copyWith(
                                              color: AppColors.colorPrimary,
                                              fontSize: 10.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                      4.verticalSpace,
                                      Container(
                                        padding:
                                            const EdgeInsets.symmetric(horizontal: 7, vertical: 3)
                                                .r,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(80).r,
                                            color: AppColors.colorPrimary.withOpacity(0.1)),
                                        child: Text(
                                          users[index]['score'].toString(),
                                          style: AppTextStyles.textStylePoppinsRegular.copyWith(
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
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) => 5.verticalSpace,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
