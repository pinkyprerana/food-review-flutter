import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/utils/toast.dart';
import '../../../core/constants/assets.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_text_styles.dart';
import '../../../core/utils/common_util.dart';
import '../../../model/restaurant/restaurantlist_response_model.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/custom_input_field.dart';
import '../../../widgets/search_restaurant.dart';
import '../../../widgets/video_preview.dart';
import '../../onboarding/shared/provider.dart';
import '../../post_feed/shared/provider.dart';
// import '../../restaurant/shared/provider.dart';
import '../shared/provider.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';

@RoutePage()
class CreatePostPage extends ConsumerStatefulWidget {
  final XFile? file;
  const CreatePostPage({super.key, this.file});

  @override
  ConsumerState<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends ConsumerState<CreatePostPage> {
  String selectedRestaurantName = "";
  String selectedRestaurantAddress = "";
  String selectedRestaurantId = "";
  final descriptionNode = FocusNode();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      // final stateNotifier = ref.read(restaurantNotifierProvider.notifier);
      // await stateNotifier.getRestaurants();
      // final preferenceNotifier = ref.read(preferenceNotifierProvider.notifier);
      // await preferenceNotifier.getAllPreference();
      final stateNotifierForCreatePost = ref.read(createPostNotifierProvider.notifier);
      stateNotifierForCreatePost.toggleIsPressedToFalse();
      // AppLog.log(object)
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(createPostNotifierProvider);
    final createPostNotifier = ref.watch(createPostNotifierProvider.notifier);
    final pageController = createPostNotifier.pageController;
    var currentPage = ref.watch(createPostNotifierProvider).currentPage;
    final File? media = widget.file != null ? File(widget.file!.path) : null;
    bool isVideo = (media?.path.toLowerCase().endsWith('.mp4') ?? false) ||
        (media?.path.toLowerCase().endsWith('.mov') ?? false) ||
        (media?.path.toLowerCase().endsWith('.avi') ?? false);

    final allPreferences = ref.watch(preferenceNotifierProvider).data;
    final postFeedNotifier = ref.watch(postFeedNotifierProvider.notifier);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          automaticallyImplyLeading: false,
          leading: GestureDetector(
            onTap: () {
              if (currentPage == 0) {
                if (media != null) {
                  Navigator.pop(context, null);
                } else {
                  Navigator.pop(context);
                }
              } else {
                createPostNotifier.pageController.jumpToPage(0);
                createPostNotifier.clearRestaurantDetails();
              }
              FocusManager.instance.primaryFocus?.unfocus();
              createPostNotifier.resetPage();
              createPostNotifier.clearAllPostDetails();
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 10, left: 20, right: 0, bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.colorPrimary.withOpacity(0.20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  5.horizontalSpace,
                  Icon(Icons.arrow_back_ios, color: AppColors.colorPrimary, size: 15.h),
                ],
              ),
            ),
          ),
          title: Text(
            'Create Post',
            style: AppTextStyles.textStylePoppinsBold.copyWith(
              color: AppColors.colorPrimary,
              fontSize: 16.sp,
            ),
          ),
        ),
        body: PopScope(
          canPop: false,
          onPopInvoked: (didPop) {
            if (didPop) {
              createPostNotifier.pageController.jumpToPage(0);
              createPostNotifier.clearRestaurantDetails();
              createPostNotifier.resetPage();
            }
            // else {
            //   createPostNotifier.clearAllPostDetails();
            //   Navigator.pop(context);
            //   createPostNotifier.resetPage();
            // }
          },
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                10.verticalSpace,
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  height: MediaQuery.of(context).size.height * 0.37,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: media == null
                          ? const Text('No media selected.')
                          : isVideo
                          ? VideoPreviewWidget(file: media)
                          : Image.file(
                        File(media.path),
                        fit: BoxFit.fill,
                        height: double.infinity,
                        width: double.infinity,
                      ), // Display image
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.38,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: PageView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: pageController,
                        children: [
                          _createPostTitleDescription(),
                          _selectRestaurantPage(allPreferences!)
                        ],
                      ),
                    ),
                    currentPage == 1
                        ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppButton(
                            loading: state.isLoading,
                            width: MediaQuery.of(context).size.width * 0.73,
                            text: "Post",
                            onPressed: () async {
                              dismissKeyboard(context);
                              if (media != null) {
                                createPostNotifier.addPost(() {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  createPostNotifier.onContinuePressed(context);
                                  postFeedNotifier.getPostFeed();
                                  createPostNotifier.clearRestaurantDetails();
                                }, media);
                              } else {
                                showToastMessage("Click or select image");
                              }
                            },
                          ),
                          AppButton(
                            color: AppColors.colorPrimaryAlpha,
                            width: MediaQuery.of(context).size.width * 0.13,
                            onPressed: () {
                              createPostNotifier.resetPage();
                              createPostNotifier.clearAllPostDetails();
                              Navigator.pop(context);
                            },
                            child: Image.asset(
                              Assets.cancel,
                              color: AppColors.colorBackground,
                              scale: 2,
                            ),
                          ),
                        ],
                      ),
                    )
                        : Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: AppButton(
                          loading: state.isLoading,
                          text: "Continue",
                          onPressed: () {
                            dismissKeyboard(context);
                            if (createPostNotifier.postTitleTextController.text
                                .trim()
                                .isNotEmpty &&
                                createPostNotifier.postDescriptionTextController.text
                                    .trim()
                                    .isNotEmpty) {
                              createPostNotifier.onContinuePressed(context);
                            } else {
                              showToastMessage("Post title and description are required");
                            }
                          }),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _createPostTitleDescription() {
    final createPostNotifier = ref.watch(createPostNotifierProvider.notifier);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            10.verticalSpace,
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Posts',
                style: AppTextStyles.textStylePoppinsMedium
                    .copyWith(fontSize: 14.sp, color: AppColors.colorBlack),
              ),
            ),
            const SizedBox(height: 20),
            CustomInputField(
              controller: createPostNotifier.postTitleTextController,
              label: 'Post Title',
              hint: 'Enter post title',
              onFieldSubmitted: (val) {
                FocusScope.of(context).requestFocus(descriptionNode);
              },
            ),
            20.verticalSpace,
            TextField(
              maxLines: 5,
              focusNode: descriptionNode,
              controller: createPostNotifier.postDescriptionTextController,
              decoration: InputDecoration(
                labelText: 'Post Description',
                hintText: 'Enter post description',
                labelStyle: AppTextStyles.textStylePoppinsMedium.copyWith(
                  color: AppColors.colorBlack,
                  fontSize: 14.sp,
                ),
                hintStyle: AppTextStyles.textStylePoppinsRegular.copyWith(
                  color: AppColors.colorPrimaryAlpha,
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: AppColors.colorBlack),
                    borderRadius: BorderRadius.circular(15.0)),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(width: 0, color: AppColors.colorBlack),
                    borderRadius: BorderRadius.circular(15.0)),
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
            20.verticalSpace
          ],
        ),
      ),
    );
  }

  Widget _selectRestaurantPage(allPreferences) {
    final createPostNotifier = ref.watch(createPostNotifierProvider.notifier);
    // var restaurantList = ref.watch(restaurantNotifierProvider).restaurantList;
    // final restaurantState = ref.watch(restaurantNotifierProvider);
    // final restaurantNotifier = ref.watch(restaurantNotifierProvider.notifier);
    List<dynamic> cuisineList = allPreferences;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            10.verticalSpace,
            Row(
              children: [
                Text(
                  'Post details',
                  style: AppTextStyles.textStylePoppinsMedium
                      .copyWith(fontSize: 14.sp, color: AppColors.colorBlack),
                ),
              ],
            ),
            10.verticalSpace,
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                createPostNotifier.postTitleTextController.text,
                // "Lorem ipsum is a dummy title",
                style: AppTextStyles.textStylePoppinsMedium
                    .copyWith(fontSize: 12.sp, color: AppColors.colorBlack),
              ),
            ),
            10.verticalSpace,
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                createPostNotifier.postDescriptionTextController.text,
                // "Lorem ipsum dolor sit amet consectetur. Turpis ipsum ut eu vestibulum sit. Vitae pulvinar nullam lorem posuere. Commodo nisl suspendisse tincidunt dignissim fames augue metus est. Volutpat risus tristique sed lobortis volutpat dignissim donec. Aliquet.",
                style: AppTextStyles.textStylePoppinsLight
                    .copyWith(fontSize: 10.sp, color: AppColors.colorBlack2, letterSpacing: 0),
              ),
            ),
            20.verticalSpace,
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Restaurant Details",
                style: AppTextStyles.textStylePoppinsMedium
                    .copyWith(fontSize: 12.sp, color: AppColors.colorBlack),
              ),
            ),
            10.verticalSpace,
            // Container(
            //   height: 60.r,
            //   width: double.infinity,
            //   alignment: Alignment.center,
            //   padding: const EdgeInsets.symmetric(horizontal: 16).r,
            //   decoration: BoxDecoration(
            //       color: AppColors.colorGrey, borderRadius: BorderRadius.circular(10)),
            //   child: SmartRefresher(
            //     controller: restaurantNotifier.restaurantRefreshController,
            //     enablePullUp: true,
            //     enablePullDown: false,
            //     onRefresh: () async {
            //       await restaurantNotifier.loadMoreRestaurants(context, ref);
            //       await restaurantNotifier.getRestaurants(ref: ref);
            //       setState(() {
            //         restaurantList = ref.watch(restaurantNotifierProvider).restaurantList;
            //       });
            //       restaurantNotifier.restaurantRefreshController.refreshCompleted();
            //     },
            //     onLoading: () async {
            //       await restaurantNotifier.loadMoreRestaurants(context, ref);
            //       setState(() {
            //         restaurantList = ref.watch(restaurantNotifierProvider).restaurantList;
            //       });
            //       restaurantNotifier.restaurantRefreshController.loadComplete();
            //     },
            //     footer: CustomFooter(
            //       builder: (BuildContext context, mode) {
            //         if (!restaurantState.isMoreDataFetchable) {
            //           mode = LoadStatus.noMore;
            //         }
            //         Widget body;
            //         if (mode == LoadStatus.idle) {
            //           body = const SizedBox.shrink();
            //         } else if (mode == LoadStatus.loading) {
            //           body = const CupertinoActivityIndicator();
            //         } else if (mode == LoadStatus.failed) {
            //           body = Text(
            //             "Load Failed!Click retry!",
            //             style: AppTextStyles.textStylePoppinsLight,
            //           );
            //         } else if (mode == LoadStatus.canLoading) {
            //           body = Text(
            //             "release to load more",
            //             style: AppTextStyles.textStylePoppinsLight,
            //           );
            //         } else {
            //           body = Text(
            //             "No more Data",
            //             style: AppTextStyles.textStylePoppinsLight,
            //           );
            //         }
            //         return SizedBox(
            //           height: 55.0,
            //           child: Center(child: body),
            //         );
            //       },
            //     ),
            //     child: CupertinoTypeAheadField<Restaurant>(
            //       hideWithKeyboard: false,
            //       controller: createPostNotifier.restaurantNameTextController,
            //       builder: (context, TextEditingController controller, FocusNode focusNode) {
            //         return TextField(
            //           controller: controller,
            //           focusNode: focusNode,
            //           autofocus: true,
            //           decoration: InputDecoration(
            //             hintText: "Select Restaurant",
            //             hintStyle: AppTextStyles.textStylePoppinsRegular.copyWith(
            //               color: AppColors.colorPrimaryAlpha,
            //             ),
            //             focusedBorder: InputBorder.none,
            //             border: InputBorder.none,
            //             floatingLabelBehavior: FloatingLabelBehavior.always,
            //           ),
            //         );
            //       },
            //       suggestionsCallback: (pattern) {
            //         return restaurantList
            //                 ?.where((restaurant) =>
            //                     restaurant.name!.toLowerCase().contains(pattern.toLowerCase()))
            //                 .toList() ??
            //             [];
            //       },
            //       itemBuilder: (context, suggestion) {
            //         return ListTile(
            //           title: Padding(
            //             padding: const EdgeInsets.only(bottom: 8.0),
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Text(
            //                   suggestion.name!,
            //                   style: AppTextStyles.textStylePoppinsLight
            //                       .copyWith(color: AppColors.colorBlack, fontSize: 10),
            //                 ),
            //                 Row(
            //                   mainAxisAlignment: MainAxisAlignment.start,
            //                   children: [
            //                     Icon(
            //                       Icons.location_on_outlined,
            //                       color: AppColors.colorBlack,
            //                       size: 10.h,
            //                     ),
            //                     Text(
            //                       suggestion.address!.length > 40
            //                           ? '${suggestion.address!.substring(0, 40)}...'
            //                           : suggestion.address ?? "",
            //                       style: AppTextStyles.textStylePoppinsRegular
            //                           .copyWith(color: AppColors.colorPrimaryAlpha, fontSize: 10),
            //                     )
            //                   ],
            //                 ),
            //               ],
            //             ),
            //           ),
            //         );
            //       },
            //       onSelected: (Restaurant selection) {
            //         selectedRestaurantName = selection.name!;
            //         selectedRestaurantId = selection.id!;
            //         createPostNotifier.restaurantNameTextController.text = selectedRestaurantName;
            //         createPostNotifier.restaurantIdTextController.text = selectedRestaurantId;
            //         createPostNotifier.restaurantAddressTextController.text = selection.address!;
            //         dismissKeyboard(context);
            //         createPostNotifier.restaurantNameTextController.text = selectedRestaurantName;
            //         createPostNotifier.restaurantIdTextController.text = selectedRestaurantId;
            //         createPostNotifier.restaurantAddressTextController.text = selection.address!;
            //         if (createPostNotifier.restaurantNameTextController.text.isEmpty) {
            //           createPostNotifier.restaurantAddressTextController.text = '';
            //         }
            //       },
            //     ),
            //   ),
            // ),
            Container(
              height: 60.r,
              width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 16).r,
              decoration: BoxDecoration(
                  color: AppColors.colorGrey, borderRadius: BorderRadius.circular(10)),
              child: GestureDetector(
                onTap: () async {
                  final selectedRestaurant = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchRestaurantPage(),
                    ),
                  );

                  if (selectedRestaurant != null) {
                    final restaurant = selectedRestaurant as Restaurant;
                    createPostNotifier.restaurantNameTextController.text = restaurant.name!;
                    createPostNotifier.restaurantIdTextController.text = restaurant.id!;
                    createPostNotifier.restaurantAddressTextController.text = restaurant.address!;
                  }
                },
                child: AbsorbPointer(
                  child: TextField(
                    controller: createPostNotifier.restaurantNameTextController,
                    decoration: InputDecoration(
                      hintText: "Select Restaurant",
                      hintStyle: AppTextStyles.textStylePoppinsRegular.copyWith(
                        color: AppColors.colorPrimaryAlpha,
                      ),
                      focusedBorder: InputBorder.none,
                      border: InputBorder.none,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                  ),
                ),
              ),
            ),
            10.verticalSpace,
            Container(
              height: 60.r,
              width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 16).r,
              decoration: BoxDecoration(
                  color: AppColors.colorGrey, borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                enabled: false,
                controller: createPostNotifier.restaurantAddressTextController,
                // focusNode: ,
                // maxLength: ,
                decoration: InputDecoration(
                  counterText: '',
                  hintText: 'Location',
                  hintStyle: AppTextStyles.textStylePoppinsRegular.copyWith(
                    color: createPostNotifier.restaurantAddressTextController.text.isEmpty
                        ? AppColors.colorPrimaryAlpha
                        : AppColors.colorBlack,
                  ),
                  border: InputBorder.none,
                  // focusedBorder: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(10),
                  //   borderSide: const BorderSide(color: AppColors.colorPrimary),
                  // ),
                ),
                keyboardType: TextInputType.text,
                style: AppTextStyles.textStylePoppinsRegular
                    .copyWith(fontSize: 12.sp, color: AppColors.colorBlack),
              ),
            ),
            15.verticalSpace,
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Cuisine Details",
                style: AppTextStyles.textStylePoppinsMedium
                    .copyWith(fontSize: 12.sp, color: AppColors.colorBlack),
              ),
            ),
            10.verticalSpace,
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColors.colorGrey, borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(16).r,
              height: 56.r,
              child: DropdownButtonFormField<String>(
                dropdownColor: AppColors.colorGrey,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: "Select Cuisine",
                  hintStyle: AppTextStyles.textStylePoppinsRegular.copyWith(
                    color: AppColors.colorPrimaryAlpha,
                  ),
                  focusedBorder: InputBorder.none,
                  border: InputBorder.none,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: AppColors.colorGrey3,
                ),
                items: cuisineList
                    .map((cuisine) => DropdownMenuItem<String>(
                  value: cuisine.id,
                  child: Text(
                    cuisine.title,
                    style: AppTextStyles.textStylePoppinsLight
                        .copyWith(color: AppColors.colorBlack, fontSize: 14),
                  ),
                ))
                    .toList(),
                onChanged: (String? value) {
                  if (value != null) {
                    final selectedCuisine = cuisineList.firstWhere((c) => c.id == value);
                    createPostNotifier.postCuisineIdTextController.text = selectedCuisine.id;
                  }
                },
              ),
            ),
            20.verticalSpace,
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'How Was It?',
                  style: AppTextStyles.textStylePoppinsRegular
                      .copyWith(fontSize: 10.sp, color: AppColors.colorPrimaryAlpha),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton.icon(
                  onPressed: () => createPostNotifier.selectedReview("like"),
                  label: Text(
                    'Liked it',
                    style: AppTextStyles.textStylePoppins.copyWith(
                        fontSize: 12.sp,
                        color: createPostNotifier.postHowWasItTextController.text == "like"
                            ? AppColors.colorGreen
                            : AppColors.colorPrimaryAlpha),
                  ),
                  icon: Image.asset(Assets.likedIt,
                      height: 20,
                      width: 20,
                      color: createPostNotifier.postHowWasItTextController.text == "like"
                          ? AppColors.colorGreen
                          : AppColors.colorBlack),
                ),
                TextButton.icon(
                  onPressed: () => createPostNotifier.selectedReview("fine"),
                  label: Text(
                    'Fine',
                    style: AppTextStyles.textStylePoppins.copyWith(
                        fontSize: 12.sp,
                        color: createPostNotifier.postHowWasItTextController.text == "fine"
                            ? AppColors.colorRatingStar
                            : AppColors.colorPrimaryAlpha),
                  ),
                  icon: Image.asset(Assets.fine,
                      height: 20,
                      width: 20,
                      color: createPostNotifier.postHowWasItTextController.text == "fine"
                          ? AppColors.colorRatingStar
                          : AppColors.colorBlack),
                ),
                TextButton.icon(
                  onPressed: () => createPostNotifier.selectedReview("not_like"),
                  label: Text(
                    'Didn\'t Like',
                    style: AppTextStyles.textStylePoppins.copyWith(
                        fontSize: 12.sp,
                        color: createPostNotifier.postHowWasItTextController.text == "not_like"
                            ? AppColors.colorRed
                            : AppColors.colorPrimaryAlpha),
                  ),
                  icon: Image.asset(Assets.didnotLike,
                      height: 20,
                      width: 20,
                      color: createPostNotifier.postHowWasItTextController.text == "not_like"
                          ? AppColors.colorRed
                          : AppColors.colorBlack),
                ),
              ],
            ),
            20.verticalSpace
          ],
        ),
      ),
    );
  }
}