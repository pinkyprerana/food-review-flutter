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
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((time) async {
      _initializeCamera().then((_) {
        setState(() {});
      });
      final stateNotifier = ref.read(restaurantNotifierProvider.notifier);
      await stateNotifier.getRestaurants();
      final preferenceNotifier = ref.read(preferenceNotifierProvider.notifier);
      await preferenceNotifier.getAllPreference();
    });
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
      enableAudio: false,
    );

    await _controller!.initialize().then((_) {
      // _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_controller != null) {
        if (_controller!.value.isStreamingImages) {
          _controller!.stopImageStream();
        } else {
          _controller!.startImageStream((image) {});
        }
      }
      // });
    });

    if (!mounted) {
      return;
    }
  }

  Future<void> _pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      imageFile = pickedFile;
    });

    if (pickedFile != null) {
      AutoRouter.of(context).push(CreatePostRoute(imageFile: pickedFile));
    }
  }

  void _switchCamera() {
    selectedCameraIndex = selectedCameraIndex == 0 ? 1 : 0;
    _initializeCamera().then((_) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // WidgetsBinding.instance.removeObserver(this);
    _controller?.dispose();
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
    final state = ref.watch(CreatePostNotifierProvider);
    final stateNotifier = ref.watch(CreatePostNotifierProvider.notifier);
    // if (_controller == null || !(_controller?.value.isInitialized ?? false)) {
    //   return const Center(child: CircularProgressIndicator());
    // }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
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
                  5.horizontalSpace, //this is for centering the icon
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
                  child: imageFile == null
                      ? InkWell(
                          onTap: () async {
                            await _pickImageFromGallery();
                          },
                          child: Container(width: 40, height: 40, color: Colors.grey))
                      : InkWell(
                          onTap: () async {
                            await _pickImageFromGallery();
                          },
                          child: Image.file(File(imageFile!.path),
                              width: 40, height: 40, fit: BoxFit.cover),
                        )),
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
                height: 80,
                child: FittedBox(
                  child: FloatingActionButton(
                    backgroundColor: const Color(0xFFDE4349),
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 4, color: Colors.white),
                        borderRadius: BorderRadius.circular(100)),
                    onPressed: state.isPressed
                        ? null
                        : () async {
                            // (Platform.isIOS)
                            //     ?
                            // createPostState.checkPermissionForIOS(context)
                            //     : createPostState.checkPermission(context);
                            stateNotifier.toggleIsPressedToTrue();
                            final image = await _controller?.takePicture();
                            setState(() {
                              imageFile = image;
                            });
                            if (!context.mounted) return;
                            AutoRouter.of(context).push(CreatePostRoute(imageFile: imageFile));
                          },
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
