import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';

@RoutePage()
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  List<Widget> cards = [
    const HomePostWidget(
      img: 'assets/images/temp/post-img.png',
      userName: 'Ahmad Gouse',
    ),
    const HomePostWidget(
      img: 'assets/images/temp/post-img3.jpeg',
      userName: 'King Khan',
    ),
    const HomePostWidget(
      img: 'assets/images/temp/post-img2.png',
      userName: 'Someone Else',
    )
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
          'For The Table',
          style: AppTextStyles.textStylePoppinsBold.copyWith(
            color: AppColors.colorPrimary,
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
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        removeLeft: true,
        removeRight: true,
        child: CardSwiper(
          padding: EdgeInsets.zero,
          cardsCount: cards.length,
          cardBuilder: (context, index, percentThresholdX, percentThresholdY) =>
              cards[index],
        ),
      ),
    );
  }
}

class HomePostWidget extends StatelessWidget {
  const HomePostWidget({
    super.key,
    required this.img,
    required this.userName,
  });
  final String img;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 0.8.sh,
      width: 1.sw,
      child: Stack(
        children: [
          Center(
            child: PostContent(
              inFrontContent: Image.asset(
                img,
                scale: 2,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.keyboard_arrow_up_rounded,
                  color: AppColors.colorWhite,
                  size: 34.r,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 26.0, bottom: 26, right: 26.0)
                          .r,
                  child: PostDetailsBox(
                    child: PostDetails(
                      userName: userName,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PostDetails extends StatelessWidget {
  const PostDetails({
    super.key,
    required this.userName,
  });
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/temp/post-profile-img.png',
                    scale: 2,
                    width: 20.r,
                    height: 20.r,
                  ),
                  5.horizontalSpace,
                  Text(
                    userName,
                    style: AppTextStyles.textStylePoppinsMedium.copyWith(
                      color: AppColors.colorWhite,
                      fontSize: 16.sp,
                    ),
                  ),
                  8.horizontalSpace,
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 8)
                            .r,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: AppColors.colorWhite.withOpacity(0.3)),
                    child: Text(
                      'Following',
                      style: AppTextStyles.textStylePoppinsRegular.copyWith(
                        color: AppColors.colorWhite,
                        fontSize: 10.sp,
                      ),
                    ),
                  )
                ],
              ),
              26.verticalSpace,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Starbucks LA, California',
                    style: AppTextStyles.textStylePoppinsMedium.copyWith(
                      color: AppColors.colorWhite,
                      fontSize: 13.sp,
                    ),
                  ),
                ],
              ),
              4.verticalSpace,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Double road, Lorem City, LA',
                    style: AppTextStyles.textStylePoppinsRegular.copyWith(
                      color: AppColors.colorWhite,
                      fontSize: 10.sp,
                    ),
                  ),
                ],
              ),
              10.verticalSpace,
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      for (int i = 0; i < 5; i++) ...[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 3.0),
                          child: Icon(
                            Icons.star_rate_rounded,
                            size: 11.r,
                            color: AppColors.colorGreen,
                          ),
                        )
                      ],
                      5.horizontalSpace,
                      Text(
                        '4.8',
                        style: AppTextStyles.textStylePoppinsRegular.copyWith(
                          color: AppColors.colorWhite,
                          fontSize: 10.sp,
                        ),
                      ),
                    ],
                  ),
                  16.horizontalSpace,
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 3.0),
                        child: Image.asset(Assets.dish),
                      ),
                      5.horizontalSpace,
                      Text(
                        '\$100 For 2',
                        style: AppTextStyles.textStylePoppinsRegular.copyWith(
                          color: AppColors.colorWhite,
                          fontSize: 10.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(Assets.like),
              12.verticalSpace,
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(Assets.comment),
                  Text(
                    '00',
                    style: AppTextStyles.textStylePoppinsRegular.copyWith(
                      color: AppColors.colorWhite,
                      fontSize: 10.sp,
                    ),
                  )
                ],
              ),
              12.verticalSpace,
              Image.asset(Assets.save),
            ],
          )
        ],
      ),
    );
  }
}

class PostContent extends StatelessWidget {
  const PostContent({
    super.key,
    required this.inFrontContent,
  });
  final Widget inFrontContent;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.8.sh,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8).r,
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        // color: Colors.black,
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          colors: AppColors.postGradient,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: inFrontContent,
    );
  }
}

class PostDetailsBox extends StatelessWidget {
  const PostDetailsBox({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 0.2.sh,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 20.0),
          child: Container(
              // details in here
              alignment: Alignment.center,
              color: Colors.black.withOpacity(0.4),
              child: child),
        ),
      ),
    );
  }
}
