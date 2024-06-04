// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ListState {
  bool get isLoading => throw _privateConstructorUsedError;
  int get listIndex => throw _privateConstructorUsedError;
  int get mapViewIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ListStateCopyWith<ListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListStateCopyWith<$Res> {
  factory $ListStateCopyWith(ListState value, $Res Function(ListState) then) =
      _$ListStateCopyWithImpl<$Res, ListState>;
  @useResult
  $Res call({bool isLoading, int listIndex, int mapViewIndex});
}

/// @nodoc
class _$ListStateCopyWithImpl<$Res, $Val extends ListState>
    implements $ListStateCopyWith<$Res> {
  _$ListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? listIndex = null,
    Object? mapViewIndex = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      listIndex: null == listIndex
          ? _value.listIndex
          : listIndex // ignore: cast_nullable_to_non_nullable
              as int,
      mapViewIndex: null == mapViewIndex
          ? _value.mapViewIndex
          : mapViewIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListStateImplCopyWith<$Res>
    implements $ListStateCopyWith<$Res> {
  factory _$$ListStateImplCopyWith(
          _$ListStateImpl value, $Res Function(_$ListStateImpl) then) =
      __$$ListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, int listIndex, int mapViewIndex});
}

/// @nodoc
class __$$ListStateImplCopyWithImpl<$Res>
    extends _$ListStateCopyWithImpl<$Res, _$ListStateImpl>
    implements _$$ListStateImplCopyWith<$Res> {
  __$$ListStateImplCopyWithImpl(
      _$ListStateImpl _value, $Res Function(_$ListStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? listIndex = null,
    Object? mapViewIndex = null,
  }) {
    return _then(_$ListStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      listIndex: null == listIndex
          ? _value.listIndex
          : listIndex // ignore: cast_nullable_to_non_nullable
              as int,
      mapViewIndex: null == mapViewIndex
          ? _value.mapViewIndex
          : mapViewIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ListStateImpl extends _ListState {
  const _$ListStateImpl(
      {this.isLoading = false, this.listIndex = 0, this.mapViewIndex = 0})
      : super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final int listIndex;
  @override
  @JsonKey()
  final int mapViewIndex;

  @override
  String toString() {
    return 'ListState(isLoading: $isLoading, listIndex: $listIndex, mapViewIndex: $mapViewIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.listIndex, listIndex) ||
                other.listIndex == listIndex) &&
            (identical(other.mapViewIndex, mapViewIndex) ||
                other.mapViewIndex == mapViewIndex));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, listIndex, mapViewIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListStateImplCopyWith<_$ListStateImpl> get copyWith =>
      __$$ListStateImplCopyWithImpl<_$ListStateImpl>(this, _$identity);
}

abstract class _ListState extends ListState {
  const factory _ListState(
      {final bool isLoading,
      final int listIndex,
      final int mapViewIndex}) = _$ListStateImpl;
  const _ListState._() : super._();

  @override
  bool get isLoading;
  @override
  int get listIndex;
  @override
  int get mapViewIndex;
  @override
  @JsonKey(ignore: true)
  _$$ListStateImplCopyWith<_$ListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
