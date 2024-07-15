import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/utils/toast.dart';
import 'package:for_the_table/onboarding/shared/provider.dart';
import 'package:for_the_table/post_feed/shared/provider.dart';
import '../../core/constants/assets.dart';
import '../../core/styles/app_colors.dart';
import '../../core/styles/app_text_styles.dart';
import '../../core/utils/common_util.dart';
import '../../model/restaurant/restaurantlist_response_model.dart';
import '../../restaurant/shared/provider.dart';
import '../../widgets/app_button.dart';
import '../../widgets/custom_input_field.dart';
import '../shared/provider.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

@RoutePage()
class CreatePostPage extends ConsumerStatefulWidget {
  final XFile? imageFile;
  CreatePostPage({super.key, this.imageFile});

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
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final stateNotifier = ref.read(restaurantNotifierProvider.notifier);
      await stateNotifier.getRestaurants(context: context);
      final preferenceNotifier = ref.watch(preferenceNotifierProvider.notifier);
      await preferenceNotifier.getAllPreference();
      final allPreferences = ref.watch(preferenceNotifierProvider).data;
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.read(CreatePostNotifierProvider);
    final createPostNotifier = ref.read(CreatePostNotifierProvider.notifier);
    final pageController = createPostNotifier.pageController;
    var currentPage = ref.watch(CreatePostNotifierProvider).currentPage;
    final imageFile = widget.imageFile;
    final allPreferences = ref.watch(preferenceNotifierProvider).data;
    final postFeedNotifier = ref.watch(postFeedNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            if (currentPage == 0) {
              if (imageFile != null) {
                Navigator.pop(context, null);
              } else {
                Navigator.pop(context);
              }
            } else {
              createPostNotifier.pageController.jumpToPage(0);
              createPostNotifier.clearRestaurantDetails();
            }
            createPostNotifier.resetPage();
          },
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
                5.horizontalSpace, //this is for centering the icon
                Icon(Icons.arrow_back_ios,
                    color: AppColors.colorPrimary, size: 15.h),
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
          } else {
            createPostNotifier.clearAllPostDetails();
            Navigator.pop(context);
            createPostNotifier.resetPage();
          }
        },
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              10.verticalSpace,
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(20)),
                height: MediaQuery.of(context).size.height * 0.37,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: imageFile == null
                        ? const Text('No image selected.')
                        : Image.file(
                      File(imageFile.path),
                      fit: BoxFit.fill,
                      height: double.infinity,
                      width: double.infinity,
                    ),
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
                            if (imageFile != null) {
                              createPostNotifier.addPost(() {
                                FocusManager.instance.primaryFocus
                                    ?.unfocus();
                                createPostNotifier
                                    .onContinuePressed(context);
                                postFeedNotifier.getPostFeed();
                                createPostNotifier.clearRestaurantDetails();
                              }, imageFile);
                            }else{
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
                          if (createPostNotifier
                              .postTitleTextController.text
                              .trim()
                              .isNotEmpty &&
                              createPostNotifier
                                  .postDescriptionTextController.text
                                  .trim()
                                  .isNotEmpty) {
                            createPostNotifier.onContinuePressed(context);
                          } else {
                            showToastMessage(
                                "Post title and description are required");
                          }
                        }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createPostTitleDescription() {
    final createPostNotifier = ref.read(CreatePostNotifierProvider.notifier);
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
                    borderSide:
                    const BorderSide(width: 1, color: AppColors.colorBlack),
                    borderRadius: BorderRadius.circular(15.0)),
                border: OutlineInputBorder(
                    borderSide:
                    const BorderSide(width: 0, color: AppColors.colorBlack),
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
    final createPostNotifier = ref.read(CreatePostNotifierProvider.notifier);
    final restaurantList = ref.watch(restaurantNotifierProvider).restaurantList;
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
                style: AppTextStyles.textStylePoppinsLight.copyWith(
                    fontSize: 10.sp,
                    color: AppColors.colorBlack2,
                    letterSpacing: 0),
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
            Container(
              height: 60.r,
              width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 16).r,
              decoration: BoxDecoration(
                  color: AppColors.colorGrey,
                  borderRadius: BorderRadius.circular(10)),
              child: CupertinoTypeAheadField<Restaurant>(
                controller: createPostNotifier.restaurantNameTextController,
                builder: (context, TextEditingController controller,
                    FocusNode focusNode) {
                  return TextField(
                    controller: controller,
                    focusNode: focusNode,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: "Select Restaurant",
                      hintStyle: AppTextStyles.textStylePoppinsRegular.copyWith(
                        color: AppColors.colorPrimaryAlpha,
                      ),
                      focusedBorder: InputBorder.none,
                      border: InputBorder.none,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                  );
                },
                suggestionsCallback: (pattern) {
                  return restaurantList
                      ?.where((restaurant) => restaurant.name!
                      .toLowerCase()
                      .contains(pattern.toLowerCase()))
                      .toList() ??
                      [];
                },
                itemBuilder: (context, suggestion) {
                  return ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            suggestion.name!,
                            style: AppTextStyles.textStylePoppinsLight.copyWith(
                                color: AppColors.colorBlack, fontSize: 10),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: AppColors.colorBlack,
                                size: 10.h,
                              ),
                              Text(
                                suggestion.address!.length > 40
                                    ? '${suggestion.address!.substring(0, 40)}...'
                                    : suggestion.address!,
                                style: AppTextStyles.textStylePoppinsRegular
                                    .copyWith(
                                    color: AppColors.colorPrimaryAlpha,
                                    fontSize: 10),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                onSelected: (Restaurant selection) {
                  selectedRestaurantName = selection.name!;
                  selectedRestaurantId = selection.id!;
                  createPostNotifier.restaurantNameTextController.text = selectedRestaurantName;
                  createPostNotifier.restaurantIdTextController.text = selectedRestaurantId;
                  createPostNotifier.restaurantAddressTextController.text = selection.address!;
                  dismissKeyboard(context);
                  createPostNotifier.restaurantNameTextController.text =
                      selectedRestaurantName;
                  createPostNotifier.restaurantIdTextController.text =
                      selectedRestaurantId;
                  createPostNotifier.restaurantAddressTextController.text =
                  selection.address!;
                },
              ),
            ),
            // Container(
            //   height: 60.r,
            //   width: double.infinity,
            //   alignment: Alignment.center,
            //   padding:
            //       const EdgeInsets.symmetric(horizontal: 16)
            //           .r,
            //   decoration: BoxDecoration(
            //       color: AppColors.colorGrey,
            //       borderRadius: BorderRadius.circular(10)),
            //   child: TextFormField(
            //     controller: createPostNotifier.restaurantIdTextController,
            //     // focusNode: ,
            //     // maxLength: ,
            //     decoration: InputDecoration(
            //       counterText: '',
            //       hintText: 'Select Restaurant',
            //       hintStyle: AppTextStyles
            //           .textStylePoppinsRegular
            //           .copyWith(
            //         color: AppColors.colorPrimaryAlpha,
            //       ),
            //       border: InputBorder.none,
            //       // focusedBorder: OutlineInputBorder(
            //       //   borderRadius: BorderRadius.circular(10),
            //       //   borderSide: const BorderSide(color: AppColors.colorPrimary),
            //       // ),
            //     ),
            //     keyboardType: TextInputType.text,
            //     style: AppTextStyles.textStylePoppinsRegular
            //         .copyWith(fontSize: 13.sp),
            //   ),
            // ),
            10.verticalSpace,
            Container(
              height: 60.r,
              width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 16).r,
              decoration: BoxDecoration(
                  color: AppColors.colorGrey,
                  borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                enabled: false,
                controller: createPostNotifier.restaurantAddressTextController,
                // focusNode: ,
                // maxLength: ,
                decoration: InputDecoration(
                  counterText: '',
                  hintText: 'Location',
                  hintStyle: AppTextStyles.textStylePoppinsRegular.copyWith(
                    color: createPostNotifier
                        .restaurantAddressTextController.text.isEmpty
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
                style: AppTextStyles.textStylePoppinsRegular.copyWith(
                    fontSize: 12.sp,
                    color: AppColors.colorBlack
                ),
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
                  color: AppColors.colorGrey,
                  borderRadius: BorderRadius.circular(10)),
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
                //   items: cuisineName
                //       .map((cuisine) => DropdownMenuItem<String>(
                //             value: cuisine,
                //             child: Text(
                //               cuisine,
                //               style: AppTextStyles.textStylePoppinsLight.copyWith(
                //                   color: AppColors.colorBlack, fontSize: 14),
                //             ),
                //           ))
                //       .toList(),
                //   onChanged: (value) {
                //     if (value != null) {
                //       final selectedCuisine = value;
                //       createPostNotifier.postCuisineIdTextController.text =
                //           selectedCuisine;
                //     }
                //   },
                // ),

                items: cuisineList.map((cuisine) => DropdownMenuItem<String>(
                  value: cuisine.id,
                  child: Text(
                    cuisine.title,
                    style: AppTextStyles.textStylePoppinsLight.copyWith(
                        color: AppColors.colorBlack, fontSize: 14),
                  ),
                )).toList(),
                onChanged: (String? value) {
                  if (value != null) {
                    final selectedCuisine = cuisineList.firstWhere((c) => c.id == value);
                    createPostNotifier.postCuisineIdTextController.text = selectedCuisine.id;
                  }
                },
              ),
            ),

            // Container(
            //   alignment: Alignment.center,
            //   decoration: BoxDecoration(
            //       color: AppColors.colorGrey,
            //       borderRadius: BorderRadius.circular(10)),
            //   padding: const EdgeInsets.all(16).r,
            //   height: 56.r,
            //   child: DropdownButtonHideUnderline(
            //     child: DropdownButton2<String>(
            //     items: cuisineList.map((cuisine) => DropdownMenuItem<String>(
            //           value: cuisine,
            //           child: Text(
            //             cuisine,
            //             style: AppTextStyles.textStylePoppinsLight.copyWith(color: AppColors.colorBlack,fontSize: 14),
            //           ),
            //         )).toList(),
            //       onChanged: (value) {
            //             if (value != null) {
            //               final selectedCuisine = value;
            //               createPostNotifier.postCuisineTextController.text = selectedCuisine;
            //             }
            //           },
            //     ),
            //   ),
            // ),

            20.verticalSpace,
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'How Was It?',
                  style: AppTextStyles.textStylePoppinsRegular.copyWith(
                      fontSize: 10.sp, color: AppColors.colorPrimaryAlpha),
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
                        color: createPostNotifier
                            .postHowWasItTextController.text ==
                            "like"
                            ? AppColors.colorGreen
                            : AppColors.colorPrimaryAlpha),
                  ),
                  icon: Image.asset(Assets.likedIt,
                      height: 20,
                      width: 20,
                      color:
                      createPostNotifier.postHowWasItTextController.text ==
                          "like"
                          ? AppColors.colorGreen
                          : AppColors.colorBlack),
                ),
                TextButton.icon(
                  onPressed: () => createPostNotifier.selectedReview("fine"),
                  label: Text(
                    'Fine',
                    style: AppTextStyles.textStylePoppins.copyWith(
                        fontSize: 12.sp,
                        color: createPostNotifier
                            .postHowWasItTextController.text ==
                            "fine"
                            ? AppColors.colorRatingStar
                            : AppColors.colorPrimaryAlpha),
                  ),
                  icon: Image.asset(Assets.fine,
                      height: 20,
                      width: 20,
                      color:
                      createPostNotifier.postHowWasItTextController.text ==
                          "fine"
                          ? AppColors.colorRatingStar
                          : AppColors.colorBlack),
                ),
                TextButton.icon(
                  onPressed: () =>
                      createPostNotifier.selectedReview("not_like"),
                  label: Text(
                    'Didn\'t Like',
                    style: AppTextStyles.textStylePoppins.copyWith(
                        fontSize: 12.sp,
                        color: createPostNotifier
                            .postHowWasItTextController.text ==
                            "not_like"
                            ? AppColors.colorRed
                            : AppColors.colorPrimaryAlpha),
                  ),
                  icon: Image.asset(Assets.didnotLike,
                      height: 20,
                      width: 20,
                      color:
                      createPostNotifier.postHowWasItTextController.text ==
                          "not_like"
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
