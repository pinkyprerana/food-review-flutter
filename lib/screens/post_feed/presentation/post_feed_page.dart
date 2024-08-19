import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/core/utils/app_log.dart';
import 'package:swipe_cards/swipe_cards.dart';
import '../../../widgets/custom_icon.dart';
import '../shared/provider.dart';

class PostFeedPage extends ConsumerStatefulWidget {
  const PostFeedPage({super.key});

  @override
  ConsumerState<PostFeedPage> createState() => _PostFeedPageState();
}

class _PostFeedPageState extends ConsumerState<PostFeedPage> {
  List<String> buttonTexts = ['For The Table', 'Following'];
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final postFeedNotifier = ref.read(postFeedNotifierProvider.notifier);
      await postFeedNotifier.getPostFeed();
    });
  }

  @override
  Widget build(BuildContext context) {
    final stateNotifier = ref.watch(postFeedNotifierProvider.notifier);
    final postFeedState = ref.watch(postFeedNotifierProvider);
    final postFeedList = postFeedState.postList;

    return Scaffold(
      // key: _scaffoldKey,
      body: postFeedState.isLoading || stateNotifier.matchEngine == null
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColors.colorPrimary,
              ),
            )
          : Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height - kToolbarHeight,
                  child: postFeedState.isStackFinished
                      ? Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GradientIcon(
                                icon: Icons.check_circle_outline_rounded,
                                size: 100.h,
                              ),
                              Text(
                                "You're all caught up",
                                style: AppTextStyles.textStylePoppinsMedium.copyWith(
                                  fontSize: 12.sp,
                                  color: AppColors.colorGrey,
                                ),
                              ),
                              Text(
                                "You've seen all new posts !",
                                style: AppTextStyles.textStylePoppinsMedium.copyWith(
                                  fontSize: 11.sp,
                                  color: AppColors.colorPrimaryAlpha,
                                ),
                              ),
                            ],
                          ),
                        )
                      : postFeedState.selectedIndex == 0
                          ? SwipeCards(
                              matchEngine: stateNotifier.matchEngine ?? MatchEngine(),
                              itemBuilder: (BuildContext context, int index) {
                                if (index < 0 || index >= (postFeedList?.length ?? 0)) {
                                  return const SizedBox.shrink();
                                }

                                return stateNotifier.swipeItems[index].content;
                              },
                              onStackFinished: () async {
                                // ref
                                //     .read(postFeedNotifierProvider.notifier)
                                //     .stackEmptyStatus();
                                // stateNotifier.matchEngine = MatchEngine(
                                //     swipeItems: stateNotifier.swipeItems);
                                stateNotifier.count = 0;
                                // await stateNotifier.loadMorePostFeed();
                                stateNotifier.matchEngine =
                                    MatchEngine(swipeItems: [...postFeedState.swipeItems]);
                              },
                              itemChanged: (SwipeItem item, int index) {
                                stateNotifier.count++;
                                AppLog.log(
                                    '===== stateNotifier.count========= ${stateNotifier.count}');
                                AppLog.log(
                                    '===== stateNotifier.swipeItems.length========= ${postFeedState.swipeItems.length}');
                                // print('length: ${postFeedState.swipeItems.length}');

                                if (postFeedState.swipeItems.length - 1 == 5) {
                                  stateNotifier.loadMorePostFeed();
                                }
                              },
                              upSwipeAllowed: true,
                              fillSpace: true,
                            )
                          : SwipeCards(
                              matchEngine: stateNotifier.matchEngineFollowing ?? MatchEngine(),
                              itemBuilder: (BuildContext context, int index) {
                                if (index < 0 || index >= (postFeedList?.length ?? 0)) {
                                  return const SizedBox.shrink();
                                }

                                return stateNotifier.swipeItems2[index].content;
                              },
                              onStackFinished: () async {
                                // ref
                                //     .read(postFeedNotifierProvider.notifier)
                                //     .stackEmptyStatus();
                                // stateNotifier.matchEngine = MatchEngine(
                                //     swipeItems: stateNotifier.swipeItems);
                                stateNotifier.count = 0;
                                // await stateNotifier.loadMorePostFeed();
                                stateNotifier.matchEngineFollowing = MatchEngine(
                                  swipeItems: [...postFeedState.swipeItems2],
                                );
                              },
                              itemChanged: (SwipeItem item, int index) {
                                stateNotifier.count++;
                                AppLog.log(
                                    '===== stateNotifier.count========= ${stateNotifier.count}');
                                AppLog.log(
                                    '===== stateNotifier.swipeItems.length========= ${postFeedState.swipeItems.length}');
                                // print('length: ${postFeedState.swipeItems.length}');
                                if (postFeedState.swipeItems2.length == 5) {
                                  stateNotifier.loadMoreFollowingPostFeed();
                                }
                              },
                              upSwipeAllowed: true,
                              fillSpace: true,
                            ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 38.h,
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: buttonTexts.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () async {
                                  stateNotifier.selectButton(index);
                                  if (index == 0) {
                                    if (postFeedState.selectedIndex == 0) {
                                      return;
                                    }
                                    final postFeedNotifier =
                                        ref.read(postFeedNotifierProvider.notifier);
                                    await postFeedNotifier.getPostFeed();
                                  }
                                  if (index == 1) {
                                    if (postFeedState.selectedIndex == 1) {
                                      return;
                                    }
                                    final postFeedNotifier =
                                        ref.read(postFeedNotifierProvider.notifier);
                                    await postFeedNotifier.getFollowingPostFeed();
                                  }
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 5),
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(horizontal: 15).r,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: (postFeedState.selectedIndex == index)
                                        ? AppColors.colorWhite.withOpacity(0.5)
                                        : AppColors.colorWhite.withOpacity(0.10),
                                  ),
                                  child: Text(
                                    buttonTexts[index],
                                    style: AppTextStyles.textStylePoppinsSemiBold
                                        .copyWith(fontSize: 16.sp, color: AppColors.colorWhite),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
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
