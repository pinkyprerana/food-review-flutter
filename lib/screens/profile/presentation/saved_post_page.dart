import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/screens/profile/shared/providers.dart';
import '../../../core/constants/app_urls.dart';
import '../../../core/constants/assets.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_text_styles.dart';
import '../../post_feed/shared/provider.dart';

@RoutePage()
class SavedPage extends ConsumerStatefulWidget {
  const SavedPage({super.key});

  @override
  ConsumerState<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends ConsumerState<SavedPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final savedNotifier = ref.read(profileNotifierProvider.notifier);
      await savedNotifier.getSavedList();
    });
  }

  @override
  Widget build(BuildContext context) {
  final profileState = ref.watch(profileNotifierProvider);
  final savedList = profileState.savedList;
  final postFeedState = ref.watch(postFeedNotifierProvider);
  final postFeedNotifier = ref.watch(postFeedNotifierProvider.notifier);


    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            alignment: Alignment.center,
            margin:
            const EdgeInsets.only(top: 10, left: 20, right: 0, bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.colorPrimary.withOpacity(0.20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                5.horizontalSpace,
                Icon(Icons.arrow_back_ios,
                    color: AppColors.colorPrimary, size: 15.h),
              ],
            ),
          ),
        ),
        title: Text(
          'Saved',
          style: AppTextStyles.textStylePoppinsBold.copyWith(
            color: AppColors.colorPrimary,
            fontSize: 16.sp,
          ),
        ),
      ),
      body: GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16),
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        itemCount: savedList.length,
        itemBuilder: (context, index) {
          final imageURL =  "${AppUrls.postImageLocation}${savedList[index].file}";
          final String postId= savedList[index].id;
          final isSaved = postFeedState.savedPosts[postId] ?? false;

          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              margin: const EdgeInsets.all(2),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    imageURL,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                      top: 8,
                      right: 8,
                      child: GestureDetector(
                          onTap: () async {
                            await postFeedNotifier.saveUnsavePost(() async {
                              final savedNotifier = ref.read(profileNotifierProvider.notifier);
                              await savedNotifier.getSavedList();
                            }, postId);
                          },
                          child: isSaved
                              ? Image.asset(Assets.bookmark)
                              : Image.asset(Assets.saved, scale: 2,)
                      ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
