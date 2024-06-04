import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/home/presentation/widgets/home_post_widget.dart';

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

