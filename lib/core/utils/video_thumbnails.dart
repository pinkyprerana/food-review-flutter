// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:for_the_table/core/utils/common_util.dart';

// class VideoThumbnails extends ConsumerWidget {
//   final String videoUrl;

//   const VideoThumbnails({super.key, required this.videoUrl});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final thumbnailProvider = ref.watch(thumbnailFutureProvider(videoUrl));

//     return thumbnailProvider.when(
//         data: (data) =>
//             data == null ? const SizedBox.shrink() : Image.memory(data),
//         error: (e, s) => Text('Error$e'),
//         loading: loaderPrimaryColor);
//   }
// }
