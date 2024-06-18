import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/home/presentation/widgets/follow_option_widget.dart';
import 'package:for_the_table/home/presentation/widgets/home_post_widget.dart';
import 'package:for_the_table/home/presentation/widgets/post_widget.dart';
import 'package:for_the_table/home/presentation/widgets/restaurant_widget.dart';

@RoutePage()
class HomePageNew extends ConsumerStatefulWidget {
  const HomePageNew({super.key});

  @override
  ConsumerState<HomePageNew> createState() => _HomePageNewState();
}

class _HomePageNewState extends ConsumerState<HomePageNew> {
  List followOptions = [
    {'image': Assets.follow1, 'name': 'Haylie Lipshutz'},
    {'image': Assets.follow2, 'name': 'Skylar Bergson'},
    {'image': Assets.follow1, 'name': 'Haylie Lipshutz'},
    {'image': Assets.follow2, 'name': 'Skylar Bergson'},
  ];

  List restaurantlist = [
    {'image': Assets.rest1},
    {'image': Assets.rest2},
    {'image': Assets.rest3},
    {'image': Assets.rest4},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          leadingWidth: 0,
          title: Text(
            'FOR THE TABLE',
            style: AppTextStyles.textStylePoppinsBold.copyWith(
              color: AppColors.colorPrimary,
              letterSpacing: 3.0,
            ),
          ),
          actions: [
            GestureDetector(
              // onTap: () => AutoRouter.of(context).push(const NotificationRoute()),
              child: Container(
                height: 26.r,
                width: 26.r,
                margin: const EdgeInsets.only(right: 15).r,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.colorGrey2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                    child: Image.asset(
                  Assets.search,
                  color: AppColors.colorPrimary,
                )),
              ),
            ),
            GestureDetector(
              // onTap: () => AutoRouter.of(context).push(const NotificationRoute()),
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
                )),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Follow',
                      style: AppTextStyles.textStylePoppinsMedium.copyWith(
                          fontSize: 13.sp, color: AppColors.colorPrimary),
                    ),
                    Text(
                      'View All',
                      style: AppTextStyles.textStylePoppinsRegular.copyWith(
                        fontSize: 13.sp,
                        color: AppColors.colorPrimaryAlpha,
                      ),
                    )
                  ],
                ),
              ),
              5.verticalSpace,
              SizedBox(
                height: 180.0.h,
                child: ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: followOptions.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return FollowOptionWidget(
                        imgpath: followOptions[index]['image'],
                        name: followOptions[index]['name'],
                      );
                    }),
              ),
              10.verticalSpace,
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Restaurant List',
                      style: AppTextStyles.textStylePoppinsMedium.copyWith(
                          fontSize: 13.sp, color: AppColors.colorPrimary),
                    ),
                    Text(
                      'View All',
                      style: AppTextStyles.textStylePoppinsRegular.copyWith(
                        fontSize: 13.sp,
                        color: AppColors.colorPrimaryAlpha,
                      ),
                    )
                  ],
                ),
              ),
              5.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: ListView.builder(
                    padding: const EdgeInsets.all(0),
                    itemCount: restaurantlist.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return RestaurantWidget(
                        imgpath: restaurantlist[index]['image'],
                      );
                    }),
              ),
              10.verticalSpace,
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Post List',
                      style: AppTextStyles.textStylePoppinsMedium.copyWith(
                          fontSize: 13.sp, color: AppColors.colorPrimary),
                    ),
                    Text(
                      'View All',
                      style: AppTextStyles.textStylePoppinsRegular.copyWith(
                        fontSize: 13.sp,
                        color: AppColors.colorPrimaryAlpha,
                      ),
                    )
                  ],
                ),
              ),
              5.verticalSpace,
              //list of posts
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(0),
                    itemBuilder: (context, index) {
                      return const PostWidget();
                    }),
              ),
              90.verticalSpace,
            ],
          ),
        ));
  }
}
