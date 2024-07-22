import 'dart:ui';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/routes/app_router.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/widgets/save_button.dart';
import 'package:glassmorphism/glassmorphism.dart';
import '../../../../core/constants/app_urls.dart';
import '../../../post_feed/domain/postFeed_model.dart';
import '../../../post_feed/shared/provider.dart';
import '../../../profile/shared/providers.dart';

class PostWidget extends ConsumerStatefulWidget {
  final DataOfPostModel postList;
  final bool isSaving;

  const PostWidget({
    super.key,
    required this.postList,
    required this.isSaving,
  });

  @override
  ConsumerState<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends ConsumerState<PostWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final profileNotifier = ref.read(profileNotifierProvider.notifier);
      await profileNotifier.getSavedList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final String peopleId = widget.postList.userInfo.id;
    final String name = widget.postList.userInfo.fullName;
    final String profileImage =
        "${AppUrls.profilePicLocation}/${widget.postList.userInfo.profileImage}";
    final String postImage = "${AppUrls.postImageLocation}${widget.postList.file}";
    final String title = widget.postList.title;
    final String description = widget.postList.description;
    final String restaurantName = widget.postList.restaurantInfo.name;
    final String address = widget.postList.restaurantInfo.address;
    final String cuisine = widget.postList.preferenceInfo?.title ?? "No cuisine";
    final int commentCount = widget.postList.commentCount;
    double latitude = widget.postList.geoLoc.coordinates[0];
    double longitude = widget.postList.geoLoc.coordinates[1];
    final String postId = widget.postList.id;
    final bool isSaved = widget.postList.isSave;
    final bool isLiked = widget.postList.isMyLike;
    final postFeedState = ref.watch(postFeedNotifierProvider);
    final postFeedNotifier = ref.watch(postFeedNotifierProvider.notifier);


    return Container(
      margin: const EdgeInsets.only(bottom: 10).r,
      width: double.infinity,
      // height: mediaQuery.height * 0.45,
      // height: 295.h,
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
            //const Spacer(),
            80.verticalSpace,
            GlassmorphicContainer(
              width: double.infinity,
              height: 170.h,
              borderRadius: 10,
              linearGradient: LinearGradient(
                colors: [
                  const Color(0xff0A0A0A).withOpacity(0.1),
                  const Color(0xff000000).withOpacity(0)
                ],
              ),
              border: 1,
              blur: 5,
              borderGradient: const LinearGradient(colors: [
                Colors.transparent,
                Colors.transparent,
              ]),
              child: Padding(
                padding: const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10).r,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        AutoRouter.of(context).push(PeopleProfileRoute(
                            peoplename: name, //'Ahmad Gouse', //widget.postList.name,
                            peopleimage: profileImage,
                            peopleId: peopleId,
                            isFollow: true
                            // 'assets/images/temp/follower-sample2.png',
                            ));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 20.w,
                            height: 20.h,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    profileImage,
                                  ),
                                  // image: AssetImage(
                                  //   Assets.follow1,
                                  // ),
                                  fit: BoxFit.cover,
                                )),
                          ),
                          8.horizontalSpace,
                          Text(
                            name, //'Ahmad Gouse',
                            style: AppTextStyles.textStylePoppinsMedium
                                .copyWith(fontSize: 16.sp, color: AppColors.colorWhite),
                          ),
                          8.horizontalSpace,
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(70),
                              color: AppColors.colorWhite.withOpacity(0.20),
                            ),
                            child: Center(
                              child: Text(
                                'Following',
                                style: AppTextStyles.textStylePoppinsRegular.copyWith(
                                  color: AppColors.colorWhite,
                                  fontSize: 10.sp,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            5.verticalSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(70),
                                    color: AppColors.colorGreen,
                                  ),
                                  child: Center(
                                    child: Text(
                                      cuisine, //'Chinese Cuisine',
                                      style: AppTextStyles.textStylePoppinsRegular.copyWith(
                                        color: AppColors.colorWhite,
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                  ),
                                ),
                                13.horizontalSpace,
                              ],
                            ),
                            8.verticalSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  Assets.location2,
                                ),
                                8.horizontalSpace,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      restaurantName, //'Starbucks LA, California',
                                      style: AppTextStyles.textStylePoppinsMedium.copyWith(
                                        fontSize: 13.sp,
                                        color: AppColors.colorWhite,
                                      ),
                                    ),
                                    Text(
                                      address.length > 40
                                          ? '${address.substring(0, 40)}...'
                                          : address,
                                      //'Double road, Lorem City, LA',
                                      style: AppTextStyles.textStylePoppinsRegular.copyWith(
                                        fontSize: 10.sp,
                                        color: AppColors.colorWhite,
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
                            GestureDetector(
                              onTap: ()=> postFeedNotifier.likeUnlikePost((){}, postId),
                                child: isLiked
                                    ? const Icon(Icons.favorite, color: Colors.red, size:  20,)
                                    : Image.asset(Assets.like)
                            ),
                            15.verticalSpace,
                            Column(
                              children: [
                                Image.asset(Assets.comments),
                                Text(
                                  commentCount.toString(), //'00',
                                  style: AppTextStyles.textStylePoppinsRegular.copyWith(
                                    color: AppColors.colorWhite,
                                    fontSize: 10.sp,
                                  ),
                                )
                              ],
                            ),
                            10.verticalSpace,
                            GestureDetector(
                              onTap: () => postFeedNotifier.saveUnsavePost(() {}, postId),
                              child: SaveButtonWidget(
                                isSavePost: postFeedState.isSavePost,
                                isSaved: isSaved,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    10.verticalSpace,
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        description, //'A memorable evening to be remembered.',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.textStylePoppinsMedium.copyWith(
                          fontSize: 12.sp,
                          color: AppColors.colorWhite,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
