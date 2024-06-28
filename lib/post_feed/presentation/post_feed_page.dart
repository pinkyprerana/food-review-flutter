import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/base/shared/providers.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/post_feed/presentation/widgets/post_feed_item.dart';
import 'package:for_the_table/post_feed/shared/provider.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';

class PostFeedPage extends ConsumerStatefulWidget {
  const PostFeedPage({super.key});

  @override
  ConsumerState<PostFeedPage> createState() => _PostFeedPageState();
}

class _PostFeedPageState extends ConsumerState<PostFeedPage> {
  List<String> buttonTexts = ['For The Table', 'Following'];
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
    final stateNotifierForBase = ref.watch(baseNotifierProvider.notifier);
    final stateNotifier = ref.watch(postFeedNotifierProvider.notifier);
    final state = ref.watch(postFeedNotifierProvider);
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height - kToolbarHeight,
            child: SwipeCards(
              matchEngine: _matchEngine!,
              itemBuilder: (BuildContext context, int index) {
                return PostFeedItem();
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      stateNotifierForBase.resetBottomNavIndex(); // Added this
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 30.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.colorWhite.withOpacity(0.10),
                      ),
                      child: const Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 15,
                          color: AppColors.colorWhite,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 38.h,
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: buttonTexts.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              stateNotifier.selectButton(index);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 5),
                              alignment: Alignment.center,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15).r,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: (state.selectedIndex == index)
                                    ? AppColors.colorWhite.withOpacity(0.5)
                                    : AppColors.colorWhite.withOpacity(0.10),
                              ),
                              child: Text(
                                buttonTexts[index],
                                style: AppTextStyles.textStylePoppinsSemiBold
                                    .copyWith(
                                        fontSize: 16.sp,
                                        color: AppColors.colorWhite),
                              ),
                            ),
                          );
                        }),
                  ),
                  Container(
                      alignment: Alignment.center,
                      width: 30.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.transparent,
                      ),
                      child: const SizedBox.shrink()),
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