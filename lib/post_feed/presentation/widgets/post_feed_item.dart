import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/post_feed/domain/postFeed_model.dart';
import 'package:for_the_table/post_feed/presentation/widgets/expanded_post_details.dart';
import 'package:for_the_table/post_feed/presentation/widgets/not_epanded_post_details.dart';
import 'package:for_the_table/post_feed/shared/provider.dart';

import '../../../core/constants/app_urls.dart';

class PostFeedItem extends ConsumerWidget {
  final DataOfPostModel postList;
  const PostFeedItem({super.key, required this.postList});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(postFeedNotifierProvider);
    final stateNotifier = ref.watch(postFeedNotifierProvider.notifier);
    final String postImage = "${AppUrls.postImageLocation}${postList.file}";

    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(
            CachedNetworkImage(
              imageUrl: postImage,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ).imageUrl,
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
                ? ExpandedPostDetails(postList: postList,)
                : NotEpandedPostDetails(postList: postList,),
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
    );
  }
}
