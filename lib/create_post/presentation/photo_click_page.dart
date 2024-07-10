import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../core/constants/assets.dart';
import '../../core/routes/app_router.dart';

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

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addObserver(this);
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    cameras = await availableCameras();
    _controller =
        CameraController(cameras![selectedCameraIndex], ResolutionPreset.high);
    await _controller!.initialize();
    if (!mounted) {
      return;
    }
    setState(() {});
  }

  // Future<void> _initializeCamera() async {
  //   var status = await Permission.camera.status;
  //
  //   if (status.isDenied || status.isPermanentlyDenied) {
  //     // Show a dialog to guide the user to the app settings
  //     showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //         title: Text('Camera Permission'),
  //         content: Text('Camera access is required to use this feature. Please enable it in the app settings.'),
  //         actions: [
  //           TextButton(
  //             onPressed: () async {
  //               Navigator.of(context).pop();
  //               await openAppSettings();
  //             },
  //             child: Text('Open Settings'),
  //           ),
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //             child: Text('Cancel'),
  //           ),
  //         ],
  //       ),
  //     );
  //   } else if (status.isGranted) {
  //     // Initialize the camera
  //     cameras = await availableCameras();
  //     _controller = CameraController(
  //       cameras![selectedCameraIndex],
  //       ResolutionPreset.high,
  //     );
  //     await _controller!.initialize();
  //
  //     if (!mounted) {
  //       return;
  //     }
  //
  //     setState(() {});
  //   } else {
  //     // Request permission if it is not granted yet
  //     PermissionStatus newStatus = await Permission.camera.request();
  //     if (newStatus.isGranted) {
  //       // Initialize the camera
  //       cameras = await availableCameras();
  //       _controller = CameraController(
  //         cameras![selectedCameraIndex],
  //         ResolutionPreset.high,
  //       );
  //       await _controller!.initialize();
  //
  //       if (!mounted) {
  //         return;
  //       }
  //
  //       setState(() {});
  //     } else {
  //       // Handle the case when the user denies the permission again
  //       showDialog(
  //         context: context,
  //         builder: (context) => AlertDialog(
  //           title: Text('Camera Permission'),
  //           content: Text('Camera access is required to use this feature. Please enable it in the app settings.'),
  //           actions: [
  //             TextButton(
  //               onPressed: () async {
  //                 Navigator.of(context).pop();
  //                 await openAppSettings();
  //               },
  //               child: Text('Open Settings'),
  //             ),
  //             TextButton(
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //               child: Text('Cancel'),
  //             ),
  //           ],
  //         ),
  //       );
  //     }
  //   }
  // }


  Future<void> _pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      imageFile = pickedFile;
    });

    if (pickedFile != null) {
     AutoRouter.of(context).push(
         CreatePostRoute(imageFile: pickedFile)
     );
    }
  }

  void _switchCamera() {
    selectedCameraIndex = selectedCameraIndex == 0 ? 1 : 0;
    _initializeCamera();
  }

  @override
  void dispose() {
    // WidgetsBinding.instance.removeObserver(this);
    _controller?.dispose();
    super.dispose();
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive) {
      _controller?.dispose();
    } else if (state == AppLifecycleState.resumed) {
      _initializeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null || !_controller!.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(
                  top: 10, left: 20, right: 0, bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.colorPrimary.withOpacity(0.20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  5.horizontalSpace, //this is for centering the icon
                  Icon(Icons.arrow_back_ios,
                      color: AppColors.colorWhite, size: 15.h),
                ],
              ),
            ),
          )),
      body: Stack(
        fit: StackFit.expand,
        children: [
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
                  onPressed: () async {
                    final image = await _controller!.takePicture();
                    setState(() {
                      imageFile = image;
                    });
                    AutoRouter.of(context)
                        .push(CreatePostRoute(imageFile: imageFile));
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
