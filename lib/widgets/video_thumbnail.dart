import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/shared/providers.dart';
import '../core/styles/app_colors.dart';

class VideoThumbnails extends ConsumerStatefulWidget {
  final String videoUrl;

  const VideoThumbnails({super.key, required this.videoUrl});

  @override
  ConsumerState<VideoThumbnails> createState() => _VideoThumbnailState();
}

class _VideoThumbnailState extends ConsumerState<VideoThumbnails> {
  @override
  Widget build(BuildContext context) {
    final thumbnailProvider = ref.watch(thumbnailFutureProvider(widget.videoUrl));

    return thumbnailProvider.when(
      data: (data) => data == null
          ? const SizedBox.shrink()
          : Image.memory(
        data,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return const Center(
            child: Text('Invalid image data'),
          );
        },
      ),
      error: (e, s) => Text('Error: $e'),
      loading: () => const Center(
        child: CircularProgressIndicator(
          color: AppColors.colorPrimary,
        ),
      ),
    );
  }
}
