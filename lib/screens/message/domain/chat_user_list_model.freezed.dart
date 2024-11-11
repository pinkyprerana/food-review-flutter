// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_user_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatUserListModel _$ChatUserListModelFromJson(Map<String, dynamic> json) {
  return _ChatUserListModel.fromJson(json);
}

/// @nodoc
mixin _$ChatUserListModel {
  @JsonKey(name: "status")
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "type")
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  DataOfChatListModel? get data => throw _privateConstructorUsedError;
  @JsonKey(name: "video_room")
  String? get videoRoom => throw _privateConstructorUsedError;

  /// Serializes this ChatUserListModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatUserListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatUserListModelCopyWith<ChatUserListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatUserListModelCopyWith<$Res> {
  factory $ChatUserListModelCopyWith(
          ChatUserListModel value, $Res Function(ChatUserListModel) then) =
      _$ChatUserListModelCopyWithImpl<$Res, ChatUserListModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "status") int? status,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") DataOfChatListModel? data,
      @JsonKey(name: "video_room") String? videoRoom});

  $DataOfChatListModelCopyWith<$Res>? get data;
}

/// @nodoc
class _$ChatUserListModelCopyWithImpl<$Res, $Val extends ChatUserListModel>
    implements $ChatUserListModelCopyWith<$Res> {
  _$ChatUserListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatUserListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? type = freezed,
    Object? message = freezed,
    Object? data = freezed,
    Object? videoRoom = freezed,
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
              as DataOfChatListModel?,
      videoRoom: freezed == videoRoom
          ? _value.videoRoom
          : videoRoom // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of ChatUserListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataOfChatListModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $DataOfChatListModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatUserListModelImplCopyWith<$Res>
    implements $ChatUserListModelCopyWith<$Res> {
  factory _$$ChatUserListModelImplCopyWith(_$ChatUserListModelImpl value,
          $Res Function(_$ChatUserListModelImpl) then) =
      __$$ChatUserListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "status") int? status,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") DataOfChatListModel? data,
      @JsonKey(name: "video_room") String? videoRoom});

  @override
  $DataOfChatListModelCopyWith<$Res>? get data;
}

/// @nodoc
class __$$ChatUserListModelImplCopyWithImpl<$Res>
    extends _$ChatUserListModelCopyWithImpl<$Res, _$ChatUserListModelImpl>
    implements _$$ChatUserListModelImplCopyWith<$Res> {
  __$$ChatUserListModelImplCopyWithImpl(_$ChatUserListModelImpl _value,
      $Res Function(_$ChatUserListModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatUserListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? type = freezed,
    Object? message = freezed,
    Object? data = freezed,
    Object? videoRoom = freezed,
  }) {
    return _then(_$ChatUserListModelImpl(
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
              as DataOfChatListModel?,
      videoRoom: freezed == videoRoom
          ? _value.videoRoom
          : videoRoom // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatUserListModelImpl implements _ChatUserListModel {
  const _$ChatUserListModelImpl(
      {@JsonKey(name: "status") this.status,
      @JsonKey(name: "type") this.type,
      @JsonKey(name: "message") this.message,
      @JsonKey(name: "data") this.data,
      @JsonKey(name: "video_room") this.videoRoom});

  factory _$ChatUserListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatUserListModelImplFromJson(json);

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
  final DataOfChatListModel? data;
  @override
  @JsonKey(name: "video_room")
  final String? videoRoom;

  @override
  String toString() {
    return 'ChatUserListModel(status: $status, type: $type, message: $message, data: $data, videoRoom: $videoRoom)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatUserListModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.videoRoom, videoRoom) ||
                other.videoRoom == videoRoom));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, status, type, message, data, videoRoom);

  /// Create a copy of ChatUserListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatUserListModelImplCopyWith<_$ChatUserListModelImpl> get copyWith =>
      __$$ChatUserListModelImplCopyWithImpl<_$ChatUserListModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatUserListModelImplToJson(
      this,
    );
  }
}

abstract class _ChatUserListModel implements ChatUserListModel {
  const factory _ChatUserListModel(
          {@JsonKey(name: "status") final int? status,
          @JsonKey(name: "type") final String? type,
          @JsonKey(name: "message") final String? message,
          @JsonKey(name: "data") final DataOfChatListModel? data,
          @JsonKey(name: "video_room") final String? videoRoom}) =
      _$ChatUserListModelImpl;

  factory _ChatUserListModel.fromJson(Map<String, dynamic> json) =
      _$ChatUserListModelImpl.fromJson;

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
  DataOfChatListModel? get data;
  @override
  @JsonKey(name: "video_room")
  String? get videoRoom;

  /// Create a copy of ChatUserListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatUserListModelImplCopyWith<_$ChatUserListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DataOfChatListModel _$DataOfChatListModelFromJson(Map<String, dynamic> json) {
  return _DataOfChatListModel.fromJson(json);
}

/// @nodoc
mixin _$DataOfChatListModel {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "creator_id")
  String? get creatorId => throw _privateConstructorUsedError;
  @JsonKey(name: "user_id")
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: "chat_token")
  String? get chatToken => throw _privateConstructorUsedError;
  @JsonKey(name: "user_unread_count")
  int? get userUnreadCount => throw _privateConstructorUsedError;
  @JsonKey(name: "creator_unread_count")
  int? get creatorUnreadCount => throw _privateConstructorUsedError;
  @JsonKey(name: "new")
  bool? get dataNew => throw _privateConstructorUsedError;
  @JsonKey(name: "isBlocked")
  bool? get isBlocked => throw _privateConstructorUsedError;
  @JsonKey(name: "isDeleted")
  bool? get isDeleted => throw _privateConstructorUsedError;
  @JsonKey(name: "chat_date")
  String? get chatDate => throw _privateConstructorUsedError;
  @JsonKey(name: "createdAt")
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updatedAt")
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this DataOfChatListModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DataOfChatListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DataOfChatListModelCopyWith<DataOfChatListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataOfChatListModelCopyWith<$Res> {
  factory $DataOfChatListModelCopyWith(
          DataOfChatListModel value, $Res Function(DataOfChatListModel) then) =
      _$DataOfChatListModelCopyWithImpl<$Res, DataOfChatListModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "creator_id") String? creatorId,
      @JsonKey(name: "user_id") String? userId,
      @JsonKey(name: "chat_token") String? chatToken,
      @JsonKey(name: "user_unread_count") int? userUnreadCount,
      @JsonKey(name: "creator_unread_count") int? creatorUnreadCount,
      @JsonKey(name: "new") bool? dataNew,
      @JsonKey(name: "isBlocked") bool? isBlocked,
      @JsonKey(name: "isDeleted") bool? isDeleted,
      @JsonKey(name: "chat_date") String? chatDate,
      @JsonKey(name: "createdAt") String? createdAt,
      @JsonKey(name: "updatedAt") String? updatedAt});
}

/// @nodoc
class _$DataOfChatListModelCopyWithImpl<$Res, $Val extends DataOfChatListModel>
    implements $DataOfChatListModelCopyWith<$Res> {
  _$DataOfChatListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DataOfChatListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? creatorId = freezed,
    Object? userId = freezed,
    Object? chatToken = freezed,
    Object? userUnreadCount = freezed,
    Object? creatorUnreadCount = freezed,
    Object? dataNew = freezed,
    Object? isBlocked = freezed,
    Object? isDeleted = freezed,
    Object? chatDate = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      creatorId: freezed == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      chatToken: freezed == chatToken
          ? _value.chatToken
          : chatToken // ignore: cast_nullable_to_non_nullable
              as String?,
      userUnreadCount: freezed == userUnreadCount
          ? _value.userUnreadCount
          : userUnreadCount // ignore: cast_nullable_to_non_nullable
              as int?,
      creatorUnreadCount: freezed == creatorUnreadCount
          ? _value.creatorUnreadCount
          : creatorUnreadCount // ignore: cast_nullable_to_non_nullable
              as int?,
      dataNew: freezed == dataNew
          ? _value.dataNew
          : dataNew // ignore: cast_nullable_to_non_nullable
              as bool?,
      isBlocked: freezed == isBlocked
          ? _value.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as bool?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      chatDate: freezed == chatDate
          ? _value.chatDate
          : chatDate // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataOfChatListModelImplCopyWith<$Res>
    implements $DataOfChatListModelCopyWith<$Res> {
  factory _$$DataOfChatListModelImplCopyWith(_$DataOfChatListModelImpl value,
          $Res Function(_$DataOfChatListModelImpl) then) =
      __$$DataOfChatListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "creator_id") String? creatorId,
      @JsonKey(name: "user_id") String? userId,
      @JsonKey(name: "chat_token") String? chatToken,
      @JsonKey(name: "user_unread_count") int? userUnreadCount,
      @JsonKey(name: "creator_unread_count") int? creatorUnreadCount,
      @JsonKey(name: "new") bool? dataNew,
      @JsonKey(name: "isBlocked") bool? isBlocked,
      @JsonKey(name: "isDeleted") bool? isDeleted,
      @JsonKey(name: "chat_date") String? chatDate,
      @JsonKey(name: "createdAt") String? createdAt,
      @JsonKey(name: "updatedAt") String? updatedAt});
}

/// @nodoc
class __$$DataOfChatListModelImplCopyWithImpl<$Res>
    extends _$DataOfChatListModelCopyWithImpl<$Res, _$DataOfChatListModelImpl>
    implements _$$DataOfChatListModelImplCopyWith<$Res> {
  __$$DataOfChatListModelImplCopyWithImpl(_$DataOfChatListModelImpl _value,
      $Res Function(_$DataOfChatListModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DataOfChatListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? creatorId = freezed,
    Object? userId = freezed,
    Object? chatToken = freezed,
    Object? userUnreadCount = freezed,
    Object? creatorUnreadCount = freezed,
    Object? dataNew = freezed,
    Object? isBlocked = freezed,
    Object? isDeleted = freezed,
    Object? chatDate = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$DataOfChatListModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      creatorId: freezed == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      chatToken: freezed == chatToken
          ? _value.chatToken
          : chatToken // ignore: cast_nullable_to_non_nullable
              as String?,
      userUnreadCount: freezed == userUnreadCount
          ? _value.userUnreadCount
          : userUnreadCount // ignore: cast_nullable_to_non_nullable
              as int?,
      creatorUnreadCount: freezed == creatorUnreadCount
          ? _value.creatorUnreadCount
          : creatorUnreadCount // ignore: cast_nullable_to_non_nullable
              as int?,
      dataNew: freezed == dataNew
          ? _value.dataNew
          : dataNew // ignore: cast_nullable_to_non_nullable
              as bool?,
      isBlocked: freezed == isBlocked
          ? _value.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as bool?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      chatDate: freezed == chatDate
          ? _value.chatDate
          : chatDate // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataOfChatListModelImpl implements _DataOfChatListModel {
  const _$DataOfChatListModelImpl(
      {@JsonKey(name: "_id") this.id,
      @JsonKey(name: "creator_id") this.creatorId,
      @JsonKey(name: "user_id") this.userId,
      @JsonKey(name: "chat_token") this.chatToken,
      @JsonKey(name: "user_unread_count") this.userUnreadCount,
      @JsonKey(name: "creator_unread_count") this.creatorUnreadCount,
      @JsonKey(name: "new") this.dataNew,
      @JsonKey(name: "isBlocked") this.isBlocked,
      @JsonKey(name: "isDeleted") this.isDeleted,
      @JsonKey(name: "chat_date") this.chatDate,
      @JsonKey(name: "createdAt") this.createdAt,
      @JsonKey(name: "updatedAt") this.updatedAt});

  factory _$DataOfChatListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataOfChatListModelImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  @JsonKey(name: "creator_id")
  final String? creatorId;
  @override
  @JsonKey(name: "user_id")
  final String? userId;
  @override
  @JsonKey(name: "chat_token")
  final String? chatToken;
  @override
  @JsonKey(name: "user_unread_count")
  final int? userUnreadCount;
  @override
  @JsonKey(name: "creator_unread_count")
  final int? creatorUnreadCount;
  @override
  @JsonKey(name: "new")
  final bool? dataNew;
  @override
  @JsonKey(name: "isBlocked")
  final bool? isBlocked;
  @override
  @JsonKey(name: "isDeleted")
  final bool? isDeleted;
  @override
  @JsonKey(name: "chat_date")
  final String? chatDate;
  @override
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @override
  @JsonKey(name: "updatedAt")
  final String? updatedAt;

  @override
  String toString() {
    return 'DataOfChatListModel(id: $id, creatorId: $creatorId, userId: $userId, chatToken: $chatToken, userUnreadCount: $userUnreadCount, creatorUnreadCount: $creatorUnreadCount, dataNew: $dataNew, isBlocked: $isBlocked, isDeleted: $isDeleted, chatDate: $chatDate, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataOfChatListModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.creatorId, creatorId) ||
                other.creatorId == creatorId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.chatToken, chatToken) ||
                other.chatToken == chatToken) &&
            (identical(other.userUnreadCount, userUnreadCount) ||
                other.userUnreadCount == userUnreadCount) &&
            (identical(other.creatorUnreadCount, creatorUnreadCount) ||
                other.creatorUnreadCount == creatorUnreadCount) &&
            (identical(other.dataNew, dataNew) || other.dataNew == dataNew) &&
            (identical(other.isBlocked, isBlocked) ||
                other.isBlocked == isBlocked) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.chatDate, chatDate) ||
                other.chatDate == chatDate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      creatorId,
      userId,
      chatToken,
      userUnreadCount,
      creatorUnreadCount,
      dataNew,
      isBlocked,
      isDeleted,
      chatDate,
      createdAt,
      updatedAt);

  /// Create a copy of DataOfChatListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataOfChatListModelImplCopyWith<_$DataOfChatListModelImpl> get copyWith =>
      __$$DataOfChatListModelImplCopyWithImpl<_$DataOfChatListModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataOfChatListModelImplToJson(
      this,
    );
  }
}

abstract class _DataOfChatListModel implements DataOfChatListModel {
  const factory _DataOfChatListModel(
          {@JsonKey(name: "_id") final String? id,
          @JsonKey(name: "creator_id") final String? creatorId,
          @JsonKey(name: "user_id") final String? userId,
          @JsonKey(name: "chat_token") final String? chatToken,
          @JsonKey(name: "user_unread_count") final int? userUnreadCount,
          @JsonKey(name: "creator_unread_count") final int? creatorUnreadCount,
          @JsonKey(name: "new") final bool? dataNew,
          @JsonKey(name: "isBlocked") final bool? isBlocked,
          @JsonKey(name: "isDeleted") final bool? isDeleted,
          @JsonKey(name: "chat_date") final String? chatDate,
          @JsonKey(name: "createdAt") final String? createdAt,
          @JsonKey(name: "updatedAt") final String? updatedAt}) =
      _$DataOfChatListModelImpl;

  factory _DataOfChatListModel.fromJson(Map<String, dynamic> json) =
      _$DataOfChatListModelImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  @JsonKey(name: "creator_id")
  String? get creatorId;
  @override
  @JsonKey(name: "user_id")
  String? get userId;
  @override
  @JsonKey(name: "chat_token")
  String? get chatToken;
  @override
  @JsonKey(name: "user_unread_count")
  int? get userUnreadCount;
  @override
  @JsonKey(name: "creator_unread_count")
  int? get creatorUnreadCount;
  @override
  @JsonKey(name: "new")
  bool? get dataNew;
  @override
  @JsonKey(name: "isBlocked")
  bool? get isBlocked;
  @override
  @JsonKey(name: "isDeleted")
  bool? get isDeleted;
  @override
  @JsonKey(name: "chat_date")
  String? get chatDate;
  @override
  @JsonKey(name: "createdAt")
  String? get createdAt;
  @override
  @JsonKey(name: "updatedAt")
  String? get updatedAt;

  /// Create a copy of DataOfChatListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataOfChatListModelImplCopyWith<_$DataOfChatListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
