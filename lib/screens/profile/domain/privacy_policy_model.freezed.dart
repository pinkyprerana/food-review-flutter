// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'privacy_policy_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PrivacyPolicyModel _$PrivacyPolicyModelFromJson(Map<String, dynamic> json) {
  return _PrivacyPolicyModel.fromJson(json);
}

/// @nodoc
mixin _$PrivacyPolicyModel {
  @JsonKey(name: "status")
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "type")
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  DataOfPrivacyPolicy? get data => throw _privateConstructorUsedError;

  /// Serializes this PrivacyPolicyModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrivacyPolicyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrivacyPolicyModelCopyWith<PrivacyPolicyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrivacyPolicyModelCopyWith<$Res> {
  factory $PrivacyPolicyModelCopyWith(
          PrivacyPolicyModel value, $Res Function(PrivacyPolicyModel) then) =
      _$PrivacyPolicyModelCopyWithImpl<$Res, PrivacyPolicyModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "status") int? status,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") DataOfPrivacyPolicy? data});

  $DataOfPrivacyPolicyCopyWith<$Res>? get data;
}

/// @nodoc
class _$PrivacyPolicyModelCopyWithImpl<$Res, $Val extends PrivacyPolicyModel>
    implements $PrivacyPolicyModelCopyWith<$Res> {
  _$PrivacyPolicyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrivacyPolicyModel
  /// with the given fields replaced by the non-null parameter values.
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
              as DataOfPrivacyPolicy?,
    ) as $Val);
  }

  /// Create a copy of PrivacyPolicyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataOfPrivacyPolicyCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $DataOfPrivacyPolicyCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PrivacyPolicyModelImplCopyWith<$Res>
    implements $PrivacyPolicyModelCopyWith<$Res> {
  factory _$$PrivacyPolicyModelImplCopyWith(_$PrivacyPolicyModelImpl value,
          $Res Function(_$PrivacyPolicyModelImpl) then) =
      __$$PrivacyPolicyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "status") int? status,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") DataOfPrivacyPolicy? data});

  @override
  $DataOfPrivacyPolicyCopyWith<$Res>? get data;
}

/// @nodoc
class __$$PrivacyPolicyModelImplCopyWithImpl<$Res>
    extends _$PrivacyPolicyModelCopyWithImpl<$Res, _$PrivacyPolicyModelImpl>
    implements _$$PrivacyPolicyModelImplCopyWith<$Res> {
  __$$PrivacyPolicyModelImplCopyWithImpl(_$PrivacyPolicyModelImpl _value,
      $Res Function(_$PrivacyPolicyModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrivacyPolicyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? type = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$PrivacyPolicyModelImpl(
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
              as DataOfPrivacyPolicy?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PrivacyPolicyModelImpl implements _PrivacyPolicyModel {
  const _$PrivacyPolicyModelImpl(
      {@JsonKey(name: "status") this.status,
      @JsonKey(name: "type") this.type,
      @JsonKey(name: "message") this.message,
      @JsonKey(name: "data") this.data});

  factory _$PrivacyPolicyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrivacyPolicyModelImplFromJson(json);

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
  final DataOfPrivacyPolicy? data;

  @override
  String toString() {
    return 'PrivacyPolicyModel(status: $status, type: $type, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrivacyPolicyModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, type, message, data);

  /// Create a copy of PrivacyPolicyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrivacyPolicyModelImplCopyWith<_$PrivacyPolicyModelImpl> get copyWith =>
      __$$PrivacyPolicyModelImplCopyWithImpl<_$PrivacyPolicyModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrivacyPolicyModelImplToJson(
      this,
    );
  }
}

abstract class _PrivacyPolicyModel implements PrivacyPolicyModel {
  const factory _PrivacyPolicyModel(
          {@JsonKey(name: "status") final int? status,
          @JsonKey(name: "type") final String? type,
          @JsonKey(name: "message") final String? message,
          @JsonKey(name: "data") final DataOfPrivacyPolicy? data}) =
      _$PrivacyPolicyModelImpl;

  factory _PrivacyPolicyModel.fromJson(Map<String, dynamic> json) =
      _$PrivacyPolicyModelImpl.fromJson;

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
  DataOfPrivacyPolicy? get data;

  /// Create a copy of PrivacyPolicyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrivacyPolicyModelImplCopyWith<_$PrivacyPolicyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DataOfPrivacyPolicy _$DataOfPrivacyPolicyFromJson(Map<String, dynamic> json) {
  return _DataOfPrivacyPolicy.fromJson(json);
}

/// @nodoc
mixin _$DataOfPrivacyPolicy {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: "slug")
  String? get slug => throw _privateConstructorUsedError;
  @JsonKey(name: "content")
  String? get content => throw _privateConstructorUsedError;

  /// Serializes this DataOfPrivacyPolicy to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DataOfPrivacyPolicy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DataOfPrivacyPolicyCopyWith<DataOfPrivacyPolicy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataOfPrivacyPolicyCopyWith<$Res> {
  factory $DataOfPrivacyPolicyCopyWith(
          DataOfPrivacyPolicy value, $Res Function(DataOfPrivacyPolicy) then) =
      _$DataOfPrivacyPolicyCopyWithImpl<$Res, DataOfPrivacyPolicy>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "slug") String? slug,
      @JsonKey(name: "content") String? content});
}

/// @nodoc
class _$DataOfPrivacyPolicyCopyWithImpl<$Res, $Val extends DataOfPrivacyPolicy>
    implements $DataOfPrivacyPolicyCopyWith<$Res> {
  _$DataOfPrivacyPolicyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DataOfPrivacyPolicy
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$DataOfPrivacyPolicyImplCopyWith<$Res>
    implements $DataOfPrivacyPolicyCopyWith<$Res> {
  factory _$$DataOfPrivacyPolicyImplCopyWith(_$DataOfPrivacyPolicyImpl value,
          $Res Function(_$DataOfPrivacyPolicyImpl) then) =
      __$$DataOfPrivacyPolicyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "slug") String? slug,
      @JsonKey(name: "content") String? content});
}

/// @nodoc
class __$$DataOfPrivacyPolicyImplCopyWithImpl<$Res>
    extends _$DataOfPrivacyPolicyCopyWithImpl<$Res, _$DataOfPrivacyPolicyImpl>
    implements _$$DataOfPrivacyPolicyImplCopyWith<$Res> {
  __$$DataOfPrivacyPolicyImplCopyWithImpl(_$DataOfPrivacyPolicyImpl _value,
      $Res Function(_$DataOfPrivacyPolicyImpl) _then)
      : super(_value, _then);

  /// Create a copy of DataOfPrivacyPolicy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? slug = freezed,
    Object? content = freezed,
  }) {
    return _then(_$DataOfPrivacyPolicyImpl(
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
class _$DataOfPrivacyPolicyImpl implements _DataOfPrivacyPolicy {
  const _$DataOfPrivacyPolicyImpl(
      {@JsonKey(name: "_id") this.id,
      @JsonKey(name: "title") this.title,
      @JsonKey(name: "slug") this.slug,
      @JsonKey(name: "content") this.content});

  factory _$DataOfPrivacyPolicyImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataOfPrivacyPolicyImplFromJson(json);

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
    return 'DataOfPrivacyPolicy(id: $id, title: $title, slug: $slug, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataOfPrivacyPolicyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, slug, content);

  /// Create a copy of DataOfPrivacyPolicy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataOfPrivacyPolicyImplCopyWith<_$DataOfPrivacyPolicyImpl> get copyWith =>
      __$$DataOfPrivacyPolicyImplCopyWithImpl<_$DataOfPrivacyPolicyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataOfPrivacyPolicyImplToJson(
      this,
    );
  }
}

abstract class _DataOfPrivacyPolicy implements DataOfPrivacyPolicy {
  const factory _DataOfPrivacyPolicy(
          {@JsonKey(name: "_id") final String? id,
          @JsonKey(name: "title") final String? title,
          @JsonKey(name: "slug") final String? slug,
          @JsonKey(name: "content") final String? content}) =
      _$DataOfPrivacyPolicyImpl;

  factory _DataOfPrivacyPolicy.fromJson(Map<String, dynamic> json) =
      _$DataOfPrivacyPolicyImpl.fromJson;

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

  /// Create a copy of DataOfPrivacyPolicy
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataOfPrivacyPolicyImplCopyWith<_$DataOfPrivacyPolicyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
