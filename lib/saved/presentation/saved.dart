import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/assets.dart';
import '../../core/styles/app_colors.dart';
import '../../core/styles/app_text_styles.dart';

@RoutePage()
class SavedPage extends ConsumerStatefulWidget {
  const SavedPage({super.key});

  @override
  ConsumerState<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends ConsumerState<SavedPage> {
  @override
  Widget build(BuildContext context) {
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
                5.horizontalSpace, //this is for centering the icon
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
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              margin: const EdgeInsets.all(2),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    imageUrls[index],
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                      top: 8,
                      right: 8,
                      child: Image.asset(
                        Assets.saved,
                        scale: 2,
                      ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  final List<String> imageUrls = [
    Assets.coverPhoto,
    Assets.photo,
    Assets.coverPhoto,
    Assets.photo,
    Assets.coverPhoto,
    Assets.photo,
    Assets.coverPhoto,
    Assets.photo,
    Assets.coverPhoto,
    Assets.photo,
    Assets.coverPhoto,
    Assets.photo,
  ];
}
