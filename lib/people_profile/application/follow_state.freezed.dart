// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'follow_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FollowState {
  bool get isFollowing => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FollowStateCopyWith<FollowState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowStateCopyWith<$Res> {
  factory $FollowStateCopyWith(
          FollowState value, $Res Function(FollowState) then) =
      _$FollowStateCopyWithImpl<$Res, FollowState>;
  @useResult
  $Res call({bool isFollowing});
}

/// @nodoc
class _$FollowStateCopyWithImpl<$Res, $Val extends FollowState>
    implements $FollowStateCopyWith<$Res> {
  _$FollowStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFollowing = null,
  }) {
    return _then(_value.copyWith(
      isFollowing: null == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FollowStateImplCopyWith<$Res>
    implements $FollowStateCopyWith<$Res> {
  factory _$$FollowStateImplCopyWith(
          _$FollowStateImpl value, $Res Function(_$FollowStateImpl) then) =
      __$$FollowStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isFollowing});
}

/// @nodoc
class __$$FollowStateImplCopyWithImpl<$Res>
    extends _$FollowStateCopyWithImpl<$Res, _$FollowStateImpl>
    implements _$$FollowStateImplCopyWith<$Res> {
  __$$FollowStateImplCopyWithImpl(
      _$FollowStateImpl _value, $Res Function(_$FollowStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFollowing = null,
  }) {
    return _then(_$FollowStateImpl(
      isFollowing: null == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FollowStateImpl implements _FollowState {
  const _$FollowStateImpl({this.isFollowing = false});

  @override
  @JsonKey()
  final bool isFollowing;

  @override
  String toString() {
    return 'FollowState(isFollowing: $isFollowing)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowStateImpl &&
            (identical(other.isFollowing, isFollowing) ||
                other.isFollowing == isFollowing));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isFollowing);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowStateImplCopyWith<_$FollowStateImpl> get copyWith =>
      __$$FollowStateImplCopyWithImpl<_$FollowStateImpl>(this, _$identity);
}

abstract class _FollowState implements FollowState {
  const factory _FollowState({final bool isFollowing}) = _$FollowStateImpl;

  @override
  bool get isFollowing;
  @override
  @JsonKey(ignore: true)
  _$$FollowStateImplCopyWith<_$FollowStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
