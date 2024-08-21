import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

class ShowVideoWidget extends ConsumerStatefulWidget {
  final String videoUrl;

  const ShowVideoWidget({super.key, required this.videoUrl});

  @override
  _ShowVideoWidgetState createState() => _ShowVideoWidgetState();
}

class _ShowVideoWidgetState extends ConsumerState<ShowVideoWidget> {
  late VideoPlayerController _controller;
  // bool _isVideoLoaded = false;
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
            });
          }
        })
        ..initialize().then((_) {
          // setState(() {
          //   _isVideoLoaded = true;
          // });
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

    return
      // _isVideoLoaded
      // ?
      AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          );
        // : const Center(child: CircularProgressIndicator(color: AppColors.colorPrimary,));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}