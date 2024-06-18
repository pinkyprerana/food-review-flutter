import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';

class PostFeedPage extends ConsumerStatefulWidget {
  const PostFeedPage({super.key});

  @override
  ConsumerState<PostFeedPage> createState() => _PostFeedPageState();
}

class _PostFeedPageState extends ConsumerState<PostFeedPage> {
  final List<SwipeItem> _swipeItems = <SwipeItem>[];
  MatchEngine? _matchEngine;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final List<String> _names = [
    "Post 1",
    "Post 2",
    "Post 3",
    "Post 4",
    "Post 5",
    "Post 6",
    "Post 7",
    "Post 8"
  ];

  @override
  void initState() {
    for (int i = 0; i < _names.length; i++) {
      _swipeItems.add(SwipeItem(
          content: Content(text: _names[i]),
          likeAction: () {
            // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            //   content: Text("Liked ${_names[i]}"),
            //   duration: const Duration(milliseconds: 500),
            // ));
          },
          nopeAction: () {
            // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            //   content: Text("Nope ${_names[i]}"),
            //   duration: const Duration(milliseconds: 500),
            // ));
          },
          superlikeAction: () {
            // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            //   content: Text("Superliked ${_names[i]}"),
            //   duration: const Duration(milliseconds: 500),
            // ));
          },
          onSlideUpdate: (SlideRegion? region) async {
            print("Region $region");
          }));
    }

    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height - kToolbarHeight,
            child: SwipeCards(
              matchEngine: _matchEngine!,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Assets.photo),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0).r,
                    child: Column(
                      children: [
                        Spacer(),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: BackdropFilter(
                            blendMode: BlendMode.srcIn,
                            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                            child: Container(
                              padding: const EdgeInsets.only(
                                      top: 15, left: 15, right: 15, bottom: 10)
                                  .r,
                              width: double.infinity,
                              //height: 170.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    const Color(0xff0A0A0A).withOpacity(0.1),
                                    const Color(0xff000000).withOpacity(0)
                                  ],
                                ),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 20.w,
                                        height: 20.h,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: AssetImage(
                                                Assets.follow1,
                                              ),
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                      8.horizontalSpace,
                                      Text(
                                        'Ahmad Gouse',
                                        style: AppTextStyles
                                            .textStylePoppinsMedium
                                            .copyWith(
                                                fontSize: 16.sp,
                                                color: AppColors.colorWhite),
                                      ),
                                      8.horizontalSpace,
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(70),
                                          color: AppColors.colorWhite
                                              .withOpacity(0.20),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Following',
                                            style: AppTextStyles
                                                .textStylePoppinsRegular
                                                .copyWith(
                                              color: AppColors.colorWhite,
                                              fontSize: 10.sp,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  // 15.verticalSpace,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          15.verticalSpace,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(70),
                                                  color: AppColors.colorGreen,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    'Chinese Cuisine',
                                                    style: AppTextStyles
                                                        .textStylePoppinsRegular
                                                        .copyWith(
                                                      color:
                                                          AppColors.colorWhite,
                                                      fontSize: 10.sp,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              8.horizontalSpace,
                                              Image.asset(Assets.dislike_emoji),
                                              5.horizontalSpace,
                                              Text(
                                                'Didn\'t Like',
                                                style: AppTextStyles
                                                    .textStylePoppinsRegular
                                                    .copyWith(
                                                  fontSize: 10.sp,
                                                  color: AppColors.colorWhite,
                                                ),
                                              )
                                            ],
                                          ),
                                          8.verticalSpace,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                Assets.location2,
                                              ),
                                              8.horizontalSpace,
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Starbucks LA, California',
                                                    style: AppTextStyles
                                                        .textStylePoppinsMedium
                                                        .copyWith(
                                                      fontSize: 13.sp,
                                                      color:
                                                          AppColors.colorWhite,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Double road, Lorem City, LA',
                                                    style: AppTextStyles
                                                        .textStylePoppinsRegular
                                                        .copyWith(
                                                      fontSize: 10.sp,
                                                      color:
                                                          AppColors.colorWhite,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Image.asset(Assets.like),
                                          15.verticalSpace,
                                          Column(
                                            children: [
                                              Image.asset(Assets.comments),
                                              Text(
                                                '00',
                                                style: AppTextStyles
                                                    .textStylePoppinsRegular
                                                    .copyWith(
                                                  color: AppColors.colorWhite,
                                                  fontSize: 10.sp,
                                                ),
                                              )
                                            ],
                                          ),
                                          10.verticalSpace,
                                          Image.asset(Assets.bookmark),
                                        ],
                                      )
                                    ],
                                  ),

                                  15.verticalSpace,
                                  Text(
                                    'A memorable evening to be remembered.',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyles.textStylePoppinsMedium
                                        .copyWith(
                                      fontSize: 13.sp,
                                      color: AppColors.colorWhite,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        20.verticalSpace,
                      ],
                    ),
                  ),
                  // child: Text(
                  //   _swipeItems[index].content.text,
                  //   style: const TextStyle(fontSize: 100),
                  // ),
                );
              },
              onStackFinished: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Stack Finished"),
                  duration: Duration(milliseconds: 500),
                ));
              },
              itemChanged: (SwipeItem item, int index) {
                print("item: ${item.content.text}, index: $index");
              },
              upSwipeAllowed: true,
              fillSpace: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 30.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.colorWhite.withOpacity(0.10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 15,
                        color: AppColors.colorWhite,
                      ),
                    ),
                  ),
                  // ElevatedButton(
                  //     onPressed: () {
                  //       _matchEngine!.currentItem?.nope();
                  //     },
                  //     child: const Text("Nope")),
                  40.horizontalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10)
                            .r,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.colorWhite.withOpacity(0.10),
                        ),
                        child: Text(
                          'For You',
                          style: AppTextStyles.textStylePoppinsSemiBold
                              .copyWith(
                                  fontSize: 16.sp, color: AppColors.colorWhite),
                        ),
                      ),
                      // ElevatedButton(
                      //     onPressed: () {
                      //       _matchEngine!.currentItem?.superLike();
                      //     },
                      //     child: const Text("Superlike")),
                      10.horizontalSpace,
                      Container(
                        padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10)
                            .r,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.colorWhite.withOpacity(0.10),
                        ),
                        child: Text(
                          'Following',
                          style: AppTextStyles.textStylePoppinsSemiBold
                              .copyWith(
                                  fontSize: 16.sp, color: AppColors.colorWhite),
                        ),
                      ),
                      // ElevatedButton(
                      //     onPressed: () {
                      //       _matchEngine!.currentItem?.like();
                      //     },
                      //     child: const Text("Like"))
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Content {
  final String? text;

  Content({this.text});
}
