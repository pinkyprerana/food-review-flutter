// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preference_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PreferenceModel _$PreferenceModelFromJson(Map<String, dynamic> json) {
  return _PreferenceModel.fromJson(json);
}

/// @nodoc
mixin _$PreferenceModel {
  @JsonKey(name: "status")
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "type")
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  List<PreferenceList>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PreferenceModelCopyWith<PreferenceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreferenceModelCopyWith<$Res> {
  factory $PreferenceModelCopyWith(
          PreferenceModel value, $Res Function(PreferenceModel) then) =
      _$PreferenceModelCopyWithImpl<$Res, PreferenceModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "status") int? status,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") List<PreferenceList>? data});
}

/// @nodoc
class _$PreferenceModelCopyWithImpl<$Res, $Val extends PreferenceModel>
    implements $PreferenceModelCopyWith<$Res> {
  _$PreferenceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? type = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<PreferenceList>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PreferenceModelImplCopyWith<$Res>
    implements $PreferenceModelCopyWith<$Res> {
  factory _$$PreferenceModelImplCopyWith(_$PreferenceModelImpl value,
          $Res Function(_$PreferenceModelImpl) then) =
      __$$PreferenceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "status") int? status,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") List<PreferenceList>? data});
}

/// @nodoc
class __$$PreferenceModelImplCopyWithImpl<$Res>
    extends _$PreferenceModelCopyWithImpl<$Res, _$PreferenceModelImpl>
    implements _$$PreferenceModelImplCopyWith<$Res> {
  __$$PreferenceModelImplCopyWithImpl(
      _$PreferenceModelImpl _value, $Res Function(_$PreferenceModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? type = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$PreferenceModelImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<PreferenceList>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PreferenceModelImpl implements _PreferenceModel {
  const _$PreferenceModelImpl(
      {@JsonKey(name: "status") this.status,
      @JsonKey(name: "type") this.type,
      @JsonKey(name: "message") this.message,
      @JsonKey(name: "data") final List<PreferenceList>? data})
      : _data = data;

  factory _$PreferenceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PreferenceModelImplFromJson(json);

  @override
  @JsonKey(name: "status")
  final int? status;
  @override
  @JsonKey(name: "type")
  final String? type;
  @override
  @JsonKey(name: "message")
  final String? message;
  final List<PreferenceList>? _data;
  @override
  @JsonKey(name: "data")
  List<PreferenceList>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PreferenceModel(status: $status, type: $type, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreferenceModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, type, message,
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PreferenceModelImplCopyWith<_$PreferenceModelImpl> get copyWith =>
      __$$PreferenceModelImplCopyWithImpl<_$PreferenceModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PreferenceModelImplToJson(
      this,
    );
  }
}

abstract class _PreferenceModel implements PreferenceModel {
  const factory _PreferenceModel(
          {@JsonKey(name: "status") final int? status,
          @JsonKey(name: "type") final String? type,
          @JsonKey(name: "message") final String? message,
          @JsonKey(name: "data") final List<PreferenceList>? data}) =
      _$PreferenceModelImpl;

  factory _PreferenceModel.fromJson(Map<String, dynamic> json) =
      _$PreferenceModelImpl.fromJson;

  @override
  @JsonKey(name: "status")
  int? get status;
  @override
  @JsonKey(name: "type")
  String? get type;
  @override
  @JsonKey(name: "message")
  String? get message;
  @override
  @JsonKey(name: "data")
  List<PreferenceList>? get data;
  @override
  @JsonKey(ignore: true)
  _$$PreferenceModelImplCopyWith<_$PreferenceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PreferenceList _$PreferenceListFromJson(Map<String, dynamic> json) {
  return _PreferenceList.fromJson(json);
}

/// @nodoc
mixin _$PreferenceList {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: "status")
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PreferenceListCopyWith<PreferenceList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreferenceListCopyWith<$Res> {
  factory $PreferenceListCopyWith(
          PreferenceList value, $Res Function(PreferenceList) then) =
      _$PreferenceListCopyWithImpl<$Res, PreferenceList>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "status") String? status});
}

/// @nodoc
class _$PreferenceListCopyWithImpl<$Res, $Val extends PreferenceList>
    implements $PreferenceListCopyWith<$Res> {
  _$PreferenceListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PreferenceListImplCopyWith<$Res>
    implements $PreferenceListCopyWith<$Res> {
  factory _$$PreferenceListImplCopyWith(_$PreferenceListImpl value,
          $Res Function(_$PreferenceListImpl) then) =
      __$$PreferenceListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "status") String? status});
}

/// @nodoc
class __$$PreferenceListImplCopyWithImpl<$Res>
    extends _$PreferenceListCopyWithImpl<$Res, _$PreferenceListImpl>
    implements _$$PreferenceListImplCopyWith<$Res> {
  __$$PreferenceListImplCopyWithImpl(
      _$PreferenceListImpl _value, $Res Function(_$PreferenceListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? status = freezed,
  }) {
    return _then(_$PreferenceListImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PreferenceListImpl implements _PreferenceList {
  const _$PreferenceListImpl(
      {@JsonKey(name: "_id") this.id,
      @JsonKey(name: "title") this.title,
      @JsonKey(name: "status") this.status});

  factory _$PreferenceListImpl.fromJson(Map<String, dynamic> json) =>
      _$$PreferenceListImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  @JsonKey(name: "title")
  final String? title;
  @override
  @JsonKey(name: "status")
  final String? status;

  @override
  String toString() {
    return 'PreferenceList(id: $id, title: $title, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreferenceListImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PreferenceListImplCopyWith<_$PreferenceListImpl> get copyWith =>
      __$$PreferenceListImplCopyWithImpl<_$PreferenceListImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PreferenceListImplToJson(
      this,
    );
  }
}

abstract class _PreferenceList implements PreferenceList {
  const factory _PreferenceList(
      {@JsonKey(name: "_id") final String? id,
      @JsonKey(name: "title") final String? title,
      @JsonKey(name: "status") final String? status}) = _$PreferenceListImpl;

  factory _PreferenceList.fromJson(Map<String, dynamic> json) =
      _$PreferenceListImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  @JsonKey(name: "title")
  String? get title;
  @override
  @JsonKey(name: "status")
  String? get status;
  @override
  @JsonKey(ignore: true)
  _$$PreferenceListImplCopyWith<_$PreferenceListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
