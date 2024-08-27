import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

import '../core/styles/app_colors.dart';

class ShowVideoWidget extends ConsumerStatefulWidget {
  final String videoUrl;

  const ShowVideoWidget({super.key, required this.videoUrl});

  @override
  ConsumerState createState() => _ShowVideoWidgetState();
}

class _ShowVideoWidgetState extends ConsumerState<ShowVideoWidget> {
  late VideoPlayerController _controller;
  bool _isVideoLoaded = false;
  bool _isError = false;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  Future<void> _initializeVideoPlayer() async {
    try {
      _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
        ..addListener(() {
          if (_controller.value.hasError) {
            setState(() {
              _isError = true;
            }); //To replay video automatically
          } else if (_controller.value.position == _controller.value.duration) {
            _controller.seekTo(Duration.zero);
            _controller.play();
          }
        })
        ..initialize().then((_) {
          setState(() {
            _isVideoLoaded = true;
          });
          _controller.play();
        });
    } catch (e) {
      setState(() {
        _isError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isError) {
      return const Center(child: Text('Error loading video.'));
    }
    final videoAspectRatio = _controller.value.aspectRatio;
    final deviceSize = MediaQuery.sizeOf(context);
    final screenAspectRatio = deviceSize.width / deviceSize.height;

    return _isVideoLoaded
        ? Center(
            child: Container(
              width: videoAspectRatio > screenAspectRatio
                  ? deviceSize.width
                  : deviceSize.height * videoAspectRatio,
              height: videoAspectRatio > screenAspectRatio
                  ? deviceSize.width / videoAspectRatio
                  : deviceSize.height,
              decoration: const BoxDecoration(
                color: AppColors.colorPrimary,
              ),
              child: VideoPlayer(_controller),
            ),
          )
        : const Center(child: CircularProgressIndicator(color: AppColors.colorWhite));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
