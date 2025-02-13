import 'package:camera/camera.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'create_post_state.freezed.dart';

@freezed
abstract class CreatePostState with _$CreatePostState {
  const factory CreatePostState({
    @Default(0) int currentPage,
    @Default(false) bool isLoading,
    @Default(false) bool isPressed,
    XFile? imageFile,
    @Default("") String selectedReview,
  }) = _CreatePostState;
}
