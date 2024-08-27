import 'dart:async';
import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/screens/onboarding/shared/provider.dart';
import 'package:for_the_table/screens/restaurant/shared/provider.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/constants/assets.dart';
import '../../../core/routes/app_router.dart';
import '../../../core/styles/app_text_styles.dart';
import '../../../core/utils/app_log.dart';
import '../../../widgets/app_button.dart';
import '../shared/provider.dart';

@RoutePage()
class PhotoClickPage extends ConsumerStatefulWidget {
  const PhotoClickPage({super.key});

  @override
  ConsumerState<PhotoClickPage> createState() => _PhotoClickPageState();
}

class _PhotoClickPageState extends ConsumerState<PhotoClickPage> {
  CameraController? _controller;
  List<CameraDescription>? cameras;
  XFile? imageFile;
  int selectedCameraIndex = 0;
  bool isIOS = Platform.isIOS;
  XFile? videoFile;
  Timer? _timer;
  double _progress = 0.0;
  bool _isRecording = false;

  @override
  void initState() {
    // WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((time) async {
      _initializeCamera().then((_) {
        setState(() {});
      });
      final stateNotifier = ref.read(restaurantNotifierProvider.notifier);
      await stateNotifier.getRestaurants(ref: ref);
      final preferenceNotifier = ref.read(preferenceNotifierProvider.notifier);
      await preferenceNotifier.getAllPreference();
    });
    super.initState();
  }

  // Future<void> _checkPermissions() async {
  //   final cameraStatus = await Permission.camera.status;
  //   // final microphoneStatus = await Permission.microphone.status;

  //   if (cameraStatus.isDenied) {
  //     await _requestPermissions();
  //   }
  //   // else if (microphoneStatus.isDenied) {
  //   //   await _requestPermissions();
  //   // }
  //   else if (cameraStatus.isPermanentlyDenied) {
  //     _showPermissionDialog();
  //   } else {
  //     await _initializeCamera();
  //   }
  // }

  // Future<void> _requestPermissions() async {
  //   final cameraStatus = await Permission.camera.request();
  //   // final microphoneStatus = await Permission.microphone.request();

  //   if (cameraStatus.isGranted) {
  //     await _initializeCamera();
  //   } else if (cameraStatus.isPermanentlyDenied || cameraStatus.isDenied) {
  //     _showPermissionDialog();
  //   }
  // }

  // void _showPermissionDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: const Text('Camera Permission'),
  //       content: const Text(
  //         'Camera and files access are required to use this feature. Please enable them in the app settings.',
  //       ),
  //       actions: [
  //         TextButton(
  //           onPressed: () async {
  //             Navigator.of(context).pop();
  //             await openAppSettings();
  //           },
  //           child: const Text('Open Settings'),
  //         ),
  //         TextButton(
  //           onPressed: () => Navigator.of(context).pop(),
  //           child: const Text('Cancel'),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Future<void> _initializeCamera() async {
  //   cameras = await availableCameras();
  //   _controller = CameraController(
  //     cameras![selectedCameraIndex],
  //     ResolutionPreset.high,
  //     enableAudio: false,
  //   );
  //   await _controller!.initialize();
  //   if (!mounted) {
  //     return;
  //   }
  // }

  Future<void> _initializeCamera() async {
    cameras = await availableCameras();
    _controller = CameraController(
      cameras![selectedCameraIndex],
      ResolutionPreset.high,
      enableAudio: true,
    );

    await _controller!.initialize().then((_) {
      if (_controller != null) {
        if (_controller!.value.isStreamingImages) {
          _controller!.stopImageStream();
        } else {
          _controller!.startImageStream((image) {});
        }
      }
    });

    if (!mounted) {
      return;
    }
  }

  void _switchCamera() {
    selectedCameraIndex = selectedCameraIndex == 0 ? 1 : 0;
    _initializeCamera().then((_) {
      setState(() {});
    });
  }

  Future<void> _pickMediaFromGallery(currentContext) async {
    final picker = ImagePicker();

    XFile? pickedFile;

    final isImage = await showDialog<bool>(
      context: currentContext,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(
            'Select Media Type',
            style: AppTextStyles.textStylePoppinsMedium.copyWith(
              fontSize: 16.sp,
              color: AppColors.colorBlack,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AppButton(
                text: 'Image',
                onPressed: () => Navigator.pop(dialogContext, true),
              ),
              10.verticalSpace,
              AppButton(
                text: 'Video',
                onPressed: () => Navigator.pop(dialogContext, false),
              ),
            ],
          ),
        );
      },
    );

    if (isImage == null) return;

    if (isImage) {
      pickedFile = await picker.pickImage(source: ImageSource.gallery);
    } else {
      pickedFile = await picker.pickVideo(source: ImageSource.gallery);
    }

    if (pickedFile != null) {
      final filePath = pickedFile.path.toLowerCase();
      if (filePath.endsWith('.mp4') || filePath.endsWith('.mov') || filePath.endsWith('.avi')) {
        setState(() {
          videoFile = pickedFile;
        });
        AutoRouter.of(currentContext).push(CreatePostRoute(file: videoFile));
      } else {
        setState(() {
          imageFile = pickedFile;
        });
        AutoRouter.of(currentContext).push(CreatePostRoute(file: imageFile));
      }
    }
  }

  void _startRecording() async {
    setState(() {
      _progress = 0.0;
      _isRecording = true;
    });

    // Start the video recording
    try {
      await _controller?.startVideoRecording();
    } catch (e) {
      AppLog.log('Error starting video recording: $e');
      setState(() {
        _isRecording = false;
      });
      return;
    }

    // Start the timer for progress indicator
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        _progress += 0.0012067; // Adjust this increment if needed
        AppLog.log('Current progress: $_progress');
      });

      if (_progress >= 1.0) {
        _stopRecording(context);
      }
    });
  }

  void _stopRecording(context) async {
    _timer?.cancel();
    setState(() {
      _isRecording = false;
      _progress = 0.0;
    });

    try {
      final video = await _controller?.stopVideoRecording();
      setState(() {
        videoFile = video;
      });
      if (!context.mounted) return;
      AutoRouter.of(context).push(CreatePostRoute(file: videoFile));
    } catch (e) {
      AppLog.log('Error stopping video recording: $e');
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    _timer?.cancel();
    super.dispose();
  }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   print('didChangeAppLifecycleState');
  //   if (_controller == null || !(_controller?.value.isInitialized ?? false)) return;
  //   if (state == AppLifecycleState.inactive || state == AppLifecycleState.paused) {
  //     _controller?.dispose();
  //   } else if (state == AppLifecycleState.resumed) {
  //     _checkPermissions();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(createPostNotifierProvider);
    final stateNotifier = ref.watch(createPostNotifierProvider.notifier);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          actions: [
            _isRecording
                ? Text("${(_progress * 100).toInt().toString()}s",
                    style: AppTextStyles.textStylePoppinsMedium.copyWith(
                      fontSize: 14.sp,
                      color: AppColors.colorWhite,
                    ))
                : const SizedBox(),
            20.horizontalSpace
          ],
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 10, left: 20, right: 0, bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.colorPrimary.withOpacity(0.20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  5.horizontalSpace,
                  Icon(Icons.arrow_back_ios, color: AppColors.colorWhite, size: 15.h),
                ],
              ),
            ),
          )),
      body: Stack(
        fit: StackFit.expand,
        children: [
          if (_controller != null) ...[
            CameraPreview(_controller!),
            Positioned(
              bottom: 40,
              left: 20,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: InkWell(
                  onTap: () async {
                    await _pickMediaFromGallery(context);
                  },
                  child: imageFile == null
                      ? Container(width: 40, height: 40, color: Colors.grey)
                      : Image.file(File(imageFile!.path), width: 40, height: 40, fit: BoxFit.cover),
                ),
              ),
            ),
            Positioned(
              bottom: 40,
              right: 20,
              child: IconButton(
                icon: Image.asset(
                  height: 40,
                  width: 40,
                  Assets.rotateCamera,
                ),
                onPressed: _switchCamera,
              ),
            ),
            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: SizedBox(
                height: 76, //80,
                child: FittedBox(
                  child: GestureDetector(
                    onLongPress: () => _startRecording(),
                    onLongPressUp: () => _stopRecording(context),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 60.0,
                          height: 60.0,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: CircularProgressIndicator(
                            value: _isRecording ? _progress : 0.0,
                            backgroundColor: Colors.white,
                            valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                            strokeWidth: 4.0,
                          ),
                        ),
                        FloatingActionButton(
                          backgroundColor: const Color(0xFFDE4349),
                          shape: RoundedRectangleBorder(
                              // side: const BorderSide(width: 4, color: Colors.white),
                              borderRadius: BorderRadius.circular(100)),
                          onPressed: !state.isPressed
                              ? () async {
                                  stateNotifier.toggleIsPressedToTrue();
                                  try {
                                    final image = await _controller?.takePicture();
                                    setState(() {
                                      imageFile = image;
                                    });
                                    if (!context.mounted) return;
                                    AutoRouter.of(context).push(CreatePostRoute(file: imageFile));
                                  } finally {
                                    stateNotifier.toggleIsPressedToFalse();
                                  }
                                }
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
