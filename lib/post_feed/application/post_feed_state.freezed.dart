// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_feed_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PostFeedState {
  bool get isExpanded => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PostFeedStateCopyWith<PostFeedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostFeedStateCopyWith<$Res> {
  factory $PostFeedStateCopyWith(
          PostFeedState value, $Res Function(PostFeedState) then) =
      _$PostFeedStateCopyWithImpl<$Res, PostFeedState>;
  @useResult
  $Res call({bool isExpanded});
}

/// @nodoc
class _$PostFeedStateCopyWithImpl<$Res, $Val extends PostFeedState>
    implements $PostFeedStateCopyWith<$Res> {
  _$PostFeedStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isExpanded = null,
  }) {
    return _then(_value.copyWith(
      isExpanded: null == isExpanded
          ? _value.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostFeedStateImplCopyWith<$Res>
    implements $PostFeedStateCopyWith<$Res> {
  factory _$$PostFeedStateImplCopyWith(
          _$PostFeedStateImpl value, $Res Function(_$PostFeedStateImpl) then) =
      __$$PostFeedStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isExpanded});
}

/// @nodoc
class __$$PostFeedStateImplCopyWithImpl<$Res>
    extends _$PostFeedStateCopyWithImpl<$Res, _$PostFeedStateImpl>
    implements _$$PostFeedStateImplCopyWith<$Res> {
  __$$PostFeedStateImplCopyWithImpl(
      _$PostFeedStateImpl _value, $Res Function(_$PostFeedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isExpanded = null,
  }) {
    return _then(_$PostFeedStateImpl(
      isExpanded: null == isExpanded
          ? _value.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PostFeedStateImpl extends _PostFeedState {
  const _$PostFeedStateImpl({this.isExpanded = false}) : super._();

  @override
  @JsonKey()
  final bool isExpanded;

  @override
  String toString() {
    return 'PostFeedState(isExpanded: $isExpanded)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostFeedStateImpl &&
            (identical(other.isExpanded, isExpanded) ||
                other.isExpanded == isExpanded));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isExpanded);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostFeedStateImplCopyWith<_$PostFeedStateImpl> get copyWith =>
      __$$PostFeedStateImplCopyWithImpl<_$PostFeedStateImpl>(this, _$identity);
}

abstract class _PostFeedState extends PostFeedState {
  const factory _PostFeedState({final bool isExpanded}) = _$PostFeedStateImpl;
  const _PostFeedState._() : super._();

  @override
  bool get isExpanded;
  @override
  @JsonKey(ignore: true)
  _$$PostFeedStateImplCopyWith<_$PostFeedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
