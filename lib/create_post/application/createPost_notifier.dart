import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/infrastructure/network_api_services.dart';
import '../../core/constants/app_urls.dart';
import '../../core/routes/app_router.dart';
import '../../core/utils/toast.dart';
import 'createPost_state.dart';


class CreatePostNotifier extends StateNotifier<CreatePostState> {
  CreatePostNotifier(this._dio, this._networkApiService) : super(const CreatePostState());

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
    }
    else{
      resetPage();
      AutoRouter.of(context).pushAndPopUntil(const BaseRoute(), predicate: (_) => false);
    }
  }

  void resetPage(){
    state = state.copyWith(currentPage: 0);
  }

  void updateImageFile(XFile? imageFile) {
    state = state.copyWith(imageFile: imageFile);
  }

  TextEditingController restaurantNameTextController =
  TextEditingController();
  final TextEditingController restaurantIdTextController =
  TextEditingController();
  final TextEditingController postTitleTextController =
  TextEditingController();
  final TextEditingController postDescriptionTextController =
  TextEditingController();
  final TextEditingController restaurantAddressTextController =
  TextEditingController();
  final TextEditingController postCuisineTextController =
  TextEditingController();
  final TextEditingController postHowWasItTextController =
  TextEditingController();


  Future<void> addPost(VoidCallback voidCallback, XFile? imageFile) async {
      state = state.copyWith(isLoading: true);

      final imagePath = File(imageFile?.path ?? '');
      String imageName = imagePath.path.split('/').last;

      try {
        var (response, dioException) = await _networkApiService
            .postApiRequestWithToken(
            url: '${AppUrls.BASE_URL}${AppUrls.addPost}',
            body: {
              "restaurant_id": restaurantIdTextController.text,
              "title": postTitleTextController.text,
              "description": postDescriptionTextController.text,
              "image": '${AppUrls.postImageLocation}/$imageName',
              "how_was_it": postHowWasItTextController.text,
              "cuisine": postCuisineTextController.text,
            });
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
        state = state.copyWith(isLoading: false);
        showConnectionWasInterruptedToastMessage();
      }
    }

  clearRestaurantDetails(){
    restaurantNameTextController.clear();
    restaurantIdTextController.clear();
    restaurantAddressTextController.clear();
    postHowWasItTextController.clear();
  }

  clearAllPostDetails(){
    postTitleTextController.clear();
    postDescriptionTextController.clear();
    restaurantNameTextController.clear();
    restaurantIdTextController.clear();
    restaurantAddressTextController.clear();
    postHowWasItTextController.clear();
  }

  void selectedReview(String selectedReview) async {
      postHowWasItTextController.text = selectedReview;
      state = state.copyWith(selectedReview: selectedReview);
  }

}
