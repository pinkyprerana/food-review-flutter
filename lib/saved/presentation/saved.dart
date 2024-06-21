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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Image.asset(
                      Assets.backArrowButton,
                      scale: 1.5,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  5.horizontalSpace,
                  Text(
                    'Saved',
                    style: AppTextStyles.textStylePoppinsSemiBold.copyWith(
                      fontSize: 15.sp,
                      color: AppColors.colorBlack,
                    ),
                  ),
                ],
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
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
                              child: Image.asset(Assets.saved,scale: 2,)
                          )
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
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
