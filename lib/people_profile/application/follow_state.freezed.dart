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
  int get followIndex => throw _privateConstructorUsedError;

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
  $Res call({int followIndex});
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
    Object? followIndex = null,
  }) {
    return _then(_value.copyWith(
      followIndex: null == followIndex
          ? _value.followIndex
          : followIndex // ignore: cast_nullable_to_non_nullable
              as int,
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
  $Res call({int followIndex});
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
    Object? followIndex = null,
  }) {
    return _then(_$FollowStateImpl(
      followIndex: null == followIndex
          ? _value.followIndex
          : followIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FollowStateImpl implements _FollowState {
  const _$FollowStateImpl({this.followIndex = -1});

  @override
  @JsonKey()
  final int followIndex;

  @override
  String toString() {
    return 'FollowState(followIndex: $followIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowStateImpl &&
            (identical(other.followIndex, followIndex) ||
                other.followIndex == followIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, followIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowStateImplCopyWith<_$FollowStateImpl> get copyWith =>
      __$$FollowStateImplCopyWithImpl<_$FollowStateImpl>(this, _$identity);
}

abstract class _FollowState implements FollowState {
  const factory _FollowState({final int followIndex}) = _$FollowStateImpl;

  @override
  int get followIndex;
  @override
  @JsonKey(ignore: true)
  _$$FollowStateImplCopyWith<_$FollowStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
