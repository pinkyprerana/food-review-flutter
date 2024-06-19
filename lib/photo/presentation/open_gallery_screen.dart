import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  PageController _pageController = PageController();
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
      if (nextPage != 0 || _currentPage == 0) {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset(Assets.backArrowButton),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Create Post',
          style: AppTextStyles.textStylePoppinsSemiBold
              .copyWith(fontSize: 15.sp, color: AppColors.colorBlack),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
                ),
                height: MediaQuery.of(context).size.height * 0.38,
                width:MediaQuery.of(context).size.width,
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
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
                    controller: _pageController,
                    children: [
                      ///Select photo from gallery
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Select',
                                  style: AppTextStyles.textStylePoppins
                                      .copyWith(fontSize: 14.sp, color: AppColors.colorBlack),
                                ),
                                ElevatedButton(
                                  // style: ButtonStyle(elevation: 0),
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
                                        Positioned(
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
                                : const Center(child: Text('No images selected.')),
                          ),

                          // Expanded(
                          //   child: _selectedAssets != null && _selectedAssets!.isNotEmpty
                          //       ? GridView.builder(
                          //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          //       crossAxisCount: 3,
                          //       mainAxisSpacing: 4.0,
                          //       crossAxisSpacing: 4.0,
                          //     ),
                          //     itemCount: _selectedAssets!.length,
                          //     itemBuilder: (context, index) {
                          //       return Image(
                          //         image: AssetEntityImageProvider(
                          //           _selectedAssets![index],
                          //           isOriginal: false,
                          //           // thumbnailSize: const ThumbnailSize(200, 200),
                          //         ),
                          //         fit: BoxFit.cover,
                          //       );
                          //     },
                          //   )
                          //       : const Center(child: Text('No images selected.')),
                          // ),
                        ],
                      ),

                      /// Create post description
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Posts',
                                style: AppTextStyles.textStylePoppins
                                    .copyWith(fontSize: 14.sp, color: AppColors.colorBlack),
                              ),),
                                const SizedBox(height: 20),
                                const CustomInputField(
                                label: 'Post Title',
                                hint: 'Enter post title',
                                ),
                                SizedBox(height: 20),
                                TextField(
                                  maxLines: 5,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Post Description',
                                      hintText:'Lorem ipsum dolor sit amet consectetur. Convallis vulputate a ut pretium augue sagittis parturient. Erat tortor ut risus neque pellentesque. \n #artist #traveller'
                                  ),
                                ),
                                Spacer(),
                          ],
                        ),
                      ),

                      /// Select restaurant
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: SingleChildScrollView(
                          physics: AlwaysScrollableScrollPhysics(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Post details',
                                    style: AppTextStyles.textStylePoppins
                                        .copyWith(fontSize: 14.sp, color: AppColors.colorBlack),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text("Lorem ipsum is a dummy title",
                                style: AppTextStyles.textStylePoppins
                                    .copyWith(fontSize: 14.sp, color: AppColors.colorBlack),
                              ),
                              SizedBox(height: 10,),
                              Text("Lorem ipsum dolor sit amet consectetur. Turpis ipsum ut eu vestibulum sit. Vitae pulvinar nullam lorem posuere. Commodo nisl suspendisse tincidunt dignissim fames augue metus est. Volutpat risus tristique sed lobortis volutpat dignissim donec. Aliquet.",
                                style: AppTextStyles.textStylePoppins
                                    .copyWith(fontSize: 14.sp, color: AppColors.colorBlack2),
                              ),
                              SizedBox(height: 20),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Select Restaurant',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              SizedBox(height: 10),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Location',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              SizedBox(height: 20),
                              DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  labelText: 'Select Cuisine',
                                  border: OutlineInputBorder(),
                                ),
                                items: <String>['Cuisine 1', 'Cuisine 2', 'Cuisine 3'].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (_) {},
                              ),
                              SizedBox(height: 20),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'How Was It?',
                                  style: AppTextStyles.textStylePoppins
                                      .copyWith(fontSize: 12.sp, color: AppColors.colorBlack2),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.ac_unit),
                                      Text('Liked it'),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.ac_unit),
                                      Text('Fine'),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.ac_unit),
                                      Text('Didn\'t Like'),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                Padding(
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
