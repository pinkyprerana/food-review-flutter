import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/utils/app_log.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../core/constants/assets.dart';
import '../../core/routes/app_router.dart';

@RoutePage()
class PhotoClickPageNew extends ConsumerStatefulWidget {
  const PhotoClickPageNew({super.key});

  @override
  ConsumerState<PhotoClickPageNew> createState() => _PhotoClickPageNewState();
}

class _PhotoClickPageNewState extends ConsumerState<PhotoClickPageNew> {
  CameraController? _controller;
  List<CameraDescription>? cameras;
  XFile? imageFile;
  int selectedCameraIndex = 0;
  bool isIOS = Platform.isIOS;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();

    AppLog.log('this is called');

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await requestCameraPermission();
    });

    // _initializeCamera();
  }

  Future<void> requestCameraPermission() async {
    PermissionStatus status = await Permission.camera.request();

    if (status.isGranted) {
      //permission is granted
      AppLog.log('permission is granted');
      final cameras = await availableCameras();
      final firstCamera = cameras.first;

      _controller = CameraController(
        firstCamera,
        ResolutionPreset.high,
        enableAudio: false,
      );
      _initializeControllerFuture = _controller!.initialize();
    } else if (status.isDenied || status.isPermanentlyDenied) {
      // Permission is denied
      AppLog.log('permission is denied');
      openAppSettings();
    }
    setState(() {});
  }

  void _showPermissionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Location Permission Required'),
        content: const Text(
            'This app needs location permission to work properly. Please grant the permission in settings.'),
        actions: [
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              openAppSettings();
            },
            child: const Text('Open Settings'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
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

  // void _switchCamera() {
  //   selectedCameraIndex = selectedCameraIndex == 0 ? 1 : 0;
  //   _initializeCamera();
  // }

  @override
  void dispose() {
    // WidgetsBinding.instance.removeObserver(this);
    _controller?.dispose();
    super.dispose();
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_controller == null || !_controller!.value.isInitialized) {
      return;
    }
    if (state == AppLifecycleState.inactive) {
      _controller?.dispose();
    } else if (state == AppLifecycleState.resumed) {
      _initializeControllerFuture = _controller!.initialize();
    }
    // if (state == AppLifecycleState.inactive) {
    //   _controller?.dispose();
    // } else if (state == AppLifecycleState.resumed) {
    //   _initializeCamera();
    // }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    AppLog.log('controller ----------->> $_controller');
    if (_controller == null || _controller!.value.isInitialized) {
      return const Center(
          child: CircularProgressIndicator(
        color: Colors.white,
      ));
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: GestureDetector(
            onTap: () {
              // Navigator.pop(context);
              AutoRouter.of(context).push(const BaseRoute());
            },
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
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                Container(
                  width: size.width,
                  height: size.height,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Container(
                        width: 100, child: CameraPreview(_controller!)),
                  ),
                ),
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
                              child: Container(
                                  width: 40, height: 40, color: Colors.grey))
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
                    onPressed: () {},
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
                            side:
                                const BorderSide(width: 4, color: Colors.white),
                            borderRadius: BorderRadius.circular(100)),
                        onPressed: () async {
                          // (Platform.isIOS)
                          //     ?
                          // createPostState.checkPermissionForIOS(context)
                          //     : createPostState.checkPermission(context);
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
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      // body: Stack(
      //   fit: StackFit.expand,
      //   children: [
      //     CameraPreview(_controller!),
      //     Positioned(
      //       bottom: 40,
      //       left: 20,
      //       child: ClipRRect(
      //           borderRadius: BorderRadius.circular(8.0),
      //           child: imageFile == null
      //               ? InkWell(
      //                   onTap: () async {
      //                     await _pickImageFromGallery();
      //                   },
      //                   child: Container(
      //                       width: 40, height: 40, color: Colors.grey))
      //               : InkWell(
      //                   onTap: () async {
      //                     await _pickImageFromGallery();
      //                   },
      //                   child: Image.file(File(imageFile!.path),
      //                       width: 40, height: 40, fit: BoxFit.cover),
      //                 )),
      //     ),
      //     Positioned(
      //       bottom: 40,
      //       right: 20,
      //       child: IconButton(
      //         icon: Image.asset(
      //           height: 40,
      //           width: 40,
      //           Assets.rotateCamera,
      //         ),
      //         onPressed: _switchCamera,
      //       ),
      //     ),
      //     Positioned(
      //       bottom: 30,
      //       left: 0,
      //       right: 0,
      //       child: SizedBox(
      //         height: 80,
      //         child: FittedBox(
      //           child: FloatingActionButton(
      //             backgroundColor: const Color(0xFFDE4349),
      //             shape: RoundedRectangleBorder(
      //                 side: const BorderSide(width: 4, color: Colors.white),
      //                 borderRadius: BorderRadius.circular(100)),
      //             onPressed: () async {
      //               // (Platform.isIOS)
      //               //     ?
      //               // createPostState.checkPermissionForIOS(context)
      //               //     : createPostState.checkPermission(context);
      //               final image = await _controller!.takePicture();
      //               setState(() {
      //                 imageFile = image;
      //               });
      //               AutoRouter.of(context)
      //                   .push(CreatePostRoute(imageFile: imageFile));
      //             },
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
