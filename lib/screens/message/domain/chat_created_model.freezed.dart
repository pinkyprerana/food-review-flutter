// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_created_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatCreatedModel _$ChatCreatedModelFromJson(Map<String, dynamic> json) {
  return _ChatCreatedModel.fromJson(json);
}

/// @nodoc
mixin _$ChatCreatedModel {
  @JsonKey(name: "status")
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "type")
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  DataOfChat? get dataOfChat => throw _privateConstructorUsedError;
  @JsonKey(name: "video_room")
  String? get videoRoom => throw _privateConstructorUsedError;

  /// Serializes this ChatCreatedModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatCreatedModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatCreatedModelCopyWith<ChatCreatedModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatCreatedModelCopyWith<$Res> {
  factory $ChatCreatedModelCopyWith(
          ChatCreatedModel value, $Res Function(ChatCreatedModel) then) =
      _$ChatCreatedModelCopyWithImpl<$Res, ChatCreatedModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "status") int? status,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") DataOfChat? dataOfChat,
      @JsonKey(name: "video_room") String? videoRoom});

  $DataOfChatCopyWith<$Res>? get dataOfChat;
}

/// @nodoc
class _$ChatCreatedModelCopyWithImpl<$Res, $Val extends ChatCreatedModel>
    implements $ChatCreatedModelCopyWith<$Res> {
  _$ChatCreatedModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatCreatedModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? type = freezed,
    Object? message = freezed,
    Object? dataOfChat = freezed,
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
      dataOfChat: freezed == dataOfChat
          ? _value.dataOfChat
          : dataOfChat // ignore: cast_nullable_to_non_nullable
              as DataOfChat?,
      videoRoom: freezed == videoRoom
          ? _value.videoRoom
          : videoRoom // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of ChatCreatedModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataOfChatCopyWith<$Res>? get dataOfChat {
    if (_value.dataOfChat == null) {
      return null;
    }

    return $DataOfChatCopyWith<$Res>(_value.dataOfChat!, (value) {
      return _then(_value.copyWith(dataOfChat: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatCreatedModelImplCopyWith<$Res>
    implements $ChatCreatedModelCopyWith<$Res> {
  factory _$$ChatCreatedModelImplCopyWith(_$ChatCreatedModelImpl value,
          $Res Function(_$ChatCreatedModelImpl) then) =
      __$$ChatCreatedModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "status") int? status,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") DataOfChat? dataOfChat,
      @JsonKey(name: "video_room") String? videoRoom});

  @override
  $DataOfChatCopyWith<$Res>? get dataOfChat;
}

/// @nodoc
class __$$ChatCreatedModelImplCopyWithImpl<$Res>
    extends _$ChatCreatedModelCopyWithImpl<$Res, _$ChatCreatedModelImpl>
    implements _$$ChatCreatedModelImplCopyWith<$Res> {
  __$$ChatCreatedModelImplCopyWithImpl(_$ChatCreatedModelImpl _value,
      $Res Function(_$ChatCreatedModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatCreatedModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? type = freezed,
    Object? message = freezed,
    Object? dataOfChat = freezed,
    Object? videoRoom = freezed,
  }) {
    return _then(_$ChatCreatedModelImpl(
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
      dataOfChat: freezed == dataOfChat
          ? _value.dataOfChat
          : dataOfChat // ignore: cast_nullable_to_non_nullable
              as DataOfChat?,
      videoRoom: freezed == videoRoom
          ? _value.videoRoom
          : videoRoom // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatCreatedModelImpl implements _ChatCreatedModel {
  const _$ChatCreatedModelImpl(
      {@JsonKey(name: "status") this.status,
      @JsonKey(name: "type") this.type,
      @JsonKey(name: "message") this.message,
      @JsonKey(name: "data") this.dataOfChat,
      @JsonKey(name: "video_room") this.videoRoom});

  factory _$ChatCreatedModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatCreatedModelImplFromJson(json);

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
  final DataOfChat? dataOfChat;
  @override
  @JsonKey(name: "video_room")
  final String? videoRoom;

  @override
  String toString() {
    return 'ChatCreatedModel(status: $status, type: $type, message: $message, dataOfChat: $dataOfChat, videoRoom: $videoRoom)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatCreatedModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.dataOfChat, dataOfChat) ||
                other.dataOfChat == dataOfChat) &&
            (identical(other.videoRoom, videoRoom) ||
                other.videoRoom == videoRoom));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, status, type, message, dataOfChat, videoRoom);

  /// Create a copy of ChatCreatedModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatCreatedModelImplCopyWith<_$ChatCreatedModelImpl> get copyWith =>
      __$$ChatCreatedModelImplCopyWithImpl<_$ChatCreatedModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatCreatedModelImplToJson(
      this,
    );
  }
}

abstract class _ChatCreatedModel implements ChatCreatedModel {
  const factory _ChatCreatedModel(
          {@JsonKey(name: "status") final int? status,
          @JsonKey(name: "type") final String? type,
          @JsonKey(name: "message") final String? message,
          @JsonKey(name: "data") final DataOfChat? dataOfChat,
          @JsonKey(name: "video_room") final String? videoRoom}) =
      _$ChatCreatedModelImpl;

  factory _ChatCreatedModel.fromJson(Map<String, dynamic> json) =
      _$ChatCreatedModelImpl.fromJson;

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
  DataOfChat? get dataOfChat;
  @override
  @JsonKey(name: "video_room")
  String? get videoRoom;

  /// Create a copy of ChatCreatedModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatCreatedModelImplCopyWith<_$ChatCreatedModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DataOfChat _$DataOfChatFromJson(Map<String, dynamic> json) {
  return _DataOfChat.fromJson(json);
}

/// @nodoc
mixin _$DataOfChat {
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
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "chat_date")
  String? get chatDate => throw _privateConstructorUsedError;
  @JsonKey(name: "createdAt")
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updatedAt")
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this DataOfChat to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DataOfChat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DataOfChatCopyWith<DataOfChat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataOfChatCopyWith<$Res> {
  factory $DataOfChatCopyWith(
          DataOfChat value, $Res Function(DataOfChat) then) =
      _$DataOfChatCopyWithImpl<$Res, DataOfChat>;
  @useResult
  $Res call(
      {@JsonKey(name: "creator_id") String? creatorId,
      @JsonKey(name: "user_id") String? userId,
      @JsonKey(name: "chat_token") String? chatToken,
      @JsonKey(name: "user_unread_count") int? userUnreadCount,
      @JsonKey(name: "creator_unread_count") int? creatorUnreadCount,
      @JsonKey(name: "new") bool? dataNew,
      @JsonKey(name: "isBlocked") bool? isBlocked,
      @JsonKey(name: "isDeleted") bool? isDeleted,
      @JsonKey(name: "_id") String? id,
      @JsonKey(name: "chat_date") String? chatDate,
      @JsonKey(name: "createdAt") String? createdAt,
      @JsonKey(name: "updatedAt") String? updatedAt});
}

/// @nodoc
class _$DataOfChatCopyWithImpl<$Res, $Val extends DataOfChat>
    implements $DataOfChatCopyWith<$Res> {
  _$DataOfChatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DataOfChat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? creatorId = freezed,
    Object? userId = freezed,
    Object? chatToken = freezed,
    Object? userUnreadCount = freezed,
    Object? creatorUnreadCount = freezed,
    Object? dataNew = freezed,
    Object? isBlocked = freezed,
    Object? isDeleted = freezed,
    Object? id = freezed,
    Object? chatDate = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
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
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$DataOfChatImplCopyWith<$Res>
    implements $DataOfChatCopyWith<$Res> {
  factory _$$DataOfChatImplCopyWith(
          _$DataOfChatImpl value, $Res Function(_$DataOfChatImpl) then) =
      __$$DataOfChatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "creator_id") String? creatorId,
      @JsonKey(name: "user_id") String? userId,
      @JsonKey(name: "chat_token") String? chatToken,
      @JsonKey(name: "user_unread_count") int? userUnreadCount,
      @JsonKey(name: "creator_unread_count") int? creatorUnreadCount,
      @JsonKey(name: "new") bool? dataNew,
      @JsonKey(name: "isBlocked") bool? isBlocked,
      @JsonKey(name: "isDeleted") bool? isDeleted,
      @JsonKey(name: "_id") String? id,
      @JsonKey(name: "chat_date") String? chatDate,
      @JsonKey(name: "createdAt") String? createdAt,
      @JsonKey(name: "updatedAt") String? updatedAt});
}

/// @nodoc
class __$$DataOfChatImplCopyWithImpl<$Res>
    extends _$DataOfChatCopyWithImpl<$Res, _$DataOfChatImpl>
    implements _$$DataOfChatImplCopyWith<$Res> {
  __$$DataOfChatImplCopyWithImpl(
      _$DataOfChatImpl _value, $Res Function(_$DataOfChatImpl) _then)
      : super(_value, _then);

  /// Create a copy of DataOfChat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? creatorId = freezed,
    Object? userId = freezed,
    Object? chatToken = freezed,
    Object? userUnreadCount = freezed,
    Object? creatorUnreadCount = freezed,
    Object? dataNew = freezed,
    Object? isBlocked = freezed,
    Object? isDeleted = freezed,
    Object? id = freezed,
    Object? chatDate = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$DataOfChatImpl(
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
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$DataOfChatImpl implements _DataOfChat {
  const _$DataOfChatImpl(
      {@JsonKey(name: "creator_id") this.creatorId,
      @JsonKey(name: "user_id") this.userId,
      @JsonKey(name: "chat_token") this.chatToken,
      @JsonKey(name: "user_unread_count") this.userUnreadCount,
      @JsonKey(name: "creator_unread_count") this.creatorUnreadCount,
      @JsonKey(name: "new") this.dataNew,
      @JsonKey(name: "isBlocked") this.isBlocked,
      @JsonKey(name: "isDeleted") this.isDeleted,
      @JsonKey(name: "_id") this.id,
      @JsonKey(name: "chat_date") this.chatDate,
      @JsonKey(name: "createdAt") this.createdAt,
      @JsonKey(name: "updatedAt") this.updatedAt});

  factory _$DataOfChatImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataOfChatImplFromJson(json);

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
  @JsonKey(name: "_id")
  final String? id;
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
    return 'DataOfChat(creatorId: $creatorId, userId: $userId, chatToken: $chatToken, userUnreadCount: $userUnreadCount, creatorUnreadCount: $creatorUnreadCount, dataNew: $dataNew, isBlocked: $isBlocked, isDeleted: $isDeleted, id: $id, chatDate: $chatDate, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataOfChatImpl &&
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
            (identical(other.id, id) || other.id == id) &&
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
      creatorId,
      userId,
      chatToken,
      userUnreadCount,
      creatorUnreadCount,
      dataNew,
      isBlocked,
      isDeleted,
      id,
      chatDate,
      createdAt,
      updatedAt);

  /// Create a copy of DataOfChat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataOfChatImplCopyWith<_$DataOfChatImpl> get copyWith =>
      __$$DataOfChatImplCopyWithImpl<_$DataOfChatImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataOfChatImplToJson(
      this,
    );
  }
}

abstract class _DataOfChat implements DataOfChat {
  const factory _DataOfChat(
      {@JsonKey(name: "creator_id") final String? creatorId,
      @JsonKey(name: "user_id") final String? userId,
      @JsonKey(name: "chat_token") final String? chatToken,
      @JsonKey(name: "user_unread_count") final int? userUnreadCount,
      @JsonKey(name: "creator_unread_count") final int? creatorUnreadCount,
      @JsonKey(name: "new") final bool? dataNew,
      @JsonKey(name: "isBlocked") final bool? isBlocked,
      @JsonKey(name: "isDeleted") final bool? isDeleted,
      @JsonKey(name: "_id") final String? id,
      @JsonKey(name: "chat_date") final String? chatDate,
      @JsonKey(name: "createdAt") final String? createdAt,
      @JsonKey(name: "updatedAt") final String? updatedAt}) = _$DataOfChatImpl;

  factory _DataOfChat.fromJson(Map<String, dynamic> json) =
      _$DataOfChatImpl.fromJson;

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
  @JsonKey(name: "_id")
  String? get id;
  @override
  @JsonKey(name: "chat_date")
  String? get chatDate;
  @override
  @JsonKey(name: "createdAt")
  String? get createdAt;
  @override
  @JsonKey(name: "updatedAt")
  String? get updatedAt;

  /// Create a copy of DataOfChat
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataOfChatImplCopyWith<_$DataOfChatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
