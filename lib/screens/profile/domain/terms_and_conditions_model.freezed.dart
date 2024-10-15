// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'terms_and_conditions_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TermsAndConditionsModel _$TermsAndConditionsModelFromJson(
    Map<String, dynamic> json) {
  return _TermsAndConditionsModel.fromJson(json);
}

/// @nodoc
mixin _$TermsAndConditionsModel {
  @JsonKey(name: "status")
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "type")
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  DataOfTermsAndConditions? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TermsAndConditionsModelCopyWith<TermsAndConditionsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TermsAndConditionsModelCopyWith<$Res> {
  factory $TermsAndConditionsModelCopyWith(TermsAndConditionsModel value,
          $Res Function(TermsAndConditionsModel) then) =
      _$TermsAndConditionsModelCopyWithImpl<$Res, TermsAndConditionsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "status") int? status,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") DataOfTermsAndConditions? data});

  $DataOfTermsAndConditionsCopyWith<$Res>? get data;
}

/// @nodoc
class _$TermsAndConditionsModelCopyWithImpl<$Res,
        $Val extends TermsAndConditionsModel>
    implements $TermsAndConditionsModelCopyWith<$Res> {
  _$TermsAndConditionsModelCopyWithImpl(this._value, this._then);

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
              as DataOfTermsAndConditions?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DataOfTermsAndConditionsCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $DataOfTermsAndConditionsCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TermsAndConditionsModelImplCopyWith<$Res>
    implements $TermsAndConditionsModelCopyWith<$Res> {
  factory _$$TermsAndConditionsModelImplCopyWith(
          _$TermsAndConditionsModelImpl value,
          $Res Function(_$TermsAndConditionsModelImpl) then) =
      __$$TermsAndConditionsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "status") int? status,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") DataOfTermsAndConditions? data});

  @override
  $DataOfTermsAndConditionsCopyWith<$Res>? get data;
}

/// @nodoc
class __$$TermsAndConditionsModelImplCopyWithImpl<$Res>
    extends _$TermsAndConditionsModelCopyWithImpl<$Res,
        _$TermsAndConditionsModelImpl>
    implements _$$TermsAndConditionsModelImplCopyWith<$Res> {
  __$$TermsAndConditionsModelImplCopyWithImpl(
      _$TermsAndConditionsModelImpl _value,
      $Res Function(_$TermsAndConditionsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? type = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$TermsAndConditionsModelImpl(
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
              as DataOfTermsAndConditions?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TermsAndConditionsModelImpl implements _TermsAndConditionsModel {
  const _$TermsAndConditionsModelImpl(
      {@JsonKey(name: "status") this.status,
      @JsonKey(name: "type") this.type,
      @JsonKey(name: "message") this.message,
      @JsonKey(name: "data") this.data});

  factory _$TermsAndConditionsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TermsAndConditionsModelImplFromJson(json);

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
  final DataOfTermsAndConditions? data;

  @override
  String toString() {
    return 'TermsAndConditionsModel(status: $status, type: $type, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TermsAndConditionsModelImpl &&
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
  _$$TermsAndConditionsModelImplCopyWith<_$TermsAndConditionsModelImpl>
      get copyWith => __$$TermsAndConditionsModelImplCopyWithImpl<
          _$TermsAndConditionsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TermsAndConditionsModelImplToJson(
      this,
    );
  }
}

abstract class _TermsAndConditionsModel implements TermsAndConditionsModel {
  const factory _TermsAndConditionsModel(
          {@JsonKey(name: "status") final int? status,
          @JsonKey(name: "type") final String? type,
          @JsonKey(name: "message") final String? message,
          @JsonKey(name: "data") final DataOfTermsAndConditions? data}) =
      _$TermsAndConditionsModelImpl;

  factory _TermsAndConditionsModel.fromJson(Map<String, dynamic> json) =
      _$TermsAndConditionsModelImpl.fromJson;

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
  DataOfTermsAndConditions? get data;
  @override
  @JsonKey(ignore: true)
  _$$TermsAndConditionsModelImplCopyWith<_$TermsAndConditionsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DataOfTermsAndConditions _$DataOfTermsAndConditionsFromJson(
    Map<String, dynamic> json) {
  return _DataOfTermsAndConditions.fromJson(json);
}

/// @nodoc
mixin _$DataOfTermsAndConditions {
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
  $DataOfTermsAndConditionsCopyWith<DataOfTermsAndConditions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataOfTermsAndConditionsCopyWith<$Res> {
  factory $DataOfTermsAndConditionsCopyWith(DataOfTermsAndConditions value,
          $Res Function(DataOfTermsAndConditions) then) =
      _$DataOfTermsAndConditionsCopyWithImpl<$Res, DataOfTermsAndConditions>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "slug") String? slug,
      @JsonKey(name: "content") String? content});
}

/// @nodoc
class _$DataOfTermsAndConditionsCopyWithImpl<$Res,
        $Val extends DataOfTermsAndConditions>
    implements $DataOfTermsAndConditionsCopyWith<$Res> {
  _$DataOfTermsAndConditionsCopyWithImpl(this._value, this._then);

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
abstract class _$$DataOfTermsAndConditionsImplCopyWith<$Res>
    implements $DataOfTermsAndConditionsCopyWith<$Res> {
  factory _$$DataOfTermsAndConditionsImplCopyWith(
          _$DataOfTermsAndConditionsImpl value,
          $Res Function(_$DataOfTermsAndConditionsImpl) then) =
      __$$DataOfTermsAndConditionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "slug") String? slug,
      @JsonKey(name: "content") String? content});
}

/// @nodoc
class __$$DataOfTermsAndConditionsImplCopyWithImpl<$Res>
    extends _$DataOfTermsAndConditionsCopyWithImpl<$Res,
        _$DataOfTermsAndConditionsImpl>
    implements _$$DataOfTermsAndConditionsImplCopyWith<$Res> {
  __$$DataOfTermsAndConditionsImplCopyWithImpl(
      _$DataOfTermsAndConditionsImpl _value,
      $Res Function(_$DataOfTermsAndConditionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? slug = freezed,
    Object? content = freezed,
  }) {
    return _then(_$DataOfTermsAndConditionsImpl(
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
class _$DataOfTermsAndConditionsImpl implements _DataOfTermsAndConditions {
  const _$DataOfTermsAndConditionsImpl(
      {@JsonKey(name: "_id") this.id,
      @JsonKey(name: "title") this.title,
      @JsonKey(name: "slug") this.slug,
      @JsonKey(name: "content") this.content});

  factory _$DataOfTermsAndConditionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataOfTermsAndConditionsImplFromJson(json);

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
    return 'DataOfTermsAndConditions(id: $id, title: $title, slug: $slug, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataOfTermsAndConditionsImpl &&
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
  _$$DataOfTermsAndConditionsImplCopyWith<_$DataOfTermsAndConditionsImpl>
      get copyWith => __$$DataOfTermsAndConditionsImplCopyWithImpl<
          _$DataOfTermsAndConditionsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataOfTermsAndConditionsImplToJson(
      this,
    );
  }
}

abstract class _DataOfTermsAndConditions implements DataOfTermsAndConditions {
  const factory _DataOfTermsAndConditions(
          {@JsonKey(name: "_id") final String? id,
          @JsonKey(name: "title") final String? title,
          @JsonKey(name: "slug") final String? slug,
          @JsonKey(name: "content") final String? content}) =
      _$DataOfTermsAndConditionsImpl;

  factory _DataOfTermsAndConditions.fromJson(Map<String, dynamic> json) =
      _$DataOfTermsAndConditionsImpl.fromJson;

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
  _$$DataOfTermsAndConditionsImplCopyWith<_$DataOfTermsAndConditionsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
