// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'createPost_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreatePostState {
  int get currentPage => throw _privateConstructorUsedError;
  List<AssetEntity> get selectedAssets => throw _privateConstructorUsedError;
  XFile? get imageFile => throw _privateConstructorUsedError;

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
      {int currentPage, List<AssetEntity> selectedAssets, XFile? imageFile});
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
    Object? selectedAssets = null,
    Object? imageFile = freezed,
  }) {
    return _then(_value.copyWith(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      selectedAssets: null == selectedAssets
          ? _value.selectedAssets
          : selectedAssets // ignore: cast_nullable_to_non_nullable
              as List<AssetEntity>,
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as XFile?,
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
      {int currentPage, List<AssetEntity> selectedAssets, XFile? imageFile});
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
    Object? selectedAssets = null,
    Object? imageFile = freezed,
  }) {
    return _then(_$CreatePostStateImpl(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      selectedAssets: null == selectedAssets
          ? _value._selectedAssets
          : selectedAssets // ignore: cast_nullable_to_non_nullable
              as List<AssetEntity>,
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as XFile?,
    ));
  }
}

/// @nodoc

class _$CreatePostStateImpl implements _CreatePostState {
  const _$CreatePostStateImpl(
      {this.currentPage = 0,
      final List<AssetEntity> selectedAssets = const [],
      this.imageFile})
      : _selectedAssets = selectedAssets;

  @override
  @JsonKey()
  final int currentPage;
  final List<AssetEntity> _selectedAssets;
  @override
  @JsonKey()
  List<AssetEntity> get selectedAssets {
    if (_selectedAssets is EqualUnmodifiableListView) return _selectedAssets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedAssets);
  }

  @override
  final XFile? imageFile;

  @override
  String toString() {
    return 'CreatePostState(currentPage: $currentPage, selectedAssets: $selectedAssets, imageFile: $imageFile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatePostStateImpl &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            const DeepCollectionEquality()
                .equals(other._selectedAssets, _selectedAssets) &&
            (identical(other.imageFile, imageFile) ||
                other.imageFile == imageFile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentPage,
      const DeepCollectionEquality().hash(_selectedAssets), imageFile);

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
      final List<AssetEntity> selectedAssets,
      final XFile? imageFile}) = _$CreatePostStateImpl;

  @override
  int get currentPage;
  @override
  List<AssetEntity> get selectedAssets;
  @override
  XFile? get imageFile;
  @override
  @JsonKey(ignore: true)
  _$$CreatePostStateImplCopyWith<_$CreatePostStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
