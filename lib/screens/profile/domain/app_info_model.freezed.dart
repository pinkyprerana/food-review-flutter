// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppInfoModel _$AppInfoModelFromJson(Map<String, dynamic> json) {
  return _AppInfoModel.fromJson(json);
}

/// @nodoc
mixin _$AppInfoModel {
  @JsonKey(name: "status")
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "type")
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  AppInfoData? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppInfoModelCopyWith<AppInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppInfoModelCopyWith<$Res> {
  factory $AppInfoModelCopyWith(
          AppInfoModel value, $Res Function(AppInfoModel) then) =
      _$AppInfoModelCopyWithImpl<$Res, AppInfoModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "status") int? status,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") AppInfoData? data});

  $AppInfoDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$AppInfoModelCopyWithImpl<$Res, $Val extends AppInfoModel>
    implements $AppInfoModelCopyWith<$Res> {
  _$AppInfoModelCopyWithImpl(this._value, this._then);

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
              as AppInfoData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AppInfoDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $AppInfoDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppInfoModelImplCopyWith<$Res>
    implements $AppInfoModelCopyWith<$Res> {
  factory _$$AppInfoModelImplCopyWith(
          _$AppInfoModelImpl value, $Res Function(_$AppInfoModelImpl) then) =
      __$$AppInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "status") int? status,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") AppInfoData? data});

  @override
  $AppInfoDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$AppInfoModelImplCopyWithImpl<$Res>
    extends _$AppInfoModelCopyWithImpl<$Res, _$AppInfoModelImpl>
    implements _$$AppInfoModelImplCopyWith<$Res> {
  __$$AppInfoModelImplCopyWithImpl(
      _$AppInfoModelImpl _value, $Res Function(_$AppInfoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? type = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$AppInfoModelImpl(
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
              as AppInfoData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppInfoModelImpl implements _AppInfoModel {
  const _$AppInfoModelImpl(
      {@JsonKey(name: "status") this.status,
      @JsonKey(name: "type") this.type,
      @JsonKey(name: "message") this.message,
      @JsonKey(name: "data") this.data});

  factory _$AppInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppInfoModelImplFromJson(json);

  @override
  @JsonKey(name: "status")
  final int? status;
  @override
  @JsonKey(name: "type")
  final String? type;
  @override
  @JsonKey(name: "message")
  final String? message;
  @override
  @JsonKey(name: "data")
  final AppInfoData? data;

  @override
  String toString() {
    return 'AppInfoModel(status: $status, type: $type, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppInfoModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, type, message, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppInfoModelImplCopyWith<_$AppInfoModelImpl> get copyWith =>
      __$$AppInfoModelImplCopyWithImpl<_$AppInfoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppInfoModelImplToJson(
      this,
    );
  }
}

abstract class _AppInfoModel implements AppInfoModel {
  const factory _AppInfoModel(
      {@JsonKey(name: "status") final int? status,
      @JsonKey(name: "type") final String? type,
      @JsonKey(name: "message") final String? message,
      @JsonKey(name: "data") final AppInfoData? data}) = _$AppInfoModelImpl;

  factory _AppInfoModel.fromJson(Map<String, dynamic> json) =
      _$AppInfoModelImpl.fromJson;

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
  AppInfoData? get data;
  @override
  @JsonKey(ignore: true)
  _$$AppInfoModelImplCopyWith<_$AppInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AppInfoData _$AppInfoDataFromJson(Map<String, dynamic> json) {
  return _AppInfoData.fromJson(json);
}

/// @nodoc
mixin _$AppInfoData {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: "slug")
  String? get slug => throw _privateConstructorUsedError;
  @JsonKey(name: "content")
  String? get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppInfoDataCopyWith<AppInfoData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppInfoDataCopyWith<$Res> {
  factory $AppInfoDataCopyWith(
          AppInfoData value, $Res Function(AppInfoData) then) =
      _$AppInfoDataCopyWithImpl<$Res, AppInfoData>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "slug") String? slug,
      @JsonKey(name: "content") String? content});
}

/// @nodoc
class _$AppInfoDataCopyWithImpl<$Res, $Val extends AppInfoData>
    implements $AppInfoDataCopyWith<$Res> {
  _$AppInfoDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? slug = freezed,
    Object? content = freezed,
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
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppInfoDataImplCopyWith<$Res>
    implements $AppInfoDataCopyWith<$Res> {
  factory _$$AppInfoDataImplCopyWith(
          _$AppInfoDataImpl value, $Res Function(_$AppInfoDataImpl) then) =
      __$$AppInfoDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "slug") String? slug,
      @JsonKey(name: "content") String? content});
}

/// @nodoc
class __$$AppInfoDataImplCopyWithImpl<$Res>
    extends _$AppInfoDataCopyWithImpl<$Res, _$AppInfoDataImpl>
    implements _$$AppInfoDataImplCopyWith<$Res> {
  __$$AppInfoDataImplCopyWithImpl(
      _$AppInfoDataImpl _value, $Res Function(_$AppInfoDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? slug = freezed,
    Object? content = freezed,
  }) {
    return _then(_$AppInfoDataImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppInfoDataImpl implements _AppInfoData {
  const _$AppInfoDataImpl(
      {@JsonKey(name: "_id") this.id,
      @JsonKey(name: "title") this.title,
      @JsonKey(name: "slug") this.slug,
      @JsonKey(name: "content") this.content});

  factory _$AppInfoDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppInfoDataImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  @JsonKey(name: "title")
  final String? title;
  @override
  @JsonKey(name: "slug")
  final String? slug;
  @override
  @JsonKey(name: "content")
  final String? content;

  @override
  String toString() {
    return 'AppInfoData(id: $id, title: $title, slug: $slug, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppInfoDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, slug, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppInfoDataImplCopyWith<_$AppInfoDataImpl> get copyWith =>
      __$$AppInfoDataImplCopyWithImpl<_$AppInfoDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppInfoDataImplToJson(
      this,
    );
  }
}

abstract class _AppInfoData implements AppInfoData {
  const factory _AppInfoData(
      {@JsonKey(name: "_id") final String? id,
      @JsonKey(name: "title") final String? title,
      @JsonKey(name: "slug") final String? slug,
      @JsonKey(name: "content") final String? content}) = _$AppInfoDataImpl;

  factory _AppInfoData.fromJson(Map<String, dynamic> json) =
      _$AppInfoDataImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  @JsonKey(name: "title")
  String? get title;
  @override
  @JsonKey(name: "slug")
  String? get slug;
  @override
  @JsonKey(name: "content")
  String? get content;
  @override
  @JsonKey(ignore: true)
  _$$AppInfoDataImplCopyWith<_$AppInfoDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
