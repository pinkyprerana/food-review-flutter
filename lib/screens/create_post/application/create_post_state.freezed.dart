// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_post_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreatePostState {
  int get currentPage => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isPressed => throw _privateConstructorUsedError;
  XFile? get imageFile => throw _privateConstructorUsedError;
  String get selectedReview => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreatePostStateCopyWith<CreatePostState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatePostStateCopyWith<$Res> {
  factory $CreatePostStateCopyWith(
          CreatePostState value, $Res Function(CreatePostState) then) =
      _$CreatePostStateCopyWithImpl<$Res, CreatePostState>;
  @useResult
  $Res call(
      {int currentPage,
      bool isLoading,
      bool isPressed,
      XFile? imageFile,
      String selectedReview});
}

/// @nodoc
class _$CreatePostStateCopyWithImpl<$Res, $Val extends CreatePostState>
    implements $CreatePostStateCopyWith<$Res> {
  _$CreatePostStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? isLoading = null,
    Object? isPressed = null,
    Object? imageFile = freezed,
    Object? selectedReview = null,
  }) {
    return _then(_value.copyWith(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isPressed: null == isPressed
          ? _value.isPressed
          : isPressed // ignore: cast_nullable_to_non_nullable
              as bool,
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as XFile?,
      selectedReview: null == selectedReview
          ? _value.selectedReview
          : selectedReview // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreatePostStateImplCopyWith<$Res>
    implements $CreatePostStateCopyWith<$Res> {
  factory _$$CreatePostStateImplCopyWith(_$CreatePostStateImpl value,
          $Res Function(_$CreatePostStateImpl) then) =
      __$$CreatePostStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int currentPage,
      bool isLoading,
      bool isPressed,
      XFile? imageFile,
      String selectedReview});
}

/// @nodoc
class __$$CreatePostStateImplCopyWithImpl<$Res>
    extends _$CreatePostStateCopyWithImpl<$Res, _$CreatePostStateImpl>
    implements _$$CreatePostStateImplCopyWith<$Res> {
  __$$CreatePostStateImplCopyWithImpl(
      _$CreatePostStateImpl _value, $Res Function(_$CreatePostStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? isLoading = null,
    Object? isPressed = null,
    Object? imageFile = freezed,
    Object? selectedReview = null,
  }) {
    return _then(_$CreatePostStateImpl(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isPressed: null == isPressed
          ? _value.isPressed
          : isPressed // ignore: cast_nullable_to_non_nullable
              as bool,
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as XFile?,
      selectedReview: null == selectedReview
          ? _value.selectedReview
          : selectedReview // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CreatePostStateImpl implements _CreatePostState {
  const _$CreatePostStateImpl(
      {this.currentPage = 0,
      this.isLoading = false,
      this.isPressed = false,
      this.imageFile,
      this.selectedReview = ""});

  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isPressed;
  @override
  final XFile? imageFile;
  @override
  @JsonKey()
  final String selectedReview;

  @override
  String toString() {
    return 'CreatePostState(currentPage: $currentPage, isLoading: $isLoading, isPressed: $isPressed, imageFile: $imageFile, selectedReview: $selectedReview)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatePostStateImpl &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isPressed, isPressed) ||
                other.isPressed == isPressed) &&
            (identical(other.imageFile, imageFile) ||
                other.imageFile == imageFile) &&
            (identical(other.selectedReview, selectedReview) ||
                other.selectedReview == selectedReview));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentPage, isLoading,
      isPressed, imageFile, selectedReview);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatePostStateImplCopyWith<_$CreatePostStateImpl> get copyWith =>
      __$$CreatePostStateImplCopyWithImpl<_$CreatePostStateImpl>(
          this, _$identity);
}

abstract class _CreatePostState implements CreatePostState {
  const factory _CreatePostState(
      {final int currentPage,
      final bool isLoading,
      final bool isPressed,
      final XFile? imageFile,
      final String selectedReview}) = _$CreatePostStateImpl;

  @override
  int get currentPage;
  @override
  bool get isLoading;
  @override
  bool get isPressed;
  @override
  XFile? get imageFile;
  @override
  String get selectedReview;
  @override
  @JsonKey(ignore: true)
  _$$CreatePostStateImplCopyWith<_$CreatePostStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
