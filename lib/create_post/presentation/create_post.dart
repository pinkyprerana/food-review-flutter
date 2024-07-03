import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/utils/toast.dart';

import '../../core/constants/assets.dart';
import '../../core/styles/app_colors.dart';
import '../../core/styles/app_text_styles.dart';
import '../../restaurant/shared/provider.dart';
import '../../widgets/app_button.dart';
import '../../widgets/custom_input_field.dart';
import '../shared/provider.dart';

@RoutePage()
class CreatePostPage extends ConsumerStatefulWidget {
  final XFile? imageFile;
  CreatePostPage({super.key, this.imageFile});

  @override
  ConsumerState<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends ConsumerState<CreatePostPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final stateNotifier = ref.read(restaurantNotifierProvider.notifier);
      await stateNotifier.getRestaurants(context: context);
    });

  }

  @override
  Widget build(BuildContext context) {
    final createPostNotifier = ref.read(CreatePostNotifierProvider.notifier);
    final pageController = createPostNotifier.pageController;
    var currentPage = ref.watch(CreatePostNotifierProvider).currentPage;
    final imageFile = widget.imageFile;
    final restaurantList =ref.watch(restaurantNotifierProvider).restaurantList;
    String selectedRestaurantName = "";
    String selectedRestaurantAddress = "";

    List<DropdownMenuItem<String>>? dropdownItems = restaurantList
        ?.map((restaurant) => restaurant.name != null ? DropdownMenuItem<String>(
      value: restaurant.id!,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(restaurant.name!, style: AppTextStyles.textStylePoppinsLight.copyWith(color: AppColors.colorBlack,),),
            // selectedRestaurantName.isNotEmpty ?
            // Visibility(
            //   child:
              Row(
                children: [
                  Icon(Icons.location_on_outlined, color:  AppColors.colorBlack, size: 10.h,),
                  Text(restaurant.address!, style: AppTextStyles.textStylePoppinsRegular.copyWith(color: AppColors.colorPrimaryAlpha,),)
                ],
              ),
            // )
            //     : const SizedBox()
          ],
        ),
      ),
          )
        : null)
        .toList()
        .where((item) => item != null).cast<DropdownMenuItem<String>>()
        .toList();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            if (currentPage == 0) {
              if(imageFile != null)
               {
                 Navigator.pop(context, null);
               }else {
                Navigator.pop(context);
              }
            } else {
              createPostNotifier.pageController.jumpToPage(0);
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
      body: SingleChildScrollView(
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
                      ///Select photo from gallery
                      // Column(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     Padding(
                      //       padding: const EdgeInsets.all(10.0),
                      //       child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           Text(
                      //             'Select',
                      //             style: AppTextStyles.textStylePoppinsMedium
                      //                 .copyWith(fontSize: 14.sp, color: AppColors.colorBlack),
                      //           ),
                      //           ElevatedButton(
                      //             style: ButtonStyle(elevation: WidgetStateProperty.all<double>(0),),
                      //             onPressed: _pickAssets,
                      //             child: Row(
                      //               children: [
                      //                 Text( 'Photos',
                      //                   style: AppTextStyles.textStylePoppins
                      //                       .copyWith(fontSize: 14.sp, color: AppColors.colorRed),
                      //                 ),
                      //                 const Icon(Icons.keyboard_arrow_down, color: AppColors.colorRed),
                      //               ],
                      //             ),
                      //           )
                      //         ],
                      //       ),
                      //     ),
                      //
                      //     //Todo: Show gallery images which is showing in _pickAssets
                      //     Expanded(
                      //       child: _selectedAssets != null && _selectedAssets!.isNotEmpty
                      //           ? GridView.builder(
                      //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      //           crossAxisCount: 3,
                      //           mainAxisSpacing: 4.0,
                      //           crossAxisSpacing: 4.0,
                      //         ),
                      //         itemCount: _selectedAssets!.length,
                      //         itemBuilder: (context, index) {
                      //           final asset = _selectedAssets![index];
                      //           return GestureDetector(
                      //             onTap: () {
                      //               toggleSelection(asset);
                      //             },
                      //             child: Stack(
                      //               children: [
                      //                 Image(
                      //                   image: AssetEntityImageProvider(
                      //                     asset,
                      //                     isOriginal: false,
                      //                     // thumbnailSize: const ThumbnailSize(200, 200),
                      //                   ),
                      //                   fit: BoxFit.cover,
                      //                 ),
                      //                 if (isSelected(asset))
                      //                   const Positioned(
                      //                     bottom: 8,
                      //                     right: 8,
                      //                     child: Icon(
                      //                       Icons.check_circle,
                      //                       color: Colors.green,
                      //                     ),
                      //                   ),
                      //               ],
                      //             ),
                      //           );
                      //         },
                      //       )
                      //           : const Center(child: Text('No images')),
                      //     ),
                      //   ],
                      // ),

                      /// Create post description
                      Padding(
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
                                      .copyWith(
                                          fontSize: 14.sp,
                                          color: AppColors.colorBlack),
                                ),
                              ),
                              const SizedBox(height: 20),
                              CustomInputField(
                                controller: createPostNotifier.postTitleTextController,
                                label: 'Post Title',
                                hint: 'Enter post title',
                              ),
                              20.verticalSpace,
                              TextField(
                                maxLines: 5,
                                controller: createPostNotifier.postDescriptionTextController,
                                decoration: InputDecoration(
                                  labelText: 'Post Description',
                                  hintText: 'Enter post description',
                                  labelStyle: AppTextStyles
                                      .textStylePoppinsMedium
                                      .copyWith(
                                    color: AppColors.colorBlack,
                                    fontSize: 14.sp,
                                  ),
                                  hintStyle: AppTextStyles
                                      .textStylePoppinsRegular
                                      .copyWith(
                                    color: AppColors.colorPrimaryAlpha,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 1,
                                          color: AppColors.colorBlack),
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 0,
                                          color: AppColors.colorBlack),
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                ),
                              ),
                              20.verticalSpace
                            ],
                          ),
                        ),
                      ),

                      /// Select restaurant
                      Padding(
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
                                        .copyWith(
                                            fontSize: 14.sp,
                                            color: AppColors.colorBlack),
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
                                      .copyWith(
                                          fontSize: 12.sp,
                                          color: AppColors.colorBlack),
                                ),
                              ),
                              10.verticalSpace,
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  createPostNotifier.postDescriptionTextController.text,
                                  // "Lorem ipsum dolor sit amet consectetur. Turpis ipsum ut eu vestibulum sit. Vitae pulvinar nullam lorem posuere. Commodo nisl suspendisse tincidunt dignissim fames augue metus est. Volutpat risus tristique sed lobortis volutpat dignissim donec. Aliquet.",
                                  style: AppTextStyles.textStylePoppinsLight
                                      .copyWith(
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
                                      .copyWith(
                                          fontSize: 12.sp,
                                          color: AppColors.colorBlack),
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
                                child: DropdownButtonFormField<String>(
                                  dropdownColor: AppColors.colorGrey,
                                  decoration: InputDecoration(
                                    isDense: true, // Reduce vertical space
                                    hintText: "Select Restaurant",
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
                                  items: dropdownItems,
                                  onChanged: (String? selectedValue) {
                                    if (selectedValue != null) {
                                      final selectedRestaurant = restaurantList?.firstWhere(
                                              (restaurant) => restaurant.id == selectedValue);
                                      if (selectedRestaurant != null) {
                                        selectedRestaurantName = selectedRestaurant.name!;
                                        selectedRestaurantAddress = selectedRestaurant.address!;
                                        createPostNotifier.restaurantIdTextController.text = selectedValue;
                                      }
                                    }
                                    createPostNotifier.restaurantAddressTextController.text = selectedRestaurantAddress;
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16)
                                        .r,
                                decoration: BoxDecoration(
                                    color: AppColors.colorGrey,
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: createPostNotifier.restaurantAddressTextController,
                                  // focusNode: ,
                                  // maxLength: ,
                                  decoration: InputDecoration(
                                    counterText: '',
                                    hintText: 'Location',
                                    hintStyle: AppTextStyles
                                        .textStylePoppinsRegular
                                        .copyWith(
                                      color: AppColors.colorPrimaryAlpha,
                                    ),
                                    border: InputBorder.none,
                                    // focusedBorder: OutlineInputBorder(
                                    //   borderRadius: BorderRadius.circular(10),
                                    //   borderSide: const BorderSide(color: AppColors.colorPrimary),
                                    // ),
                                  ),
                                  keyboardType: TextInputType.text,
                                  style: AppTextStyles.textStylePoppinsRegular
                                      .copyWith(fontSize: 13.sp),
                                ),
                              ),
                              15.verticalSpace,
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Cuisine Details",
                                  style: AppTextStyles.textStylePoppinsMedium
                                      .copyWith(
                                          fontSize: 12.sp,
                                          color: AppColors.colorBlack),
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
                                    hintStyle: AppTextStyles
                                        .textStylePoppinsRegular
                                        .copyWith(
                                      color: AppColors.colorPrimaryAlpha,
                                    ),
                                    focusedBorder: InputBorder.none,
                                    border: InputBorder.none,
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                  ),
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down,
                                    color: AppColors.colorGrey3,
                                  ),
                                  items: <String>[
                                    'Cuisine 1',
                                    'Cuisine 2',
                                    'Cuisine 3'
                                  ].map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (_) {},
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
                                        .copyWith(
                                            fontSize: 10.sp,
                                            color: AppColors.colorPrimaryAlpha),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  TextButton.icon(
                                    onPressed: () {},
                                    label: Text(
                                      'Liked it',
                                      style: AppTextStyles.textStylePoppins
                                          .copyWith(
                                              fontSize: 12.sp,
                                              color:
                                                  AppColors.colorPrimaryAlpha),
                                    ),
                                    icon: Image.asset(
                                      Assets.likedIt,
                                      height: 20,
                                      width: 20,
                                    ),
                                  ),
                                  TextButton.icon(
                                    onPressed: () {},
                                    label: Text(
                                      'Fine',
                                      style: AppTextStyles.textStylePoppins
                                          .copyWith(
                                              fontSize: 12.sp,
                                              color:
                                                  AppColors.colorPrimaryAlpha),
                                    ),
                                    icon: Image.asset(
                                      Assets.fine,
                                      height: 20,
                                      width: 20,
                                    ),
                                  ),
                                  TextButton.icon(
                                    onPressed: () {},
                                    label: Text(
                                      'Didn\'t Like',
                                      style: AppTextStyles.textStylePoppins
                                          .copyWith(
                                              fontSize: 12.sp,
                                              color:
                                                  AppColors.colorPrimaryAlpha),
                                    ),
                                    icon: Image.asset(
                                      Assets.didnotLike,
                                      height: 20,
                                      width: 20,
                                    ),
                                  ),
                                ],
                              ),
                              20.verticalSpace
                            ],
                          ),
                        ),
                      ),
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
                              width: MediaQuery.of(context).size.width * 0.73,
                              text: "Post",
                              onPressed: () {
                                createPostNotifier.addPost(() {
                                  createPostNotifier.onContinuePressed(context);
                                }, imageFile);
                              },
                            ),
                            AppButton(
                              color: AppColors.colorPrimaryAlpha,
                              width: MediaQuery.of(context).size.width * 0.13,
                              onPressed: () {
                                createPostNotifier.resetPage();
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
                          text: "Continue",
                          onPressed: () {
                            if(createPostNotifier.postTitleTextController.text.isNotEmpty
                            && createPostNotifier.postDescriptionTextController.text.isNotEmpty ){
                              createPostNotifier.onContinuePressed(context);
                            }else{
                              showToastMessage("Post title and description are required");
                            }
                          }
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
