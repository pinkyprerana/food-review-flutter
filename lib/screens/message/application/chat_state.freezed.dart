// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isLoadMore => throw _privateConstructorUsedError;
  bool get isSending => throw _privateConstructorUsedError;
  List<DataOfChatList> get allChatList => throw _privateConstructorUsedError;
  DataOfChat? get dataOfChat => throw _privateConstructorUsedError;
  String? get selectedChat => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  XFile? get imageOrVideo => throw _privateConstructorUsedError;
  bool get isLoadingForImageUpload => throw _privateConstructorUsedError;
  bool get isVideo => throw _privateConstructorUsedError;
  bool get isLoadingForSubmit => throw _privateConstructorUsedError;
  bool get isRead => throw _privateConstructorUsedError;
  int get unreadCount => throw _privateConstructorUsedError;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatStateCopyWith<ChatState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) then) =
      _$ChatStateCopyWithImpl<$Res, ChatState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isLoadMore,
      bool isSending,
      List<DataOfChatList> allChatList,
      DataOfChat? dataOfChat,
      String? selectedChat,
      String? errorMessage,
      int currentPage,
      int totalPages,
      XFile? imageOrVideo,
      bool isLoadingForImageUpload,
      bool isVideo,
      bool isLoadingForSubmit,
      bool isRead,
      int unreadCount});

  $DataOfChatCopyWith<$Res>? get dataOfChat;
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res, $Val extends ChatState>
    implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isLoadMore = null,
    Object? isSending = null,
    Object? allChatList = null,
    Object? dataOfChat = freezed,
    Object? selectedChat = freezed,
    Object? errorMessage = freezed,
    Object? currentPage = null,
    Object? totalPages = null,
    Object? imageOrVideo = freezed,
    Object? isLoadingForImageUpload = null,
    Object? isVideo = null,
    Object? isLoadingForSubmit = null,
    Object? isRead = null,
    Object? unreadCount = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadMore: null == isLoadMore
          ? _value.isLoadMore
          : isLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isSending: null == isSending
          ? _value.isSending
          : isSending // ignore: cast_nullable_to_non_nullable
              as bool,
      allChatList: null == allChatList
          ? _value.allChatList
          : allChatList // ignore: cast_nullable_to_non_nullable
              as List<DataOfChatList>,
      dataOfChat: freezed == dataOfChat
          ? _value.dataOfChat
          : dataOfChat // ignore: cast_nullable_to_non_nullable
              as DataOfChat?,
      selectedChat: freezed == selectedChat
          ? _value.selectedChat
          : selectedChat // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      imageOrVideo: freezed == imageOrVideo
          ? _value.imageOrVideo
          : imageOrVideo // ignore: cast_nullable_to_non_nullable
              as XFile?,
      isLoadingForImageUpload: null == isLoadingForImageUpload
          ? _value.isLoadingForImageUpload
          : isLoadingForImageUpload // ignore: cast_nullable_to_non_nullable
              as bool,
      isVideo: null == isVideo
          ? _value.isVideo
          : isVideo // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingForSubmit: null == isLoadingForSubmit
          ? _value.isLoadingForSubmit
          : isLoadingForSubmit // ignore: cast_nullable_to_non_nullable
              as bool,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      unreadCount: null == unreadCount
          ? _value.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of ChatState
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
abstract class _$$ChatStateImplCopyWith<$Res>
    implements $ChatStateCopyWith<$Res> {
  factory _$$ChatStateImplCopyWith(
          _$ChatStateImpl value, $Res Function(_$ChatStateImpl) then) =
      __$$ChatStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isLoadMore,
      bool isSending,
      List<DataOfChatList> allChatList,
      DataOfChat? dataOfChat,
      String? selectedChat,
      String? errorMessage,
      int currentPage,
      int totalPages,
      XFile? imageOrVideo,
      bool isLoadingForImageUpload,
      bool isVideo,
      bool isLoadingForSubmit,
      bool isRead,
      int unreadCount});

  @override
  $DataOfChatCopyWith<$Res>? get dataOfChat;
}

/// @nodoc
class __$$ChatStateImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$ChatStateImpl>
    implements _$$ChatStateImplCopyWith<$Res> {
  __$$ChatStateImplCopyWithImpl(
      _$ChatStateImpl _value, $Res Function(_$ChatStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isLoadMore = null,
    Object? isSending = null,
    Object? allChatList = null,
    Object? dataOfChat = freezed,
    Object? selectedChat = freezed,
    Object? errorMessage = freezed,
    Object? currentPage = null,
    Object? totalPages = null,
    Object? imageOrVideo = freezed,
    Object? isLoadingForImageUpload = null,
    Object? isVideo = null,
    Object? isLoadingForSubmit = null,
    Object? isRead = null,
    Object? unreadCount = null,
  }) {
    return _then(_$ChatStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadMore: null == isLoadMore
          ? _value.isLoadMore
          : isLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isSending: null == isSending
          ? _value.isSending
          : isSending // ignore: cast_nullable_to_non_nullable
              as bool,
      allChatList: null == allChatList
          ? _value._allChatList
          : allChatList // ignore: cast_nullable_to_non_nullable
              as List<DataOfChatList>,
      dataOfChat: freezed == dataOfChat
          ? _value.dataOfChat
          : dataOfChat // ignore: cast_nullable_to_non_nullable
              as DataOfChat?,
      selectedChat: freezed == selectedChat
          ? _value.selectedChat
          : selectedChat // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      imageOrVideo: freezed == imageOrVideo
          ? _value.imageOrVideo
          : imageOrVideo // ignore: cast_nullable_to_non_nullable
              as XFile?,
      isLoadingForImageUpload: null == isLoadingForImageUpload
          ? _value.isLoadingForImageUpload
          : isLoadingForImageUpload // ignore: cast_nullable_to_non_nullable
              as bool,
      isVideo: null == isVideo
          ? _value.isVideo
          : isVideo // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingForSubmit: null == isLoadingForSubmit
          ? _value.isLoadingForSubmit
          : isLoadingForSubmit // ignore: cast_nullable_to_non_nullable
              as bool,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      unreadCount: null == unreadCount
          ? _value.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ChatStateImpl extends _ChatState {
  const _$ChatStateImpl(
      {this.isLoading = false,
      this.isLoadMore = false,
      this.isSending = false,
      final List<DataOfChatList> allChatList = const [],
      this.dataOfChat,
      this.selectedChat = '',
      this.errorMessage = '',
      this.currentPage = 0,
      this.totalPages = 0,
      this.imageOrVideo,
      this.isLoadingForImageUpload = false,
      this.isVideo = false,
      this.isLoadingForSubmit = false,
      this.isRead = false,
      this.unreadCount = 0})
      : _allChatList = allChatList,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isLoadMore;
  @override
  @JsonKey()
  final bool isSending;
  final List<DataOfChatList> _allChatList;
  @override
  @JsonKey()
  List<DataOfChatList> get allChatList {
    if (_allChatList is EqualUnmodifiableListView) return _allChatList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allChatList);
  }

  @override
  final DataOfChat? dataOfChat;
  @override
  @JsonKey()
  final String? selectedChat;
  @override
  @JsonKey()
  final String? errorMessage;
  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final int totalPages;
  @override
  final XFile? imageOrVideo;
  @override
  @JsonKey()
  final bool isLoadingForImageUpload;
  @override
  @JsonKey()
  final bool isVideo;
  @override
  @JsonKey()
  final bool isLoadingForSubmit;
  @override
  @JsonKey()
  final bool isRead;
  @override
  @JsonKey()
  final int unreadCount;

  @override
  String toString() {
    return 'ChatState(isLoading: $isLoading, isLoadMore: $isLoadMore, isSending: $isSending, allChatList: $allChatList, dataOfChat: $dataOfChat, selectedChat: $selectedChat, errorMessage: $errorMessage, currentPage: $currentPage, totalPages: $totalPages, imageOrVideo: $imageOrVideo, isLoadingForImageUpload: $isLoadingForImageUpload, isVideo: $isVideo, isLoadingForSubmit: $isLoadingForSubmit, isRead: $isRead, unreadCount: $unreadCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isLoadMore, isLoadMore) ||
                other.isLoadMore == isLoadMore) &&
            (identical(other.isSending, isSending) ||
                other.isSending == isSending) &&
            const DeepCollectionEquality()
                .equals(other._allChatList, _allChatList) &&
            (identical(other.dataOfChat, dataOfChat) ||
                other.dataOfChat == dataOfChat) &&
            (identical(other.selectedChat, selectedChat) ||
                other.selectedChat == selectedChat) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.imageOrVideo, imageOrVideo) ||
                other.imageOrVideo == imageOrVideo) &&
            (identical(
                    other.isLoadingForImageUpload, isLoadingForImageUpload) ||
                other.isLoadingForImageUpload == isLoadingForImageUpload) &&
            (identical(other.isVideo, isVideo) || other.isVideo == isVideo) &&
            (identical(other.isLoadingForSubmit, isLoadingForSubmit) ||
                other.isLoadingForSubmit == isLoadingForSubmit) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.unreadCount, unreadCount) ||
                other.unreadCount == unreadCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isLoadMore,
      isSending,
      const DeepCollectionEquality().hash(_allChatList),
      dataOfChat,
      selectedChat,
      errorMessage,
      currentPage,
      totalPages,
      imageOrVideo,
      isLoadingForImageUpload,
      isVideo,
      isLoadingForSubmit,
      isRead,
      unreadCount);

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatStateImplCopyWith<_$ChatStateImpl> get copyWith =>
      __$$ChatStateImplCopyWithImpl<_$ChatStateImpl>(this, _$identity);
}

abstract class _ChatState extends ChatState {
  const factory _ChatState(
      {final bool isLoading,
      final bool isLoadMore,
      final bool isSending,
      final List<DataOfChatList> allChatList,
      final DataOfChat? dataOfChat,
      final String? selectedChat,
      final String? errorMessage,
      final int currentPage,
      final int totalPages,
      final XFile? imageOrVideo,
      final bool isLoadingForImageUpload,
      final bool isVideo,
      final bool isLoadingForSubmit,
      final bool isRead,
      final int unreadCount}) = _$ChatStateImpl;
  const _ChatState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isLoadMore;
  @override
  bool get isSending;
  @override
  List<DataOfChatList> get allChatList;
  @override
  DataOfChat? get dataOfChat;
  @override
  String? get selectedChat;
  @override
  String? get errorMessage;
  @override
  int get currentPage;
  @override
  int get totalPages;
  @override
  XFile? get imageOrVideo;
  @override
  bool get isLoadingForImageUpload;
  @override
  bool get isVideo;
  @override
  bool get isLoadingForSubmit;
  @override
  bool get isRead;
  @override
  int get unreadCount;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatStateImplCopyWith<_$ChatStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
