import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/routes/app_router.dart';
import 'package:insta_assets_picker/insta_assets_picker.dart';
import '../../core/constants/assets.dart';
import '../../core/styles/app_colors.dart';
import '../../core/styles/app_text_styles.dart';
import '../../widgets/app_button.dart';
import '../../widgets/custom_input_field.dart';


@RoutePage()
class OpenGalleryPage extends ConsumerStatefulWidget {
  final XFile? imageFile;
  OpenGalleryPage({super.key, this.imageFile});

  @override
  ConsumerState<OpenGalleryPage> createState() => _OpenGalleryPageState();
}

class _OpenGalleryPageState extends ConsumerState<OpenGalleryPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  List<AssetEntity>? _selectedAssets;

  void toggleSelection(AssetEntity asset) {
    setState(() {
      if (_selectedAssets!.contains(asset)) {
        _selectedAssets!.remove(asset);
      } else {
        _selectedAssets!.add(asset);
      }
    });
  }

  bool isSelected(AssetEntity asset) {
    return _selectedAssets!.contains(asset);
  }

  void _onContinuePressed() {
    setState(() {
      int nextPage = (_currentPage + 1) % 3;
      if (_currentPage == 2) {
        AutoRouter.of(context).pushAndPopUntil(const LandingIntroRoute(), predicate: (_) => false);
      }else if (nextPage != 0 || _currentPage == 0) {
        _currentPage = nextPage;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  Future<void> _pickAssets() async {
    final List<AssetEntity>? result = await InstaAssetPicker.pickAssets(
      context,
      maxAssets: 10,
      pickerTheme: ThemeData.dark(),
      onCompleted: (Stream<InstaAssetsExportDetails> exportDetails) {  },
    );
    if (result != null) {
      setState(() {
        _selectedAssets = result;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _pickAssets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              20.verticalSpace,
              Row(
                children: [
                  IconButton(
                    icon: Image.asset(Assets.backArrowButton, scale: 1.5,),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  5.horizontalSpace,
                  Text(
                    'Create Post',
                    style: AppTextStyles.textStylePoppinsSemiBold
                        .copyWith(fontSize: 15.sp, color: AppColors.colorBlack),
                  ),
                ],
              ),
              5.verticalSpace,
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
                ),
                height: MediaQuery.of(context).size.height * 0.4,
                width:MediaQuery.of(context).size.width,
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: widget.imageFile == null
                        ? const Text('No image selected.')
                        : Image.file(File(widget.imageFile!.path),
                      fit: BoxFit.fill,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _pageController,
                    children: [
                      ///Select photo from gallery
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Select',
                                  style: AppTextStyles.textStylePoppinsMedium
                                      .copyWith(fontSize: 14.sp, color: AppColors.colorBlack),
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(elevation: WidgetStateProperty.all<double>(0),),
                                  onPressed: _pickAssets,
                                  child: Row(
                                    children: [
                                      Text( 'Photos',
                                        style: AppTextStyles.textStylePoppins
                                            .copyWith(fontSize: 14.sp, color: AppColors.colorRed),
                                      ),
                                      const Icon(Icons.keyboard_arrow_down, color: AppColors.colorRed),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),

                          //Todo: Show gallery images which is showing in _pickAssets
                          Expanded(
                            child: _selectedAssets != null && _selectedAssets!.isNotEmpty
                                ? GridView.builder(
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 4.0,
                                crossAxisSpacing: 4.0,
                              ),
                              itemCount: _selectedAssets!.length,
                              itemBuilder: (context, index) {
                                final asset = _selectedAssets![index];
                                return GestureDetector(
                                  onTap: () {
                                    toggleSelection(asset);
                                  },
                                  child: Stack(
                                    children: [
                                      Image(
                                        image: AssetEntityImageProvider(
                                          asset,
                                          isOriginal: false,
                                          // thumbnailSize: const ThumbnailSize(200, 200),
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                      if (isSelected(asset))
                                        const Positioned(
                                          bottom: 8,
                                          right: 8,
                                          child: Icon(
                                            Icons.check_circle,
                                            color: Colors.green,
                                          ),
                                        ),
                                    ],
                                  ),
                                );
                              },
                            )
                                : const Center(child: Text('No images')),
                          ),
                        ],
                      ),

                      /// Create post description
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                              ),),
                                const SizedBox(height: 20),
                                const CustomInputField(
                                label: 'Post Title',
                                hint: 'Enter post title',
                                ),
                                20.verticalSpace,
                                 TextField(
                                   maxLines: 5,
                                  decoration: InputDecoration(
                                    labelText: 'Post Description',
                                    // helperText: 'Lorem ipsum dolor sit amet consectetur. Convallis vulputate a ut pretium augue sagittis parturient. Erat tortor ut risus neque pellentesque. \n #artist #traveller',
                                    // hintText:'Lorem ipsum dolor sit amet consectetur. Convallis vulputate a ut pretium augue sagittis parturient. Erat tortor ut risus neque pellentesque. \n #artist #traveller',
                                    hintText: 'Enter post description',
                                    labelStyle: AppTextStyles.textStylePoppinsMedium.copyWith(
                                      color: AppColors.colorBlack,
                                      fontSize: 14.sp,
                                    ),
                                    hintStyle: AppTextStyles.textStylePoppinsRegular.copyWith(
                                      color: AppColors.colorPrimaryAlpha,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 1,
                                            color: AppColors.colorBlack
                                        ),
                                      borderRadius: BorderRadius.circular(15.0)
                                    ),
                                    border:  OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 0,
                                          color: AppColors.colorBlack
                                      ),
                                        borderRadius: BorderRadius.circular(15.0)
                                    ),
                                    floatingLabelBehavior: FloatingLabelBehavior.always,
                                ),
                              ),
                                const Spacer(),
                          ],
                        ),
                      ),

                      /// Select restaurant
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
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
                                child: Text("Lorem ipsum is a dummy title",
                                  style: AppTextStyles.textStylePoppinsMedium
                                      .copyWith(fontSize: 12.sp, color: AppColors.colorBlack),
                                ),
                              ),
                              10.verticalSpace,
                              Text("Lorem ipsum dolor sit amet consectetur. Turpis ipsum ut eu vestibulum sit. Vitae pulvinar nullam lorem posuere. Commodo nisl suspendisse tincidunt dignissim fames augue metus est. Volutpat risus tristique sed lobortis volutpat dignissim donec. Aliquet.",
                                style: AppTextStyles.textStylePoppinsLight
                                    .copyWith(fontSize: 10.sp, color: AppColors.colorBlack2, letterSpacing: 0),
                              ),
                              10.verticalSpace,
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text("Restaurant Details",
                                  style: AppTextStyles.textStylePoppinsMedium
                                      .copyWith(fontSize: 12.sp, color: AppColors.colorBlack),
                                ),
                              ),
                              10.verticalSpace,
                              const CustomInputField(
                                hint: 'Select Restaurant',
                                label: '',
                              ),
                              10.verticalSpace,
                              const CustomInputField(
                                hint: 'Location',
                                label: '',
                              ),
                              10.verticalSpace,
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text("Cuisine Details",
                                  style: AppTextStyles.textStylePoppinsMedium
                                      .copyWith(fontSize: 12.sp, color: AppColors.colorBlack),
                                ),
                              ),
                              10.verticalSpace,
                              Container(
                                decoration: BoxDecoration(
                                    color: AppColors.colorGrey, borderRadius: BorderRadius.circular(10)),
                                padding: const EdgeInsets.symmetric(horizontal: 16).r,
                                height: 55.r,
                                child: DropdownButtonFormField<String>(
                                  dropdownColor: AppColors.colorGrey,
                                  decoration: InputDecoration(
                                    hintText: "Select Cuisine",
                                    labelStyle: AppTextStyles.textStylePoppinsLight.copyWith(
                                      color: AppColors.colorPrimaryAlpha,
                                      fontSize: 11.sp,
                                    ),
                                    hintStyle: AppTextStyles.textStylePoppinsRegular.copyWith(
                                      color: AppColors.colorPrimaryAlpha,
                                    ),
                                    focusedBorder: InputBorder.none,
                                    border:  InputBorder.none,
                                    floatingLabelBehavior: FloatingLabelBehavior.always,
                                  ),
                                  icon: const Icon(Icons.keyboard_arrow_down, color: AppColors.colorGrey3,),
                                  items: <String>['Cuisine 1', 'Cuisine 2', 'Cuisine 3'].map((String value) {
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
                                        .copyWith(fontSize: 10.sp, color: AppColors.colorPrimaryAlpha),
                                  ),
                                ),
                              ),
                               Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton.icon(
                                      onPressed: (){},
                                      label: Text('Liked it',
                                        style: AppTextStyles.textStylePoppins
                                            .copyWith(fontSize: 12.sp, color:AppColors.colorPrimaryAlpha),
                                      ),
                                      icon: Image.asset(Assets.likedIt, height: 20,width: 20,),
                                  ),
                                  TextButton.icon(
                                    onPressed: (){},
                                    label: Text('Fine',
                                      style: AppTextStyles.textStylePoppins
                                          .copyWith(fontSize: 12.sp, color:AppColors.colorPrimaryAlpha),
                                    ),
                                    icon: Image.asset(Assets.fine, height: 20,width: 20,),
                                  ),
                                  TextButton.icon(
                                    onPressed: (){},
                                    label: Text('Didn\'t Like',
                                      style: AppTextStyles.textStylePoppins
                                          .copyWith(fontSize: 12.sp, color:AppColors.colorPrimaryAlpha),
                                    ),
                                    icon: Image.asset(Assets.didnotLike, height: 20,width: 20,),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),

                _currentPage == 2
                    ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppButton(
                        width: MediaQuery.of(context).size.width * 0.73,
                        text: "Post",
                        onPressed: _onContinuePressed,
                      ),
                      AppButton(
                        color: AppColors.colorPrimaryAlpha,
                        width: MediaQuery.of(context).size.width * 0.13,
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        child: Image.asset(Assets.cancel, color: AppColors.colorBackground, scale: 2,),
                      ),
                    ],
                  ),
                )
                    : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: AppButton(
                    text: "Continue",
                    onPressed: _onContinuePressed,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
