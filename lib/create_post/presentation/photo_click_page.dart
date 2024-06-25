import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

  // Future<void> _pickImageFromGallery() async {
  //   final picker = ImagePicker();
  //   final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  //
  //   setState(() {
  //     imageFile = pickedFile;
  //   });
  //
  //   if (pickedFile != null) {
  //    AutoRouter.of(context).push(
  //        OpenGalleryRoute(imageFile: pickedFile)
  //    );
  //   }
  // }

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
                    ? Container(width: 40, height: 40, color: Colors.grey)
                    : Image.file(File(imageFile!.path),
                        width: 40, height: 40, fit: BoxFit.cover)),
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
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: FloatingActionButton(
                backgroundColor: const Color(0xFFDE4349),
                shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 3, color: Colors.white),
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
        ],
      ),
    );
  }
}
