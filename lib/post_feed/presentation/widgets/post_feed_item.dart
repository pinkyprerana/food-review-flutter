import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/post_feed/presentation/widgets/expanded_post_details.dart';
import 'package:for_the_table/post_feed/presentation/widgets/not_epanded_post_details.dart';
import 'package:for_the_table/post_feed/shared/provider.dart';

class PostFeedItem extends ConsumerWidget {
  const PostFeedItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(postFeedProvider);
    final stateNotifier = ref.watch(postFeedProvider.notifier);
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
                ? const ExpandedPostDetails()
                : const NotEpandedPostDetails(),
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
      // child: Text(
      //   _swipeItems[index].content.text,
      //   style: const TextStyle(fontSize: 100),
      // ),
    );
  }
}
