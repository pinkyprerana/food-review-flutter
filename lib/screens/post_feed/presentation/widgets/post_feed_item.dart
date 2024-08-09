import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/utils/app_log.dart';
import 'package:for_the_table/screens/post_feed/domain/post_feed_model.dart';
import 'package:for_the_table/screens/post_feed/presentation/widgets/heart_animation_widget.dart';
import '../../../../core/constants/app_urls.dart';
import '../../shared/provider.dart';
import 'expanded_post_details.dart';
import 'not_epanded_post_details.dart';

class PostFeedItem extends ConsumerWidget {
  final DataOfPostModel? postList;
  const PostFeedItem({super.key, required this.postList});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(postFeedNotifierProvider);
    final stateNotifier = ref.watch(postFeedNotifierProvider.notifier);
    AppLog.log('state.isHeartAnimating ---- ${state.isHeartAnimating}');
    final String postImage = "${AppUrls.postImageLocation}${postList?.file}";

    return GestureDetector(
      onDoubleTap: () {
        stateNotifier.showFavourite(context);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: (postImage == '${AppUrls.postImageLocation}/')
                    ? const AssetImage(Assets.noRestaurantImage)
                    : CachedNetworkImageProvider(
                        postImage,
                      ),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0).r,
              child: Column(
                children: [
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      stateNotifier.setIsExpanded();
                    },
                    child: (state.isExpanded)
                        ? const SizedBox.shrink()
                        : const Icon(
                            Icons.expand_less,
                            color: AppColors.colorWhite,
                          ),
                  ),
                  8.verticalSpace,
                  (state.isExpanded)
                      ? ExpandedPostDetails(
                          postList: postList,
                        )
                      : NotExpandedPostDetails(
                          postList: postList,
                        ),
                  (state.isExpanded)
                      ? Column(
                          children: [
                            8.verticalSpace,
                            GestureDetector(
                              onTap: () {
                                stateNotifier.setIsExpanded();
                              },
                              child: const Icon(
                                Icons.expand_more,
                                color: AppColors.colorWhite,
                              ),
                            ),
                            8.verticalSpace,
                          ],
                        )
                      : const SizedBox.shrink(),
                  20.verticalSpace,
                ],
              ),
            ),
          ),
          Opacity(
            opacity: state.isHeartAnimating ? 1 : 0,
            child: HeartAnimationWidget(
              isAnimating: state.isHeartAnimating,
              duration: const Duration(milliseconds: 900),
              onEnd: () {
                stateNotifier.setFvoriteToFalse();
              },
              child: const Icon(
                Icons.favorite,
                size: 85,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
