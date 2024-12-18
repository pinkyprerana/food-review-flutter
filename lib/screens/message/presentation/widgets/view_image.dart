import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../../widgets/show_video_post.dart';

class ViewImageDialog extends StatelessWidget {
  final String imageUrl;

  const ViewImageDialog({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(color: AppColors.colorPrimary),
              ),
              errorWidget: (context, url, error) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShowVideoWidget(videoUrl: imageUrl),
                    ),
                  );
                },
                child: Image.asset(Assets.playVideo),
              ),
              fit: BoxFit.contain,
            ),
          ),

          // Close Button
          Positioned(
            top: 40.0,
            right: 16.0,
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 10, left: 20, right: 0, bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.colorPrimary.withOpacity(0.20),
              ),
              child: IconButton(
                icon: const Icon(Icons.close, color: AppColors.colorWhite),
                onPressed: () {
                  Navigator.pop(context);
                },
                tooltip: 'Close',
                splashRadius: 20.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}