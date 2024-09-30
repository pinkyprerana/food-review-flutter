// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preference_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PreferenceState {
  bool get isLoading => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<PreferenceList>? get data => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PreferenceStateCopyWith<PreferenceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreferenceStateCopyWith<$Res> {
  factory $PreferenceStateCopyWith(
          PreferenceState value, $Res Function(PreferenceState) then) =
      _$PreferenceStateCopyWithImpl<$Res, PreferenceState>;
  @useResult
  $Res call(
      {bool isLoading,
      int status,
      String type,
      String message,
      List<PreferenceList>? data,
      List<String> tags});
}

/// @nodoc
class _$PreferenceStateCopyWithImpl<$Res, $Val extends PreferenceState>
    implements $PreferenceStateCopyWith<$Res> {
  _$PreferenceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? status = null,
    Object? type = null,
    Object? message = null,
    Object? data = freezed,
    Object? tags = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<PreferenceList>?,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PreferenceStateImplCopyWith<$Res>
    implements $PreferenceStateCopyWith<$Res> {
  factory _$$PreferenceStateImplCopyWith(_$PreferenceStateImpl value,
          $Res Function(_$PreferenceStateImpl) then) =
      __$$PreferenceStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      int status,
      String type,
      String message,
      List<PreferenceList>? data,
      List<String> tags});
}

/// @nodoc
class __$$PreferenceStateImplCopyWithImpl<$Res>
    extends _$PreferenceStateCopyWithImpl<$Res, _$PreferenceStateImpl>
    implements _$$PreferenceStateImplCopyWith<$Res> {
  __$$PreferenceStateImplCopyWithImpl(
      _$PreferenceStateImpl _value, $Res Function(_$PreferenceStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? status = null,
    Object? type = null,
    Object? message = null,
    Object? data = freezed,
    Object? tags = null,
  }) {
    return _then(_$PreferenceStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<PreferenceList>?,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$PreferenceStateImpl implements _PreferenceState {
  const _$PreferenceStateImpl(
      {this.isLoading = false,
      this.status = 0,
      this.type = '',
      this.message = '',
      final List<PreferenceList>? data = const [],
      final List<String> tags = const []})
      : _data = data,
        _tags = tags;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final int status;
  @override
  @JsonKey()
  final String type;
  @override
  @JsonKey()
  final String message;
  final List<PreferenceList>? _data;
  @override
  @JsonKey()
  List<PreferenceList>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString() {
    return 'PreferenceState(isLoading: $isLoading, status: $status, type: $type, message: $message, data: $data, tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreferenceStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      status,
      type,
      message,
      const DeepCollectionEquality().hash(_data),
      const DeepCollectionEquality().hash(_tags));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PreferenceStateImplCopyWith<_$PreferenceStateImpl> get copyWith =>
      __$$PreferenceStateImplCopyWithImpl<_$PreferenceStateImpl>(
          this, _$identity);
}

abstract class _PreferenceState implements PreferenceState {
  const factory _PreferenceState(
      {final bool isLoading,
      final int status,
      final String type,
      final String message,
      final List<PreferenceList>? data,
      final List<String> tags}) = _$PreferenceStateImpl;

  @override
  bool get isLoading;
  @override
  int get status;
  @override
  String get type;
  @override
  String get message;
  @override
  List<PreferenceList>? get data;
  @override
  List<String> get tags;
  @override
  @JsonKey(ignore: true)
  _$$PreferenceStateImplCopyWith<_$PreferenceStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
