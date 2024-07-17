import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/infrastructure/network_api_services.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../core/constants/app_urls.dart';
import '../../../core/routes/app_router.dart';
import '../../../core/utils/app_log.dart';
import '../../../core/utils/toast.dart';
import 'createPost_state.dart';

class CreatePostNotifier extends StateNotifier<CreatePostState> {
  CreatePostNotifier(this._dio, this._networkApiService)
      : super(const CreatePostState());

  final Dio _dio;
  final NetworkApiService _networkApiService;
  final PageController _pageController = PageController();
  PageController get pageController => _pageController;

  Future<void> pickAssets() async {
    // final List<AssetEntity>? result = await InstaAssetPicker.pickAssets(
    //   context,
    //   maxAssets: 10,
    //   pickerTheme: ThemeData.dark(),
    //   onCompleted: (Stream<InstaAssetsExportDetails> exportDetails) {  },
    // );
    // if (result != null) {
    //   state.selectedAssets();
    // }
  }

  void onContinuePressed(BuildContext context) {
    if (state.currentPage == 0) {
      state = state.copyWith(currentPage: state.currentPage + 1);
      _pageController.animateToPage(
        state.currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      resetPage();
      AutoRouter.of(context)
          .pushAndPopUntil(const BaseRoute(), predicate: (_) => false);
    }
  }

  void resetPage() {
    state = state.copyWith(currentPage: 0);
  }

  void updateImageFile(XFile? imageFile) {
    state = state.copyWith(imageFile: imageFile);
  }

  TextEditingController restaurantNameTextController = TextEditingController();
  final TextEditingController restaurantIdTextController =
      TextEditingController();
  final TextEditingController postTitleTextController = TextEditingController();
  final TextEditingController postDescriptionTextController =
      TextEditingController();
  final TextEditingController restaurantAddressTextController =
      TextEditingController();
  final TextEditingController postCuisineIdTextController =
      TextEditingController();
  final TextEditingController postHowWasItTextController =
      TextEditingController();

  Future<void> addPost(VoidCallback voidCallback, XFile? imageFile) async {
    state = state.copyWith(isLoading: true);
    AppLog.log('imageFile --------->> $imageFile');

    try {
      final formData = FormData.fromMap({
        if (imageFile != null)
          "image": await MultipartFile.fromFile(imageFile.path),
        "restaurant_id": restaurantIdTextController.text,
        "title": postTitleTextController.text,
        "description": postDescriptionTextController.text,
        "how_was_it": postHowWasItTextController.text,
        "preference_id": postCuisineIdTextController.text,
      });

      var (response, dioException) =
          await _networkApiService.postApiRequestWithToken(
        url: '${AppUrls.BASE_URL}${AppUrls.addPost}',
        body: formData,
      );

      state = state.copyWith(isLoading: false);

      if (response == null && dioException == null) {
        showConnectionWasInterruptedToastMessage();
      } else if (dioException != null) {
        showDioError(dioException);
      } else {
        Map<String, dynamic> jsonData = response.data;

        if (response.statusCode == 200) {
          showToastMessage(jsonData['message']);
          restaurantIdTextController.clear();
          postTitleTextController.clear();
          postDescriptionTextController.clear();
          voidCallback.call();
        } else {
          showToastMessage(jsonData['message']);
        }
      }
    } catch (error) {
      AppLog.log("_______${error}");
      state = state.copyWith(isLoading: false);
      showConnectionWasInterruptedToastMessage();
    }
  }

  clearRestaurantDetails() {
    restaurantNameTextController.clear();
    restaurantIdTextController.clear();
    restaurantAddressTextController.clear();
    postHowWasItTextController.clear();
    postCuisineIdTextController.clear();
  }

  clearAllPostDetails() {
    postTitleTextController.clear();
    postDescriptionTextController.clear();
    restaurantNameTextController.clear();
    restaurantIdTextController.clear();
    restaurantAddressTextController.clear();
    postHowWasItTextController.clear();
    postCuisineIdTextController.clear();
  }

  void selectedReview(String selectedReview) async {
    postHowWasItTextController.text = selectedReview;
    state = state.copyWith(selectedReview: selectedReview);
  }

  void _showPermissionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Camera Permission Required'),
        content: const Text(
            'This app needs Camera permission to work properly. Please grant the permission in settings.'),
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

  void toggleIsPressedToTrue() {
    state = state.copyWith(isPressed: true);
  }

  void toggleIsPressedToFalse() {
    state = state.copyWith(isPressed: false);
  }

}
