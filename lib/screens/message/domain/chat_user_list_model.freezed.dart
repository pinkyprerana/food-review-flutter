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
  List<DataOfChatList>? get allChatList => throw _privateConstructorUsedError;
  @JsonKey(name: "user_unread_count")
  int? get userUnreadCount => throw _privateConstructorUsedError;

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
      @JsonKey(name: "data") List<DataOfChatList>? allChatList,
      @JsonKey(name: "user_unread_count") int? userUnreadCount});
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
    Object? allChatList = freezed,
    Object? userUnreadCount = freezed,
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
      allChatList: freezed == allChatList
          ? _value.allChatList
          : allChatList // ignore: cast_nullable_to_non_nullable
              as List<DataOfChatList>?,
      userUnreadCount: freezed == userUnreadCount
          ? _value.userUnreadCount
          : userUnreadCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
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
      @JsonKey(name: "data") List<DataOfChatList>? allChatList,
      @JsonKey(name: "user_unread_count") int? userUnreadCount});
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
    Object? allChatList = freezed,
    Object? userUnreadCount = freezed,
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
      allChatList: freezed == allChatList
          ? _value._allChatList
          : allChatList // ignore: cast_nullable_to_non_nullable
              as List<DataOfChatList>?,
      userUnreadCount: freezed == userUnreadCount
          ? _value.userUnreadCount
          : userUnreadCount // ignore: cast_nullable_to_non_nullable
              as int?,
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
      @JsonKey(name: "data") final List<DataOfChatList>? allChatList,
      @JsonKey(name: "user_unread_count") this.userUnreadCount})
      : _allChatList = allChatList;

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
  final List<DataOfChatList>? _allChatList;
  @override
  @JsonKey(name: "data")
  List<DataOfChatList>? get allChatList {
    final value = _allChatList;
    if (value == null) return null;
    if (_allChatList is EqualUnmodifiableListView) return _allChatList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "user_unread_count")
  final int? userUnreadCount;

  @override
  String toString() {
    return 'ChatUserListModel(status: $status, type: $type, message: $message, allChatList: $allChatList, userUnreadCount: $userUnreadCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatUserListModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._allChatList, _allChatList) &&
            (identical(other.userUnreadCount, userUnreadCount) ||
                other.userUnreadCount == userUnreadCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, type, message,
      const DeepCollectionEquality().hash(_allChatList), userUnreadCount);

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
          @JsonKey(name: "data") final List<DataOfChatList>? allChatList,
          @JsonKey(name: "user_unread_count") final int? userUnreadCount}) =
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
  List<DataOfChatList>? get allChatList;
  @override
  @JsonKey(name: "user_unread_count")
  int? get userUnreadCount;

  /// Create a copy of ChatUserListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatUserListModelImplCopyWith<_$ChatUserListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DataOfChatList _$DataOfChatListFromJson(Map<String, dynamic> json) {
  return _DataOfChatList.fromJson(json);
}

/// @nodoc
mixin _$DataOfChatList {
  @JsonKey(name: "userDetails")
  RDetails? get userDetails => throw _privateConstructorUsedError;
  @JsonKey(name: "creatorDetails")
  RDetails? get creatorDetails => throw _privateConstructorUsedError;
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
  @JsonKey(name: "isBlocked")
  bool? get isBlocked => throw _privateConstructorUsedError;
  @JsonKey(name: "isDeleted")
  bool? get isDeleted => throw _privateConstructorUsedError;
  @JsonKey(name: "chat_date")
  String? get chatDate => throw _privateConstructorUsedError;
  @JsonKey(name: "createdAt")
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "last_message")
  LastMessage? get lastMessage => throw _privateConstructorUsedError;
  @JsonKey(name: "isLastMessage")
  bool? get isLastMessage => throw _privateConstructorUsedError;

  /// Serializes this DataOfChatList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DataOfChatList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DataOfChatListCopyWith<DataOfChatList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataOfChatListCopyWith<$Res> {
  factory $DataOfChatListCopyWith(
          DataOfChatList value, $Res Function(DataOfChatList) then) =
      _$DataOfChatListCopyWithImpl<$Res, DataOfChatList>;
  @useResult
  $Res call(
      {@JsonKey(name: "userDetails") RDetails? userDetails,
      @JsonKey(name: "creatorDetails") RDetails? creatorDetails,
      @JsonKey(name: "_id") String? id,
      @JsonKey(name: "creator_id") String? creatorId,
      @JsonKey(name: "user_id") String? userId,
      @JsonKey(name: "chat_token") String? chatToken,
      @JsonKey(name: "user_unread_count") int? userUnreadCount,
      @JsonKey(name: "creator_unread_count") int? creatorUnreadCount,
      @JsonKey(name: "isBlocked") bool? isBlocked,
      @JsonKey(name: "isDeleted") bool? isDeleted,
      @JsonKey(name: "chat_date") String? chatDate,
      @JsonKey(name: "createdAt") String? createdAt,
      @JsonKey(name: "last_message") LastMessage? lastMessage,
      @JsonKey(name: "isLastMessage") bool? isLastMessage});

  $RDetailsCopyWith<$Res>? get userDetails;
  $RDetailsCopyWith<$Res>? get creatorDetails;
  $LastMessageCopyWith<$Res>? get lastMessage;
}

/// @nodoc
class _$DataOfChatListCopyWithImpl<$Res, $Val extends DataOfChatList>
    implements $DataOfChatListCopyWith<$Res> {
  _$DataOfChatListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DataOfChatList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userDetails = freezed,
    Object? creatorDetails = freezed,
    Object? id = freezed,
    Object? creatorId = freezed,
    Object? userId = freezed,
    Object? chatToken = freezed,
    Object? userUnreadCount = freezed,
    Object? creatorUnreadCount = freezed,
    Object? isBlocked = freezed,
    Object? isDeleted = freezed,
    Object? chatDate = freezed,
    Object? createdAt = freezed,
    Object? lastMessage = freezed,
    Object? isLastMessage = freezed,
  }) {
    return _then(_value.copyWith(
      userDetails: freezed == userDetails
          ? _value.userDetails
          : userDetails // ignore: cast_nullable_to_non_nullable
              as RDetails?,
      creatorDetails: freezed == creatorDetails
          ? _value.creatorDetails
          : creatorDetails // ignore: cast_nullable_to_non_nullable
              as RDetails?,
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
      lastMessage: freezed == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as LastMessage?,
      isLastMessage: freezed == isLastMessage
          ? _value.isLastMessage
          : isLastMessage // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  /// Create a copy of DataOfChatList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RDetailsCopyWith<$Res>? get userDetails {
    if (_value.userDetails == null) {
      return null;
    }

    return $RDetailsCopyWith<$Res>(_value.userDetails!, (value) {
      return _then(_value.copyWith(userDetails: value) as $Val);
    });
  }

  /// Create a copy of DataOfChatList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RDetailsCopyWith<$Res>? get creatorDetails {
    if (_value.creatorDetails == null) {
      return null;
    }

    return $RDetailsCopyWith<$Res>(_value.creatorDetails!, (value) {
      return _then(_value.copyWith(creatorDetails: value) as $Val);
    });
  }

  /// Create a copy of DataOfChatList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LastMessageCopyWith<$Res>? get lastMessage {
    if (_value.lastMessage == null) {
      return null;
    }

    return $LastMessageCopyWith<$Res>(_value.lastMessage!, (value) {
      return _then(_value.copyWith(lastMessage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DataOfChatListImplCopyWith<$Res>
    implements $DataOfChatListCopyWith<$Res> {
  factory _$$DataOfChatListImplCopyWith(_$DataOfChatListImpl value,
          $Res Function(_$DataOfChatListImpl) then) =
      __$$DataOfChatListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "userDetails") RDetails? userDetails,
      @JsonKey(name: "creatorDetails") RDetails? creatorDetails,
      @JsonKey(name: "_id") String? id,
      @JsonKey(name: "creator_id") String? creatorId,
      @JsonKey(name: "user_id") String? userId,
      @JsonKey(name: "chat_token") String? chatToken,
      @JsonKey(name: "user_unread_count") int? userUnreadCount,
      @JsonKey(name: "creator_unread_count") int? creatorUnreadCount,
      @JsonKey(name: "isBlocked") bool? isBlocked,
      @JsonKey(name: "isDeleted") bool? isDeleted,
      @JsonKey(name: "chat_date") String? chatDate,
      @JsonKey(name: "createdAt") String? createdAt,
      @JsonKey(name: "last_message") LastMessage? lastMessage,
      @JsonKey(name: "isLastMessage") bool? isLastMessage});

  @override
  $RDetailsCopyWith<$Res>? get userDetails;
  @override
  $RDetailsCopyWith<$Res>? get creatorDetails;
  @override
  $LastMessageCopyWith<$Res>? get lastMessage;
}

/// @nodoc
class __$$DataOfChatListImplCopyWithImpl<$Res>
    extends _$DataOfChatListCopyWithImpl<$Res, _$DataOfChatListImpl>
    implements _$$DataOfChatListImplCopyWith<$Res> {
  __$$DataOfChatListImplCopyWithImpl(
      _$DataOfChatListImpl _value, $Res Function(_$DataOfChatListImpl) _then)
      : super(_value, _then);

  /// Create a copy of DataOfChatList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userDetails = freezed,
    Object? creatorDetails = freezed,
    Object? id = freezed,
    Object? creatorId = freezed,
    Object? userId = freezed,
    Object? chatToken = freezed,
    Object? userUnreadCount = freezed,
    Object? creatorUnreadCount = freezed,
    Object? isBlocked = freezed,
    Object? isDeleted = freezed,
    Object? chatDate = freezed,
    Object? createdAt = freezed,
    Object? lastMessage = freezed,
    Object? isLastMessage = freezed,
  }) {
    return _then(_$DataOfChatListImpl(
      userDetails: freezed == userDetails
          ? _value.userDetails
          : userDetails // ignore: cast_nullable_to_non_nullable
              as RDetails?,
      creatorDetails: freezed == creatorDetails
          ? _value.creatorDetails
          : creatorDetails // ignore: cast_nullable_to_non_nullable
              as RDetails?,
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
      lastMessage: freezed == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as LastMessage?,
      isLastMessage: freezed == isLastMessage
          ? _value.isLastMessage
          : isLastMessage // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataOfChatListImpl implements _DataOfChatList {
  const _$DataOfChatListImpl(
      {@JsonKey(name: "userDetails") this.userDetails,
      @JsonKey(name: "creatorDetails") this.creatorDetails,
      @JsonKey(name: "_id") this.id,
      @JsonKey(name: "creator_id") this.creatorId,
      @JsonKey(name: "user_id") this.userId,
      @JsonKey(name: "chat_token") this.chatToken,
      @JsonKey(name: "user_unread_count") this.userUnreadCount,
      @JsonKey(name: "creator_unread_count") this.creatorUnreadCount,
      @JsonKey(name: "isBlocked") this.isBlocked,
      @JsonKey(name: "isDeleted") this.isDeleted,
      @JsonKey(name: "chat_date") this.chatDate,
      @JsonKey(name: "createdAt") this.createdAt,
      @JsonKey(name: "last_message") this.lastMessage,
      @JsonKey(name: "isLastMessage") this.isLastMessage});

  factory _$DataOfChatListImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataOfChatListImplFromJson(json);

  @override
  @JsonKey(name: "userDetails")
  final RDetails? userDetails;
  @override
  @JsonKey(name: "creatorDetails")
  final RDetails? creatorDetails;
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
  @JsonKey(name: "last_message")
  final LastMessage? lastMessage;
  @override
  @JsonKey(name: "isLastMessage")
  final bool? isLastMessage;

  @override
  String toString() {
    return 'DataOfChatList(userDetails: $userDetails, creatorDetails: $creatorDetails, id: $id, creatorId: $creatorId, userId: $userId, chatToken: $chatToken, userUnreadCount: $userUnreadCount, creatorUnreadCount: $creatorUnreadCount, isBlocked: $isBlocked, isDeleted: $isDeleted, chatDate: $chatDate, createdAt: $createdAt, lastMessage: $lastMessage, isLastMessage: $isLastMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataOfChatListImpl &&
            (identical(other.userDetails, userDetails) ||
                other.userDetails == userDetails) &&
            (identical(other.creatorDetails, creatorDetails) ||
                other.creatorDetails == creatorDetails) &&
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
            (identical(other.isBlocked, isBlocked) ||
                other.isBlocked == isBlocked) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.chatDate, chatDate) ||
                other.chatDate == chatDate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            (identical(other.isLastMessage, isLastMessage) ||
                other.isLastMessage == isLastMessage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userDetails,
      creatorDetails,
      id,
      creatorId,
      userId,
      chatToken,
      userUnreadCount,
      creatorUnreadCount,
      isBlocked,
      isDeleted,
      chatDate,
      createdAt,
      lastMessage,
      isLastMessage);

  /// Create a copy of DataOfChatList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataOfChatListImplCopyWith<_$DataOfChatListImpl> get copyWith =>
      __$$DataOfChatListImplCopyWithImpl<_$DataOfChatListImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataOfChatListImplToJson(
      this,
    );
  }
}

abstract class _DataOfChatList implements DataOfChatList {
  const factory _DataOfChatList(
          {@JsonKey(name: "userDetails") final RDetails? userDetails,
          @JsonKey(name: "creatorDetails") final RDetails? creatorDetails,
          @JsonKey(name: "_id") final String? id,
          @JsonKey(name: "creator_id") final String? creatorId,
          @JsonKey(name: "user_id") final String? userId,
          @JsonKey(name: "chat_token") final String? chatToken,
          @JsonKey(name: "user_unread_count") final int? userUnreadCount,
          @JsonKey(name: "creator_unread_count") final int? creatorUnreadCount,
          @JsonKey(name: "isBlocked") final bool? isBlocked,
          @JsonKey(name: "isDeleted") final bool? isDeleted,
          @JsonKey(name: "chat_date") final String? chatDate,
          @JsonKey(name: "createdAt") final String? createdAt,
          @JsonKey(name: "last_message") final LastMessage? lastMessage,
          @JsonKey(name: "isLastMessage") final bool? isLastMessage}) =
      _$DataOfChatListImpl;

  factory _DataOfChatList.fromJson(Map<String, dynamic> json) =
      _$DataOfChatListImpl.fromJson;

  @override
  @JsonKey(name: "userDetails")
  RDetails? get userDetails;
  @override
  @JsonKey(name: "creatorDetails")
  RDetails? get creatorDetails;
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
  @JsonKey(name: "last_message")
  LastMessage? get lastMessage;
  @override
  @JsonKey(name: "isLastMessage")
  bool? get isLastMessage;

  /// Create a copy of DataOfChatList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataOfChatListImplCopyWith<_$DataOfChatListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RDetails _$RDetailsFromJson(Map<String, dynamic> json) {
  return _RDetails.fromJson(json);
}

/// @nodoc
mixin _$RDetails {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "first_name")
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: "last_name")
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: "profile_image")
  String? get profileImage => throw _privateConstructorUsedError;

  /// Serializes this RDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RDetailsCopyWith<RDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RDetailsCopyWith<$Res> {
  factory $RDetailsCopyWith(RDetails value, $Res Function(RDetails) then) =
      _$RDetailsCopyWithImpl<$Res, RDetails>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "first_name") String? firstName,
      @JsonKey(name: "last_name") String? lastName,
      @JsonKey(name: "profile_image") String? profileImage});
}

/// @nodoc
class _$RDetailsCopyWithImpl<$Res, $Val extends RDetails>
    implements $RDetailsCopyWith<$Res> {
  _$RDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? profileImage = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RDetailsImplCopyWith<$Res>
    implements $RDetailsCopyWith<$Res> {
  factory _$$RDetailsImplCopyWith(
          _$RDetailsImpl value, $Res Function(_$RDetailsImpl) then) =
      __$$RDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "first_name") String? firstName,
      @JsonKey(name: "last_name") String? lastName,
      @JsonKey(name: "profile_image") String? profileImage});
}

/// @nodoc
class __$$RDetailsImplCopyWithImpl<$Res>
    extends _$RDetailsCopyWithImpl<$Res, _$RDetailsImpl>
    implements _$$RDetailsImplCopyWith<$Res> {
  __$$RDetailsImplCopyWithImpl(
      _$RDetailsImpl _value, $Res Function(_$RDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of RDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? profileImage = freezed,
  }) {
    return _then(_$RDetailsImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RDetailsImpl implements _RDetails {
  const _$RDetailsImpl(
      {@JsonKey(name: "_id") this.id,
      @JsonKey(name: "first_name") this.firstName,
      @JsonKey(name: "last_name") this.lastName,
      @JsonKey(name: "profile_image") this.profileImage});

  factory _$RDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$RDetailsImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  @JsonKey(name: "first_name")
  final String? firstName;
  @override
  @JsonKey(name: "last_name")
  final String? lastName;
  @override
  @JsonKey(name: "profile_image")
  final String? profileImage;

  @override
  String toString() {
    return 'RDetails(id: $id, firstName: $firstName, lastName: $lastName, profileImage: $profileImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RDetailsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, firstName, lastName, profileImage);

  /// Create a copy of RDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RDetailsImplCopyWith<_$RDetailsImpl> get copyWith =>
      __$$RDetailsImplCopyWithImpl<_$RDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RDetailsImplToJson(
      this,
    );
  }
}

abstract class _RDetails implements RDetails {
  const factory _RDetails(
          {@JsonKey(name: "_id") final String? id,
          @JsonKey(name: "first_name") final String? firstName,
          @JsonKey(name: "last_name") final String? lastName,
          @JsonKey(name: "profile_image") final String? profileImage}) =
      _$RDetailsImpl;

  factory _RDetails.fromJson(Map<String, dynamic> json) =
      _$RDetailsImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  @JsonKey(name: "first_name")
  String? get firstName;
  @override
  @JsonKey(name: "last_name")
  String? get lastName;
  @override
  @JsonKey(name: "profile_image")
  String? get profileImage;

  /// Create a copy of RDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RDetailsImplCopyWith<_$RDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LastMessage _$LastMessageFromJson(Map<String, dynamic> json) {
  return _LastMessage.fromJson(json);
}

/// @nodoc
mixin _$LastMessage {
  @JsonKey(name: "chatAttachment")
  String? get chatAttachment => throw _privateConstructorUsedError;
  @JsonKey(name: "createdAt")
  int? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "reaction")
  String? get reaction => throw _privateConstructorUsedError;
  @JsonKey(name: "read")
  bool? get read => throw _privateConstructorUsedError;
  @JsonKey(name: "receiverID")
  String? get receiverId => throw _privateConstructorUsedError;
  @JsonKey(name: "senderID")
  String? get senderId => throw _privateConstructorUsedError;

  /// Serializes this LastMessage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LastMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LastMessageCopyWith<LastMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LastMessageCopyWith<$Res> {
  factory $LastMessageCopyWith(
          LastMessage value, $Res Function(LastMessage) then) =
      _$LastMessageCopyWithImpl<$Res, LastMessage>;
  @useResult
  $Res call(
      {@JsonKey(name: "chatAttachment") String? chatAttachment,
      @JsonKey(name: "createdAt") int? createdAt,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "reaction") String? reaction,
      @JsonKey(name: "read") bool? read,
      @JsonKey(name: "receiverID") String? receiverId,
      @JsonKey(name: "senderID") String? senderId});
}

/// @nodoc
class _$LastMessageCopyWithImpl<$Res, $Val extends LastMessage>
    implements $LastMessageCopyWith<$Res> {
  _$LastMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LastMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatAttachment = freezed,
    Object? createdAt = freezed,
    Object? message = freezed,
    Object? reaction = freezed,
    Object? read = freezed,
    Object? receiverId = freezed,
    Object? senderId = freezed,
  }) {
    return _then(_value.copyWith(
      chatAttachment: freezed == chatAttachment
          ? _value.chatAttachment
          : chatAttachment // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      reaction: freezed == reaction
          ? _value.reaction
          : reaction // ignore: cast_nullable_to_non_nullable
              as String?,
      read: freezed == read
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool?,
      receiverId: freezed == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String?,
      senderId: freezed == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LastMessageImplCopyWith<$Res>
    implements $LastMessageCopyWith<$Res> {
  factory _$$LastMessageImplCopyWith(
          _$LastMessageImpl value, $Res Function(_$LastMessageImpl) then) =
      __$$LastMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "chatAttachment") String? chatAttachment,
      @JsonKey(name: "createdAt") int? createdAt,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "reaction") String? reaction,
      @JsonKey(name: "read") bool? read,
      @JsonKey(name: "receiverID") String? receiverId,
      @JsonKey(name: "senderID") String? senderId});
}

/// @nodoc
class __$$LastMessageImplCopyWithImpl<$Res>
    extends _$LastMessageCopyWithImpl<$Res, _$LastMessageImpl>
    implements _$$LastMessageImplCopyWith<$Res> {
  __$$LastMessageImplCopyWithImpl(
      _$LastMessageImpl _value, $Res Function(_$LastMessageImpl) _then)
      : super(_value, _then);

  /// Create a copy of LastMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatAttachment = freezed,
    Object? createdAt = freezed,
    Object? message = freezed,
    Object? reaction = freezed,
    Object? read = freezed,
    Object? receiverId = freezed,
    Object? senderId = freezed,
  }) {
    return _then(_$LastMessageImpl(
      chatAttachment: freezed == chatAttachment
          ? _value.chatAttachment
          : chatAttachment // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      reaction: freezed == reaction
          ? _value.reaction
          : reaction // ignore: cast_nullable_to_non_nullable
              as String?,
      read: freezed == read
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool?,
      receiverId: freezed == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String?,
      senderId: freezed == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LastMessageImpl implements _LastMessage {
  const _$LastMessageImpl(
      {@JsonKey(name: "chatAttachment") this.chatAttachment,
      @JsonKey(name: "createdAt") this.createdAt,
      @JsonKey(name: "message") this.message,
      @JsonKey(name: "reaction") this.reaction,
      @JsonKey(name: "read") this.read,
      @JsonKey(name: "receiverID") this.receiverId,
      @JsonKey(name: "senderID") this.senderId});

  factory _$LastMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$LastMessageImplFromJson(json);

  @override
  @JsonKey(name: "chatAttachment")
  final String? chatAttachment;
  @override
  @JsonKey(name: "createdAt")
  final int? createdAt;
  @override
  @JsonKey(name: "message")
  final String? message;
  @override
  @JsonKey(name: "reaction")
  final String? reaction;
  @override
  @JsonKey(name: "read")
  final bool? read;
  @override
  @JsonKey(name: "receiverID")
  final String? receiverId;
  @override
  @JsonKey(name: "senderID")
  final String? senderId;

  @override
  String toString() {
    return 'LastMessage(chatAttachment: $chatAttachment, createdAt: $createdAt, message: $message, reaction: $reaction, read: $read, receiverId: $receiverId, senderId: $senderId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LastMessageImpl &&
            (identical(other.chatAttachment, chatAttachment) ||
                other.chatAttachment == chatAttachment) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.reaction, reaction) ||
                other.reaction == reaction) &&
            (identical(other.read, read) || other.read == read) &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, chatAttachment, createdAt,
      message, reaction, read, receiverId, senderId);

  /// Create a copy of LastMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LastMessageImplCopyWith<_$LastMessageImpl> get copyWith =>
      __$$LastMessageImplCopyWithImpl<_$LastMessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LastMessageImplToJson(
      this,
    );
  }
}

abstract class _LastMessage implements LastMessage {
  const factory _LastMessage(
      {@JsonKey(name: "chatAttachment") final String? chatAttachment,
      @JsonKey(name: "createdAt") final int? createdAt,
      @JsonKey(name: "message") final String? message,
      @JsonKey(name: "reaction") final String? reaction,
      @JsonKey(name: "read") final bool? read,
      @JsonKey(name: "receiverID") final String? receiverId,
      @JsonKey(name: "senderID") final String? senderId}) = _$LastMessageImpl;

  factory _LastMessage.fromJson(Map<String, dynamic> json) =
      _$LastMessageImpl.fromJson;

  @override
  @JsonKey(name: "chatAttachment")
  String? get chatAttachment;
  @override
  @JsonKey(name: "createdAt")
  int? get createdAt;
  @override
  @JsonKey(name: "message")
  String? get message;
  @override
  @JsonKey(name: "reaction")
  String? get reaction;
  @override
  @JsonKey(name: "read")
  bool? get read;
  @override
  @JsonKey(name: "receiverID")
  String? get receiverId;
  @override
  @JsonKey(name: "senderID")
  String? get senderId;

  /// Create a copy of LastMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LastMessageImplCopyWith<_$LastMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
