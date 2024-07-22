// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) {
  return _NotificationModel.fromJson(json);
}

/// @nodoc
mixin _$NotificationModel {
  @JsonKey(name: "status")
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "type")
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  List<NotificationData> get notificationList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "total")
  int? get total => throw _privateConstructorUsedError;
  @JsonKey(name: "page")
  int? get page => throw _privateConstructorUsedError;
  @JsonKey(name: "pages")
  int? get pages => throw _privateConstructorUsedError;
  @JsonKey(name: "limit")
  int? get limit => throw _privateConstructorUsedError;
  @JsonKey(name: "readAll")
  bool? get readAll => throw _privateConstructorUsedError;
  @JsonKey(name: "unread_count")
  int? get unreadCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationModelCopyWith<NotificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationModelCopyWith<$Res> {
  factory $NotificationModelCopyWith(
          NotificationModel value, $Res Function(NotificationModel) then) =
      _$NotificationModelCopyWithImpl<$Res, NotificationModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "status") int? status,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") List<NotificationData> notificationList,
      @JsonKey(name: "total") int? total,
      @JsonKey(name: "page") int? page,
      @JsonKey(name: "pages") int? pages,
      @JsonKey(name: "limit") int? limit,
      @JsonKey(name: "readAll") bool? readAll,
      @JsonKey(name: "unread_count") int? unreadCount});
}

/// @nodoc
class _$NotificationModelCopyWithImpl<$Res, $Val extends NotificationModel>
    implements $NotificationModelCopyWith<$Res> {
  _$NotificationModelCopyWithImpl(this._value, this._then);

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
    Object? notificationList = null,
    Object? total = freezed,
    Object? page = freezed,
    Object? pages = freezed,
    Object? limit = freezed,
    Object? readAll = freezed,
    Object? unreadCount = freezed,
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
      notificationList: null == notificationList
          ? _value.notificationList
          : notificationList // ignore: cast_nullable_to_non_nullable
              as List<NotificationData>,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      pages: freezed == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      readAll: freezed == readAll
          ? _value.readAll
          : readAll // ignore: cast_nullable_to_non_nullable
              as bool?,
      unreadCount: freezed == unreadCount
          ? _value.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationModelImplCopyWith<$Res>
    implements $NotificationModelCopyWith<$Res> {
  factory _$$NotificationModelImplCopyWith(_$NotificationModelImpl value,
          $Res Function(_$NotificationModelImpl) then) =
      __$$NotificationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "status") int? status,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") List<NotificationData> notificationList,
      @JsonKey(name: "total") int? total,
      @JsonKey(name: "page") int? page,
      @JsonKey(name: "pages") int? pages,
      @JsonKey(name: "limit") int? limit,
      @JsonKey(name: "readAll") bool? readAll,
      @JsonKey(name: "unread_count") int? unreadCount});
}

/// @nodoc
class __$$NotificationModelImplCopyWithImpl<$Res>
    extends _$NotificationModelCopyWithImpl<$Res, _$NotificationModelImpl>
    implements _$$NotificationModelImplCopyWith<$Res> {
  __$$NotificationModelImplCopyWithImpl(_$NotificationModelImpl _value,
      $Res Function(_$NotificationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? type = freezed,
    Object? message = freezed,
    Object? notificationList = null,
    Object? total = freezed,
    Object? page = freezed,
    Object? pages = freezed,
    Object? limit = freezed,
    Object? readAll = freezed,
    Object? unreadCount = freezed,
  }) {
    return _then(_$NotificationModelImpl(
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
      notificationList: null == notificationList
          ? _value._notificationList
          : notificationList // ignore: cast_nullable_to_non_nullable
              as List<NotificationData>,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      pages: freezed == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      readAll: freezed == readAll
          ? _value.readAll
          : readAll // ignore: cast_nullable_to_non_nullable
              as bool?,
      unreadCount: freezed == unreadCount
          ? _value.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationModelImpl implements _NotificationModel {
  const _$NotificationModelImpl(
      {@JsonKey(name: "status") this.status,
      @JsonKey(name: "type") this.type,
      @JsonKey(name: "message") this.message,
      @JsonKey(name: "data")
      required final List<NotificationData> notificationList,
      @JsonKey(name: "total") this.total,
      @JsonKey(name: "page") this.page,
      @JsonKey(name: "pages") this.pages,
      @JsonKey(name: "limit") this.limit,
      @JsonKey(name: "readAll") this.readAll,
      @JsonKey(name: "unread_count") this.unreadCount})
      : _notificationList = notificationList;

  factory _$NotificationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationModelImplFromJson(json);

  @override
  @JsonKey(name: "status")
  final int? status;
  @override
  @JsonKey(name: "type")
  final String? type;
  @override
  @JsonKey(name: "message")
  final String? message;
  final List<NotificationData> _notificationList;
  @override
  @JsonKey(name: "data")
  List<NotificationData> get notificationList {
    if (_notificationList is EqualUnmodifiableListView)
      return _notificationList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notificationList);
  }

  @override
  @JsonKey(name: "total")
  final int? total;
  @override
  @JsonKey(name: "page")
  final int? page;
  @override
  @JsonKey(name: "pages")
  final int? pages;
  @override
  @JsonKey(name: "limit")
  final int? limit;
  @override
  @JsonKey(name: "readAll")
  final bool? readAll;
  @override
  @JsonKey(name: "unread_count")
  final int? unreadCount;

  @override
  String toString() {
    return 'NotificationModel(status: $status, type: $type, message: $message, notificationList: $notificationList, total: $total, page: $page, pages: $pages, limit: $limit, readAll: $readAll, unreadCount: $unreadCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._notificationList, _notificationList) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pages, pages) || other.pages == pages) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.readAll, readAll) || other.readAll == readAll) &&
            (identical(other.unreadCount, unreadCount) ||
                other.unreadCount == unreadCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      type,
      message,
      const DeepCollectionEquality().hash(_notificationList),
      total,
      page,
      pages,
      limit,
      readAll,
      unreadCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationModelImplCopyWith<_$NotificationModelImpl> get copyWith =>
      __$$NotificationModelImplCopyWithImpl<_$NotificationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationModelImplToJson(
      this,
    );
  }
}

abstract class _NotificationModel implements NotificationModel {
  const factory _NotificationModel(
          {@JsonKey(name: "status") final int? status,
          @JsonKey(name: "type") final String? type,
          @JsonKey(name: "message") final String? message,
          @JsonKey(name: "data")
          required final List<NotificationData> notificationList,
          @JsonKey(name: "total") final int? total,
          @JsonKey(name: "page") final int? page,
          @JsonKey(name: "pages") final int? pages,
          @JsonKey(name: "limit") final int? limit,
          @JsonKey(name: "readAll") final bool? readAll,
          @JsonKey(name: "unread_count") final int? unreadCount}) =
      _$NotificationModelImpl;

  factory _NotificationModel.fromJson(Map<String, dynamic> json) =
      _$NotificationModelImpl.fromJson;

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
  List<NotificationData> get notificationList;
  @override
  @JsonKey(name: "total")
  int? get total;
  @override
  @JsonKey(name: "page")
  int? get page;
  @override
  @JsonKey(name: "pages")
  int? get pages;
  @override
  @JsonKey(name: "limit")
  int? get limit;
  @override
  @JsonKey(name: "readAll")
  bool? get readAll;
  @override
  @JsonKey(name: "unread_count")
  int? get unreadCount;
  @override
  @JsonKey(ignore: true)
  _$$NotificationModelImplCopyWith<_$NotificationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NotificationData _$NotificationDataFromJson(Map<String, dynamic> json) {
  return _NotificationData.fromJson(json);
}

/// @nodoc
mixin _$NotificationData {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: "type")
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: "ref_post_id")
  String? get refPostId => throw _privateConstructorUsedError;
  @JsonKey(name: "ref_user_follow_id")
  String? get refUserFollowId => throw _privateConstructorUsedError;
  @JsonKey(name: "ref_post_comment_id")
  String? get refPostCommentId => throw _privateConstructorUsedError;
  @JsonKey(name: "ref_post_like_id")
  String? get refPostLikeId => throw _privateConstructorUsedError;
  @JsonKey(name: "ref_post_save_id")
  String? get refPostSaveId => throw _privateConstructorUsedError;
  @JsonKey(name: "status")
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: "read_status")
  bool get readStatus => throw _privateConstructorUsedError;
  @JsonKey(name: "createdAt")
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "posted_user_info")
  UserNotificationInfo get postedUserInfo => throw _privateConstructorUsedError;
  @JsonKey(name: "receiver_user_info")
  UserNotificationInfo get receiverUserInfo =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationDataCopyWith<NotificationData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationDataCopyWith<$Res> {
  factory $NotificationDataCopyWith(
          NotificationData value, $Res Function(NotificationData) then) =
      _$NotificationDataCopyWithImpl<$Res, NotificationData>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      @JsonKey(name: "title") String title,
      @JsonKey(name: "message") String message,
      @JsonKey(name: "type") String type,
      @JsonKey(name: "ref_post_id") String? refPostId,
      @JsonKey(name: "ref_user_follow_id") String? refUserFollowId,
      @JsonKey(name: "ref_post_comment_id") String? refPostCommentId,
      @JsonKey(name: "ref_post_like_id") String? refPostLikeId,
      @JsonKey(name: "ref_post_save_id") String? refPostSaveId,
      @JsonKey(name: "status") String status,
      @JsonKey(name: "read_status") bool readStatus,
      @JsonKey(name: "createdAt") DateTime createdAt,
      @JsonKey(name: "posted_user_info") UserNotificationInfo postedUserInfo,
      @JsonKey(name: "receiver_user_info")
      UserNotificationInfo receiverUserInfo});

  $UserNotificationInfoCopyWith<$Res> get postedUserInfo;
  $UserNotificationInfoCopyWith<$Res> get receiverUserInfo;
}

/// @nodoc
class _$NotificationDataCopyWithImpl<$Res, $Val extends NotificationData>
    implements $NotificationDataCopyWith<$Res> {
  _$NotificationDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? message = null,
    Object? type = null,
    Object? refPostId = freezed,
    Object? refUserFollowId = freezed,
    Object? refPostCommentId = freezed,
    Object? refPostLikeId = freezed,
    Object? refPostSaveId = freezed,
    Object? status = null,
    Object? readStatus = null,
    Object? createdAt = null,
    Object? postedUserInfo = null,
    Object? receiverUserInfo = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      refPostId: freezed == refPostId
          ? _value.refPostId
          : refPostId // ignore: cast_nullable_to_non_nullable
              as String?,
      refUserFollowId: freezed == refUserFollowId
          ? _value.refUserFollowId
          : refUserFollowId // ignore: cast_nullable_to_non_nullable
              as String?,
      refPostCommentId: freezed == refPostCommentId
          ? _value.refPostCommentId
          : refPostCommentId // ignore: cast_nullable_to_non_nullable
              as String?,
      refPostLikeId: freezed == refPostLikeId
          ? _value.refPostLikeId
          : refPostLikeId // ignore: cast_nullable_to_non_nullable
              as String?,
      refPostSaveId: freezed == refPostSaveId
          ? _value.refPostSaveId
          : refPostSaveId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      readStatus: null == readStatus
          ? _value.readStatus
          : readStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      postedUserInfo: null == postedUserInfo
          ? _value.postedUserInfo
          : postedUserInfo // ignore: cast_nullable_to_non_nullable
              as UserNotificationInfo,
      receiverUserInfo: null == receiverUserInfo
          ? _value.receiverUserInfo
          : receiverUserInfo // ignore: cast_nullable_to_non_nullable
              as UserNotificationInfo,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserNotificationInfoCopyWith<$Res> get postedUserInfo {
    return $UserNotificationInfoCopyWith<$Res>(_value.postedUserInfo, (value) {
      return _then(_value.copyWith(postedUserInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserNotificationInfoCopyWith<$Res> get receiverUserInfo {
    return $UserNotificationInfoCopyWith<$Res>(_value.receiverUserInfo,
        (value) {
      return _then(_value.copyWith(receiverUserInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NotificationDataImplCopyWith<$Res>
    implements $NotificationDataCopyWith<$Res> {
  factory _$$NotificationDataImplCopyWith(_$NotificationDataImpl value,
          $Res Function(_$NotificationDataImpl) then) =
      __$$NotificationDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      @JsonKey(name: "title") String title,
      @JsonKey(name: "message") String message,
      @JsonKey(name: "type") String type,
      @JsonKey(name: "ref_post_id") String? refPostId,
      @JsonKey(name: "ref_user_follow_id") String? refUserFollowId,
      @JsonKey(name: "ref_post_comment_id") String? refPostCommentId,
      @JsonKey(name: "ref_post_like_id") String? refPostLikeId,
      @JsonKey(name: "ref_post_save_id") String? refPostSaveId,
      @JsonKey(name: "status") String status,
      @JsonKey(name: "read_status") bool readStatus,
      @JsonKey(name: "createdAt") DateTime createdAt,
      @JsonKey(name: "posted_user_info") UserNotificationInfo postedUserInfo,
      @JsonKey(name: "receiver_user_info")
      UserNotificationInfo receiverUserInfo});

  @override
  $UserNotificationInfoCopyWith<$Res> get postedUserInfo;
  @override
  $UserNotificationInfoCopyWith<$Res> get receiverUserInfo;
}

/// @nodoc
class __$$NotificationDataImplCopyWithImpl<$Res>
    extends _$NotificationDataCopyWithImpl<$Res, _$NotificationDataImpl>
    implements _$$NotificationDataImplCopyWith<$Res> {
  __$$NotificationDataImplCopyWithImpl(_$NotificationDataImpl _value,
      $Res Function(_$NotificationDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? message = null,
    Object? type = null,
    Object? refPostId = freezed,
    Object? refUserFollowId = freezed,
    Object? refPostCommentId = freezed,
    Object? refPostLikeId = freezed,
    Object? refPostSaveId = freezed,
    Object? status = null,
    Object? readStatus = null,
    Object? createdAt = null,
    Object? postedUserInfo = null,
    Object? receiverUserInfo = null,
  }) {
    return _then(_$NotificationDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      refPostId: freezed == refPostId
          ? _value.refPostId
          : refPostId // ignore: cast_nullable_to_non_nullable
              as String?,
      refUserFollowId: freezed == refUserFollowId
          ? _value.refUserFollowId
          : refUserFollowId // ignore: cast_nullable_to_non_nullable
              as String?,
      refPostCommentId: freezed == refPostCommentId
          ? _value.refPostCommentId
          : refPostCommentId // ignore: cast_nullable_to_non_nullable
              as String?,
      refPostLikeId: freezed == refPostLikeId
          ? _value.refPostLikeId
          : refPostLikeId // ignore: cast_nullable_to_non_nullable
              as String?,
      refPostSaveId: freezed == refPostSaveId
          ? _value.refPostSaveId
          : refPostSaveId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      readStatus: null == readStatus
          ? _value.readStatus
          : readStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      postedUserInfo: null == postedUserInfo
          ? _value.postedUserInfo
          : postedUserInfo // ignore: cast_nullable_to_non_nullable
              as UserNotificationInfo,
      receiverUserInfo: null == receiverUserInfo
          ? _value.receiverUserInfo
          : receiverUserInfo // ignore: cast_nullable_to_non_nullable
              as UserNotificationInfo,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationDataImpl implements _NotificationData {
  const _$NotificationDataImpl(
      {@JsonKey(name: "_id") required this.id,
      @JsonKey(name: "title") required this.title,
      @JsonKey(name: "message") required this.message,
      @JsonKey(name: "type") required this.type,
      @JsonKey(name: "ref_post_id") this.refPostId,
      @JsonKey(name: "ref_user_follow_id") this.refUserFollowId,
      @JsonKey(name: "ref_post_comment_id") this.refPostCommentId,
      @JsonKey(name: "ref_post_like_id") this.refPostLikeId,
      @JsonKey(name: "ref_post_save_id") this.refPostSaveId,
      @JsonKey(name: "status") required this.status,
      @JsonKey(name: "read_status") required this.readStatus,
      @JsonKey(name: "createdAt") required this.createdAt,
      @JsonKey(name: "posted_user_info") required this.postedUserInfo,
      @JsonKey(name: "receiver_user_info") required this.receiverUserInfo});

  factory _$NotificationDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationDataImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  @JsonKey(name: "title")
  final String title;
  @override
  @JsonKey(name: "message")
  final String message;
  @override
  @JsonKey(name: "type")
  final String type;
  @override
  @JsonKey(name: "ref_post_id")
  final String? refPostId;
  @override
  @JsonKey(name: "ref_user_follow_id")
  final String? refUserFollowId;
  @override
  @JsonKey(name: "ref_post_comment_id")
  final String? refPostCommentId;
  @override
  @JsonKey(name: "ref_post_like_id")
  final String? refPostLikeId;
  @override
  @JsonKey(name: "ref_post_save_id")
  final String? refPostSaveId;
  @override
  @JsonKey(name: "status")
  final String status;
  @override
  @JsonKey(name: "read_status")
  final bool readStatus;
  @override
  @JsonKey(name: "createdAt")
  final DateTime createdAt;
  @override
  @JsonKey(name: "posted_user_info")
  final UserNotificationInfo postedUserInfo;
  @override
  @JsonKey(name: "receiver_user_info")
  final UserNotificationInfo receiverUserInfo;

  @override
  String toString() {
    return 'NotificationData(id: $id, title: $title, message: $message, type: $type, refPostId: $refPostId, refUserFollowId: $refUserFollowId, refPostCommentId: $refPostCommentId, refPostLikeId: $refPostLikeId, refPostSaveId: $refPostSaveId, status: $status, readStatus: $readStatus, createdAt: $createdAt, postedUserInfo: $postedUserInfo, receiverUserInfo: $receiverUserInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.refPostId, refPostId) ||
                other.refPostId == refPostId) &&
            (identical(other.refUserFollowId, refUserFollowId) ||
                other.refUserFollowId == refUserFollowId) &&
            (identical(other.refPostCommentId, refPostCommentId) ||
                other.refPostCommentId == refPostCommentId) &&
            (identical(other.refPostLikeId, refPostLikeId) ||
                other.refPostLikeId == refPostLikeId) &&
            (identical(other.refPostSaveId, refPostSaveId) ||
                other.refPostSaveId == refPostSaveId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.readStatus, readStatus) ||
                other.readStatus == readStatus) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.postedUserInfo, postedUserInfo) ||
                other.postedUserInfo == postedUserInfo) &&
            (identical(other.receiverUserInfo, receiverUserInfo) ||
                other.receiverUserInfo == receiverUserInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      message,
      type,
      refPostId,
      refUserFollowId,
      refPostCommentId,
      refPostLikeId,
      refPostSaveId,
      status,
      readStatus,
      createdAt,
      postedUserInfo,
      receiverUserInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationDataImplCopyWith<_$NotificationDataImpl> get copyWith =>
      __$$NotificationDataImplCopyWithImpl<_$NotificationDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationDataImplToJson(
      this,
    );
  }
}

abstract class _NotificationData implements NotificationData {
  const factory _NotificationData(
          {@JsonKey(name: "_id") required final String id,
          @JsonKey(name: "title") required final String title,
          @JsonKey(name: "message") required final String message,
          @JsonKey(name: "type") required final String type,
          @JsonKey(name: "ref_post_id") final String? refPostId,
          @JsonKey(name: "ref_user_follow_id") final String? refUserFollowId,
          @JsonKey(name: "ref_post_comment_id") final String? refPostCommentId,
          @JsonKey(name: "ref_post_like_id") final String? refPostLikeId,
          @JsonKey(name: "ref_post_save_id") final String? refPostSaveId,
          @JsonKey(name: "status") required final String status,
          @JsonKey(name: "read_status") required final bool readStatus,
          @JsonKey(name: "createdAt") required final DateTime createdAt,
          @JsonKey(name: "posted_user_info")
          required final UserNotificationInfo postedUserInfo,
          @JsonKey(name: "receiver_user_info")
          required final UserNotificationInfo receiverUserInfo}) =
      _$NotificationDataImpl;

  factory _NotificationData.fromJson(Map<String, dynamic> json) =
      _$NotificationDataImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  @JsonKey(name: "title")
  String get title;
  @override
  @JsonKey(name: "message")
  String get message;
  @override
  @JsonKey(name: "type")
  String get type;
  @override
  @JsonKey(name: "ref_post_id")
  String? get refPostId;
  @override
  @JsonKey(name: "ref_user_follow_id")
  String? get refUserFollowId;
  @override
  @JsonKey(name: "ref_post_comment_id")
  String? get refPostCommentId;
  @override
  @JsonKey(name: "ref_post_like_id")
  String? get refPostLikeId;
  @override
  @JsonKey(name: "ref_post_save_id")
  String? get refPostSaveId;
  @override
  @JsonKey(name: "status")
  String get status;
  @override
  @JsonKey(name: "read_status")
  bool get readStatus;
  @override
  @JsonKey(name: "createdAt")
  DateTime get createdAt;
  @override
  @JsonKey(name: "posted_user_info")
  UserNotificationInfo get postedUserInfo;
  @override
  @JsonKey(name: "receiver_user_info")
  UserNotificationInfo get receiverUserInfo;
  @override
  @JsonKey(ignore: true)
  _$$NotificationDataImplCopyWith<_$NotificationDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserNotificationInfo _$UserNotificationInfoFromJson(Map<String, dynamic> json) {
  return _UserNotificationInfo.fromJson(json);
}

/// @nodoc
mixin _$UserNotificationInfo {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "fullName")
  String get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: "phone")
  String get phone => throw _privateConstructorUsedError;
  @JsonKey(name: "profile_image")
  String get profileImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserNotificationInfoCopyWith<UserNotificationInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserNotificationInfoCopyWith<$Res> {
  factory $UserNotificationInfoCopyWith(UserNotificationInfo value,
          $Res Function(UserNotificationInfo) then) =
      _$UserNotificationInfoCopyWithImpl<$Res, UserNotificationInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      @JsonKey(name: "fullName") String fullName,
      @JsonKey(name: "email") String email,
      @JsonKey(name: "phone") String phone,
      @JsonKey(name: "profile_image") String profileImage});
}

/// @nodoc
class _$UserNotificationInfoCopyWithImpl<$Res,
        $Val extends UserNotificationInfo>
    implements $UserNotificationInfoCopyWith<$Res> {
  _$UserNotificationInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? email = null,
    Object? phone = null,
    Object? profileImage = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: null == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserNotificationInfoImplCopyWith<$Res>
    implements $UserNotificationInfoCopyWith<$Res> {
  factory _$$UserNotificationInfoImplCopyWith(_$UserNotificationInfoImpl value,
          $Res Function(_$UserNotificationInfoImpl) then) =
      __$$UserNotificationInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      @JsonKey(name: "fullName") String fullName,
      @JsonKey(name: "email") String email,
      @JsonKey(name: "phone") String phone,
      @JsonKey(name: "profile_image") String profileImage});
}

/// @nodoc
class __$$UserNotificationInfoImplCopyWithImpl<$Res>
    extends _$UserNotificationInfoCopyWithImpl<$Res, _$UserNotificationInfoImpl>
    implements _$$UserNotificationInfoImplCopyWith<$Res> {
  __$$UserNotificationInfoImplCopyWithImpl(_$UserNotificationInfoImpl _value,
      $Res Function(_$UserNotificationInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? email = null,
    Object? phone = null,
    Object? profileImage = null,
  }) {
    return _then(_$UserNotificationInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: null == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserNotificationInfoImpl implements _UserNotificationInfo {
  const _$UserNotificationInfoImpl(
      {@JsonKey(name: "_id") required this.id,
      @JsonKey(name: "fullName") required this.fullName,
      @JsonKey(name: "email") required this.email,
      @JsonKey(name: "phone") required this.phone,
      @JsonKey(name: "profile_image") required this.profileImage});

  factory _$UserNotificationInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserNotificationInfoImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  @JsonKey(name: "fullName")
  final String fullName;
  @override
  @JsonKey(name: "email")
  final String email;
  @override
  @JsonKey(name: "phone")
  final String phone;
  @override
  @JsonKey(name: "profile_image")
  final String profileImage;

  @override
  String toString() {
    return 'UserNotificationInfo(id: $id, fullName: $fullName, email: $email, phone: $phone, profileImage: $profileImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserNotificationInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, fullName, email, phone, profileImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserNotificationInfoImplCopyWith<_$UserNotificationInfoImpl>
      get copyWith =>
          __$$UserNotificationInfoImplCopyWithImpl<_$UserNotificationInfoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserNotificationInfoImplToJson(
      this,
    );
  }
}

abstract class _UserNotificationInfo implements UserNotificationInfo {
  const factory _UserNotificationInfo(
          {@JsonKey(name: "_id") required final String id,
          @JsonKey(name: "fullName") required final String fullName,
          @JsonKey(name: "email") required final String email,
          @JsonKey(name: "phone") required final String phone,
          @JsonKey(name: "profile_image") required final String profileImage}) =
      _$UserNotificationInfoImpl;

  factory _UserNotificationInfo.fromJson(Map<String, dynamic> json) =
      _$UserNotificationInfoImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  @JsonKey(name: "fullName")
  String get fullName;
  @override
  @JsonKey(name: "email")
  String get email;
  @override
  @JsonKey(name: "phone")
  String get phone;
  @override
  @JsonKey(name: "profile_image")
  String get profileImage;
  @override
  @JsonKey(ignore: true)
  _$$UserNotificationInfoImplCopyWith<_$UserNotificationInfoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
