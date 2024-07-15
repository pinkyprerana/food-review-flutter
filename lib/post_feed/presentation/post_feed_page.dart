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
  SlideRegion? _currentRegion;
  bool _isStackFinished = false;

  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    final postFeedState = ref.watch(postFeedNotifierProvider);
    final postFeedList = postFeedState.postList;
    // });

    for (int i = 0; i < postFeedList.length; i++) {
      _swipeItems.add(SwipeItem(
          content: Content(text: postFeedList[i].toString()),
          likeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Liked ${postFeedList[i].title}"),
              duration: const Duration(milliseconds: 500),
            ));
          },
          nopeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Not liked ${postFeedList[i].title}"),
              duration: const Duration(milliseconds: 500),
            ));
          },
          superlikeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Superliked ${postFeedList[i].title}"),
              duration: const Duration(milliseconds: 500),
            ));
          },
          onSlideUpdate: (SlideRegion? region) async {
            print("Region $region");
          }));
    }

    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    final postFeedNotifier = ref.watch(postFeedNotifierProvider.notifier);
    await postFeedNotifier.getPostFeed();
    });
  }

  @override
  Widget build(BuildContext context) {
    final stateNotifierForBase = ref.watch(baseNotifierProvider.notifier);
    final stateNotifier = ref.watch(postFeedNotifierProvider.notifier);
    final postFeedState = ref.watch(postFeedNotifierProvider);
    final postFeedList = postFeedState.postList;


    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height - kToolbarHeight,
            child: _isStackFinished
                ? const Center(child: Text("Post Finished"),)
            : SwipeCards(
              matchEngine: _matchEngine!,
              itemBuilder: (BuildContext context, int index) {
                if (index < 0 || index >= postFeedList.length) {
                  return const SizedBox.shrink();
                }
                final postList = postFeedList[index];
                return PostFeedItem(postList: postList);
              },
              onStackFinished: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Post Finished"),
                  duration: Duration(milliseconds: 500),
                ));
                setState(() {
                  _isStackFinished = true;
                });
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
                                color: (postFeedState.selectedIndex == index)
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
