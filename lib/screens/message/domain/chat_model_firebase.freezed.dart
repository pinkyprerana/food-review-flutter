// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_model_firebase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatModel _$ChatModelFromJson(Map<String, dynamic> json) {
  return _ChatModel.fromJson(json);
}

/// @nodoc
mixin _$ChatModel {
  String get chatAttachment => throw _privateConstructorUsedError;
  int get createdAt => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String get reaction => throw _privateConstructorUsedError;
  bool get read => throw _privateConstructorUsedError;
  String get receiverID => throw _privateConstructorUsedError;
  String get senderID => throw _privateConstructorUsedError;
  ReplyTo? get replyTo => throw _privateConstructorUsedError;

  /// Serializes this ChatModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatModelCopyWith<ChatModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatModelCopyWith<$Res> {
  factory $ChatModelCopyWith(ChatModel value, $Res Function(ChatModel) then) =
      _$ChatModelCopyWithImpl<$Res, ChatModel>;
  @useResult
  $Res call(
      {String chatAttachment,
      int createdAt,
      String? message,
      String reaction,
      bool read,
      String receiverID,
      String senderID,
      ReplyTo? replyTo});

  $ReplyToCopyWith<$Res>? get replyTo;
}

/// @nodoc
class _$ChatModelCopyWithImpl<$Res, $Val extends ChatModel>
    implements $ChatModelCopyWith<$Res> {
  _$ChatModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatAttachment = null,
    Object? createdAt = null,
    Object? message = freezed,
    Object? reaction = null,
    Object? read = null,
    Object? receiverID = null,
    Object? senderID = null,
    Object? replyTo = freezed,
  }) {
    return _then(_value.copyWith(
      chatAttachment: null == chatAttachment
          ? _value.chatAttachment
          : chatAttachment // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      reaction: null == reaction
          ? _value.reaction
          : reaction // ignore: cast_nullable_to_non_nullable
              as String,
      read: null == read
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool,
      receiverID: null == receiverID
          ? _value.receiverID
          : receiverID // ignore: cast_nullable_to_non_nullable
              as String,
      senderID: null == senderID
          ? _value.senderID
          : senderID // ignore: cast_nullable_to_non_nullable
              as String,
      replyTo: freezed == replyTo
          ? _value.replyTo
          : replyTo // ignore: cast_nullable_to_non_nullable
              as ReplyTo?,
    ) as $Val);
  }

  /// Create a copy of ChatModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReplyToCopyWith<$Res>? get replyTo {
    if (_value.replyTo == null) {
      return null;
    }

    return $ReplyToCopyWith<$Res>(_value.replyTo!, (value) {
      return _then(_value.copyWith(replyTo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatModelImplCopyWith<$Res>
    implements $ChatModelCopyWith<$Res> {
  factory _$$ChatModelImplCopyWith(
          _$ChatModelImpl value, $Res Function(_$ChatModelImpl) then) =
      __$$ChatModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String chatAttachment,
      int createdAt,
      String? message,
      String reaction,
      bool read,
      String receiverID,
      String senderID,
      ReplyTo? replyTo});

  @override
  $ReplyToCopyWith<$Res>? get replyTo;
}

/// @nodoc
class __$$ChatModelImplCopyWithImpl<$Res>
    extends _$ChatModelCopyWithImpl<$Res, _$ChatModelImpl>
    implements _$$ChatModelImplCopyWith<$Res> {
  __$$ChatModelImplCopyWithImpl(
      _$ChatModelImpl _value, $Res Function(_$ChatModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatAttachment = null,
    Object? createdAt = null,
    Object? message = freezed,
    Object? reaction = null,
    Object? read = null,
    Object? receiverID = null,
    Object? senderID = null,
    Object? replyTo = freezed,
  }) {
    return _then(_$ChatModelImpl(
      chatAttachment: null == chatAttachment
          ? _value.chatAttachment
          : chatAttachment // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      reaction: null == reaction
          ? _value.reaction
          : reaction // ignore: cast_nullable_to_non_nullable
              as String,
      read: null == read
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool,
      receiverID: null == receiverID
          ? _value.receiverID
          : receiverID // ignore: cast_nullable_to_non_nullable
              as String,
      senderID: null == senderID
          ? _value.senderID
          : senderID // ignore: cast_nullable_to_non_nullable
              as String,
      replyTo: freezed == replyTo
          ? _value.replyTo
          : replyTo // ignore: cast_nullable_to_non_nullable
              as ReplyTo?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatModelImpl implements _ChatModel {
  const _$ChatModelImpl(
      {required this.chatAttachment,
      required this.createdAt,
      required this.message,
      required this.reaction,
      required this.read,
      required this.receiverID,
      required this.senderID,
      this.replyTo});

  factory _$ChatModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatModelImplFromJson(json);

  @override
  final String chatAttachment;
  @override
  final int createdAt;
  @override
  final String? message;
  @override
  final String reaction;
  @override
  final bool read;
  @override
  final String receiverID;
  @override
  final String senderID;
  @override
  final ReplyTo? replyTo;

  @override
  String toString() {
    return 'ChatModel(chatAttachment: $chatAttachment, createdAt: $createdAt, message: $message, reaction: $reaction, read: $read, receiverID: $receiverID, senderID: $senderID, replyTo: $replyTo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatModelImpl &&
            (identical(other.chatAttachment, chatAttachment) ||
                other.chatAttachment == chatAttachment) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.reaction, reaction) ||
                other.reaction == reaction) &&
            (identical(other.read, read) || other.read == read) &&
            (identical(other.receiverID, receiverID) ||
                other.receiverID == receiverID) &&
            (identical(other.senderID, senderID) ||
                other.senderID == senderID) &&
            (identical(other.replyTo, replyTo) || other.replyTo == replyTo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, chatAttachment, createdAt,
      message, reaction, read, receiverID, senderID, replyTo);

  /// Create a copy of ChatModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatModelImplCopyWith<_$ChatModelImpl> get copyWith =>
      __$$ChatModelImplCopyWithImpl<_$ChatModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatModelImplToJson(
      this,
    );
  }
}

abstract class _ChatModel implements ChatModel {
  const factory _ChatModel(
      {required final String chatAttachment,
      required final int createdAt,
      required final String? message,
      required final String reaction,
      required final bool read,
      required final String receiverID,
      required final String senderID,
      final ReplyTo? replyTo}) = _$ChatModelImpl;

  factory _ChatModel.fromJson(Map<String, dynamic> json) =
      _$ChatModelImpl.fromJson;

  @override
  String get chatAttachment;
  @override
  int get createdAt;
  @override
  String? get message;
  @override
  String get reaction;
  @override
  bool get read;
  @override
  String get receiverID;
  @override
  String get senderID;
  @override
  ReplyTo? get replyTo;

  /// Create a copy of ChatModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatModelImplCopyWith<_$ChatModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReplyTo _$ReplyToFromJson(Map<String, dynamic> json) {
  return _ReplyTo.fromJson(json);
}

/// @nodoc
mixin _$ReplyTo {
  String get messageId => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String get chatAttachment => throw _privateConstructorUsedError;

  /// Serializes this ReplyTo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReplyTo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReplyToCopyWith<ReplyTo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReplyToCopyWith<$Res> {
  factory $ReplyToCopyWith(ReplyTo value, $Res Function(ReplyTo) then) =
      _$ReplyToCopyWithImpl<$Res, ReplyTo>;
  @useResult
  $Res call({String messageId, String? message, String chatAttachment});
}

/// @nodoc
class _$ReplyToCopyWithImpl<$Res, $Val extends ReplyTo>
    implements $ReplyToCopyWith<$Res> {
  _$ReplyToCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReplyTo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageId = null,
    Object? message = freezed,
    Object? chatAttachment = null,
  }) {
    return _then(_value.copyWith(
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      chatAttachment: null == chatAttachment
          ? _value.chatAttachment
          : chatAttachment // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReplyToImplCopyWith<$Res> implements $ReplyToCopyWith<$Res> {
  factory _$$ReplyToImplCopyWith(
          _$ReplyToImpl value, $Res Function(_$ReplyToImpl) then) =
      __$$ReplyToImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String messageId, String? message, String chatAttachment});
}

/// @nodoc
class __$$ReplyToImplCopyWithImpl<$Res>
    extends _$ReplyToCopyWithImpl<$Res, _$ReplyToImpl>
    implements _$$ReplyToImplCopyWith<$Res> {
  __$$ReplyToImplCopyWithImpl(
      _$ReplyToImpl _value, $Res Function(_$ReplyToImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReplyTo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageId = null,
    Object? message = freezed,
    Object? chatAttachment = null,
  }) {
    return _then(_$ReplyToImpl(
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      chatAttachment: null == chatAttachment
          ? _value.chatAttachment
          : chatAttachment // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReplyToImpl implements _ReplyTo {
  const _$ReplyToImpl(
      {required this.messageId,
      required this.message,
      required this.chatAttachment});

  factory _$ReplyToImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReplyToImplFromJson(json);

  @override
  final String messageId;
  @override
  final String? message;
  @override
  final String chatAttachment;

  @override
  String toString() {
    return 'ReplyTo(messageId: $messageId, message: $message, chatAttachment: $chatAttachment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReplyToImpl &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.chatAttachment, chatAttachment) ||
                other.chatAttachment == chatAttachment));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, messageId, message, chatAttachment);

  /// Create a copy of ReplyTo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReplyToImplCopyWith<_$ReplyToImpl> get copyWith =>
      __$$ReplyToImplCopyWithImpl<_$ReplyToImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReplyToImplToJson(
      this,
    );
  }
}

abstract class _ReplyTo implements ReplyTo {
  const factory _ReplyTo(
      {required final String messageId,
      required final String? message,
      required final String chatAttachment}) = _$ReplyToImpl;

  factory _ReplyTo.fromJson(Map<String, dynamic> json) = _$ReplyToImpl.fromJson;

  @override
  String get messageId;
  @override
  String? get message;
  @override
  String get chatAttachment;

  /// Create a copy of ReplyTo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReplyToImplCopyWith<_$ReplyToImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
