import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/screens/home/shared/provider.dart';
import 'package:for_the_table/widgets/custom_icon.dart';
import 'package:swipe_cards/swipe_cards.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final List<String> buttonTexts = ['For The Table', 'Following'];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final stateNotifier = ref.read(homeNotifierProvider.notifier);
      await stateNotifier.getPostFeed();
    });
  }

  @override
  Widget build(BuildContext context) {
    final stateNotifier = ref.watch(homeNotifierProvider.notifier);
    final state = ref.watch(homeNotifierProvider);

    return Scaffold(
      body: state.isLoading || stateNotifier.matchEngine == null
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColors.colorPrimary,
              ),
            )
          : Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height - kToolbarHeight,
                  width: MediaQuery.of(context).size.width,
                  child: state.selectedIndex == 0
                      ? state.isAllPostStackFinished
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                            )
                          : SwipeCards(
                              matchEngine: stateNotifier.matchEngine ?? MatchEngine(),
                              itemBuilder: (BuildContext context, int index) {
                                if ((state.postList?.length ?? 0) == 0) {
                                  return const Center(
                                    child: CircularProgressIndicator(color: AppColors.colorPrimary),
                                  );
                                }

                                return stateNotifier.swipeItems[index].content;
                              },
                              onStackFinished: () async {
                                // currently, this function is not working. the last empty page
                                // is triggered from itemChanged()
                                if (state.allSwipeItems.isEmpty) {
                                  ref.read(homeNotifierProvider.notifier).emptyAllPosts();
                                }
                                //else {
                                //   stateNotifier.matchEngine =
                                //       MatchEngine(swipeItems: [...state.allSwipeItems]);
                                // }
                              },
                              itemChanged: (SwipeItem item, int index) {
                                if (state.allSwipeItems.length == 2) {
                                  stateNotifier.emptyAllPosts();
                                } else if (state.allSwipeItems.length == 8) {
                                  stateNotifier.loadMorePostFeed();
                                }
                              },
                              upSwipeAllowed: true,
                              fillSpace: true,
                            )
                      : state.isFollowingPostStackFinished
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                            )
                          : SwipeCards(
                              matchEngine: stateNotifier.matchEngineFollowing ?? MatchEngine(),
                              itemBuilder: (BuildContext context, int index) {
                                if ((state.postList?.length ?? 0) == 0) {
                                  return const Center(
                                    child: CircularProgressIndicator(color: AppColors.colorPrimary),
                                  );
                                }

                                return stateNotifier.swipeItemsFollowing[index].content;
                              },
                              onStackFinished: () async {
                                if (state.followingSwipeItems.isEmpty) {
                                  stateNotifier.emptyFollowingPosts();
                                }
                                // else {
                                //   stateNotifier.matchEngine =
                                //       MatchEngine(swipeItems: [...state.followingSwipeItems]);
                                // }
                                // ref.read(homeNotifierProvider.notifier).stackEmptyStatus();

                                // stateNotifier.matchEngineFollowing = MatchEngine(
                                //   swipeItems: [...state.followingSwipeItems],
                                // );
                              },
                              itemChanged: (SwipeItem item, int index) {
                                if (state.followingSwipeItems.length == 2) {
                                  stateNotifier.emptyFollowingPosts();
                                } else if (state.followingSwipeItems.length == 8) {
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
                                    if (state.selectedIndex == 0) {
                                      return;
                                    }
                                    final stateNotifier = ref.read(homeNotifierProvider.notifier);
                                    await stateNotifier.getPostFeed();
                                  }
                                  if (index == 1) {
                                    if (state.selectedIndex == 1) {
                                      return;
                                    }
                                    final stateNotifier = ref.read(homeNotifierProvider.notifier);
                                    await stateNotifier.getFollowingPostFeed();
                                  }
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 5),
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(horizontal: 15).r,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: state.selectedIndex == 0
                                        ? (state.isAllPostStackFinished
                                            ? AppColors.colorPrimary.withOpacity(0.4)
                                            : AppColors.colorWhite.withOpacity(0.5))
                                        : (state.isFollowingPostStackFinished
                                            ? AppColors.colorPrimary.withOpacity(0.4)
                                            : AppColors.colorWhite.withOpacity(0.5)),
                                    border: Border.all(
                                      color: state.selectedIndex == index
                                          ? (state.selectedIndex == 0
                                              ? (state.isAllPostStackFinished
                                                  ? AppColors.colorPrimary.withOpacity(0.4)
                                                  : AppColors.colorWhite.withOpacity(0.5))
                                              : (state.isFollowingPostStackFinished
                                                  ? AppColors.colorPrimary.withOpacity(0.4)
                                                  : AppColors.colorWhite.withOpacity(0.5)))
                                          : Colors.transparent, // No border for unselected tabs
                                      width: state.selectedIndex == index
                                          ? 2
                                          : 0, // Border width only for selected tab
                                    ),
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
