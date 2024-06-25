import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/infrastructure/hive_database.dart';
import '../../base/application/base_notifier.dart';
import '../../core/routes/app_router.dart';
import 'createPost_state.dart';


class CreatePostNotifier extends StateNotifier<CreatePostState> {
  CreatePostNotifier(this._dio, this._hiveDatabase) : super(const CreatePostState());

  final Dio _dio;
  final HiveDatabase _hiveDatabase;
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
}
