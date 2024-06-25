import 'package:camera/camera.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'createPost_state.freezed.dart';

@freezed
abstract class CreatePostState with _$CreatePostState {
  const factory CreatePostState({
    @Default(0) int currentPage,
    // @Default([]) List<AssetEntity> selectedAssets,
    XFile? imageFile,
  }) = _CreatePostState;
}
