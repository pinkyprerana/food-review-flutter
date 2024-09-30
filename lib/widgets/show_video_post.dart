import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/screens/home/shared/provider.dart';
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
    // final state = ref.watch(homeNotifierProvider);

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
            _controller.setVolume(0.0);
          }
        })
        ..initialize().then((_) {
          setState(() {
            _isVideoLoaded = true;
          });
          _controller.play();
          // Set initial volume from the provider state
          final isMuted = ref.read(homeNotifierProvider).isVideoOnMute;
          _controller.setVolume(isMuted ? 0.0 : 1.0);
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
    final isMuted = ref.watch(homeNotifierProvider).isVideoOnMute;

    // Update the video player volume when the state changes
    if (_isVideoLoaded) {
      _controller.setVolume(isMuted ? 0.0 : 1.0);
    }

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
