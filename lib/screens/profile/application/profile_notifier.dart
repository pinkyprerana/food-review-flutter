import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/constants/app_urls.dart';
import 'package:for_the_table/core/infrastructure/dio_exceptions.dart';
import 'package:for_the_table/core/infrastructure/hive_database.dart';
import 'package:for_the_table/core/infrastructure/network_api_services.dart';
import 'package:for_the_table/core/routes/app_router.dart';
import 'package:for_the_table/core/utils/toast.dart';
import 'package:for_the_table/core/utils/validator.dart';
import 'package:for_the_table/screens/profile/domain/faq_model.dart';
import 'package:for_the_table/screens/profile/domain/user_profile_model.dart';
import 'package:for_the_table/screens/profile/application/profile_state.dart';
import 'package:for_the_table/screens/profile/domain/user_activities.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../model/notification_model/notification_model.dart';
import '../../../model/saved_post_model/saved_post_model.dart';
import '../../home/domain/post_feed_model.dart';
import '../domain/privacy_policy_model.dart';

class ProfileNotifier extends StateNotifier<ProfileState> {
  ProfileNotifier(this._dio, this._hiveDataBase, this._networkApiService)
      : super(const ProfileState());

  final HiveDatabase _hiveDataBase;
  final Dio _dio;
  final NetworkApiService _networkApiService;

  final picker = ImagePicker();

  ProfileDetails? fetchedUser;

  final TextEditingController emailAddress = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController contactNameController = TextEditingController();
  final TextEditingController contactEmailController = TextEditingController();
  final TextEditingController contactPhoneController = TextEditingController();
  final TextEditingController contactMessageController = TextEditingController();
  final RefreshController refreshController = RefreshController();
  final RefreshController dislikePostRefreshController = RefreshController();
  final RefreshController likePostRefreshController = RefreshController();
  // TextEditingController commentController = TextEditingController();

  @override
  void dispose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    bioController.dispose();
    contactNameController.dispose();
    contactEmailController.dispose();
    contactPhoneController.dispose();
    contactMessageController.dispose();
    refreshController.dispose();
    dislikePostRefreshController.dispose();
    likePostRefreshController.dispose();
    super.dispose();
  }

  void populateContactDetails() {
    contactNameController.text = state.fetchedUser?.fullName ?? '';
    contactEmailController.text = state.fetchedUser?.email ?? '';
    contactPhoneController.text = state.fetchedUser?.phone ?? '';
  }

  void populateBio() {
    bioController.text = state.fetchedUser?.bio ?? '';
  }

  void loadMoreActivities() async {
    if (state.currentPage > state.totalPages) {
      showToastMessage('No new activities are available');
      refreshController.loadComplete();
      return;
    }

    await fetchUserActivities(perpage: 10, isLoadMore: true);
    refreshController.loadComplete();
  }

  void loadMoreDislikePosts() async {
    if (state.currentPage > state.totalPages) {
      showToastMessage('No new posts are available');
      dislikePostRefreshController.loadComplete();
      return;
    }

    await fetchDislikedPosts(isLoadMore: true);
    dislikePostRefreshController.loadComplete();
  }

  void loadMorelikePosts() async {
    if (state.currentPage > state.totalPages) {
      showToastMessage('No new posts are available');
      likePostRefreshController.loadComplete();
      return;
    }

    await fetchlikedPosts(isLoadMore: true);
    likePostRefreshController.loadComplete();
  }

  Future<void> getUserDetails() async {
    try {
      state = state.copyWith(isLoading: true);

      final headers = {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'token': _hiveDataBase.box.get(AppPreferenceKeys.token),
      };
      _dio.options.headers.addAll(headers);

      final response = await _dio.get('${AppUrls.baseUrl}${AppUrls.profile}');

      if (response.statusCode == 200 && response.data != null) {
        fetchedUser = ProfileDetails.fromJson(response.data!['data']);
        final userProfileResponseModel = UserProfileModel.fromJson(response.data);

        state = state.copyWith(
          isLoading: false,
          fetchedUser: fetchedUser,
          userProfileResponseModel: userProfileResponseModel,
          profileImgPath: '${AppUrls.profilePicLocation}/${fetchedUser?.profileImage}',
        );
      } else {
        final message = response.data?['message'] as String?;
        showToastMessage(message ?? '');
        state = state.copyWith(isLoading: false);
      }
    } on DioException catch (e) {
      final error = DioExceptions.fromDioError(e).message;
      showToastMessage(error, errorMessage: 'Something went wrong, please try again');

      state = state.copyWith(isLoading: false);
    }
  }

  void _showPermissionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Photos/Videos Permission Required'),
        content: const Text(
            'This app needs gallery permission to work properly. Please grant the permission in settings.'),
        actions: [
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              openAppSettings();
            },
            child: const Text('Open Settings'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  Future<void> checkGalleryPermission({
    required BuildContext context,
    required String imageSource,
  }) async {
    PermissionStatus permission;

    if (Platform.isAndroid) {
      permission = await Permission.storage.request();
    } else {
      permission = await Permission.photos.request();
    }

    switch (permission) {
      case PermissionStatus.granted:
        if (!context.mounted) return;
        if (imageSource == 'displayPicture') {
          await uploadProfileImage(context);
        } else {
          await uploadBannerImage(context);
        }
        break;

      case PermissionStatus.denied:
        showToastMessage(
            'Permission denied, please grant access to the gallery.');
        break;

      case PermissionStatus.permanentlyDenied:
        showToastMessage(
            'Permission permanently denied, please go to app settings to grant permission.');
        if (!context.mounted) return;
        _showPermissionDialog(context);
        break;

      default:
        showToastMessage('Unexpected permission status');
    }
  }


  Future<void> checkPermissionForGallery({
    required BuildContext context,
    required String imageSource,
  }) async {
    PermissionStatus permission;

    if (Platform.isAndroid) {
      permission = await Permission.storage.request();
    } else {
      permission = await Permission.photos.request();
    }

    switch (permission) {
      case PermissionStatus.granted:
        if (imageSource == 'displayPicture') {
          if (!context.mounted) return;
          await uploadProfileImage(context);
        } else {
          if (!context.mounted) return;
          await uploadBannerImage(context);
        }
      case PermissionStatus.denied:
        PermissionStatus permissionStatus;

        if (Platform.isAndroid) {
          permissionStatus = await Permission.storage.request();
        } else {
          permissionStatus = await Permission.photos.request();
        }

        if (permissionStatus == PermissionStatus.denied ||
            permissionStatus == PermissionStatus.permanentlyDenied) {
          showToastMessage(
              'Request Denied, please go to app settings and grant gallery permission');
          if (!context.mounted) return;
          _showPermissionDialog(context);
        } else if (permissionStatus == PermissionStatus.granted) {
          if (imageSource == 'displayPicture') {
            if (!context.mounted) return;
            await uploadProfileImage(context);
          } else {
            if (!context.mounted) return;
            await uploadBannerImage(context);
          }
        }
      case PermissionStatus.permanentlyDenied:
        PermissionStatus permissionStatus;

        if (Platform.isAndroid) {
          permissionStatus = await Permission.storage.request();
        } else {
          permissionStatus = await Permission.photos.request();
        }

        if (permissionStatus == PermissionStatus.denied ||
            permissionStatus == PermissionStatus.permanentlyDenied) {
          showToastMessage(
              'Request Denied, please go to app settings and grant gallery permission');
          if (!context.mounted) return;
          _showPermissionDialog(context);
        } else if (permissionStatus == PermissionStatus.granted) {
          if (imageSource == 'displayPicture') {
            if (!context.mounted) return;
            await uploadProfileImage(context);
          } else {
            if (!context.mounted) return;
            await uploadBannerImage(context);
          }
        }

      default:
    }
  }

  Future<void> uploadProfileImage(BuildContext context) async {
    try {
      XFile? pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 50,
      );

      if (pickedFile == null) {
        return;
      }

      state = state.copyWith(isLoading: true);

      final filePicked = File(pickedFile.path);

      String fileName = filePicked.path.split('/').last;

      final FormData formData = FormData.fromMap({
        "profile_image": await MultipartFile.fromFile(filePicked.path),
        "email": state.fetchedUser?.email,
        "phone": state.fetchedUser?.phone,
        "first_name": state.fetchedUser?.firstName,
        "last_name": state.fetchedUser?.lastName,
      });

      var headers = {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'token': await _hiveDataBase.box.get(AppPreferenceKeys.token),
      };

      _dio.options.headers.addAll(headers);

      final response = await _dio.post<Map<String, dynamic>>(
        '${AppUrls.baseUrl}${AppUrls.profileUpdate}',
        data: formData,
      );

      if (response.statusCode == 200 && response.data != null) {
        state = state.copyWith(
          isLoading: false,
          profileImgPath:
              '${AppUrls.profilePicLocation}/${response.data!['data']['profile_image']}',
          profileImage: fileName,
        );
        await getUserDetails();
        await fetchUserActivities();
      } else {
        showToastMessage('Please upload a media');

        state = state.copyWith(isLoading: false);
      }
    } catch (error) {
      state = state.copyWith(isLoading: false);

      showToastMessage('Something, went wrong, please try again');
    }
  }

  Future<void> uploadBannerImage(BuildContext context) async {
    try {
      XFile? pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 50,
      );

      if (pickedFile == null) {
        return;
      }

      state = state.copyWith(isLoading: true);

      final filePicked = File(pickedFile.path);

      // String fileName = filePicked.path.split('/').last;

      final FormData formData = FormData.fromMap({
        "banner_image": await MultipartFile.fromFile(filePicked.path),
      });

      var headers = {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'token': await _hiveDataBase.box.get(AppPreferenceKeys.token),
      };

      _dio.options.headers.addAll(headers);

      final response = await _dio.post<Map<String, dynamic>>(
        '${AppUrls.baseUrl}${AppUrls.profileUpdate}',
        data: formData,
      );

      if (response.statusCode == 200 && response.data != null) {
        state = state.copyWith(
          isLoading: false,
          // profileImgPath:
          //     '${AppUrls.profilePicLocation}/${response.data!['data']['profile_image']}',
          // profileImage: fileName,
        );
        await getUserDetails();
      } else {
        showToastMessage('Please upload a media');

        state = state.copyWith(isLoading: false);
      }
    } catch (error) {
      state = state.copyWith(isLoading: false);

      showToastMessage('Something, went wrong, please try again');
    }
  }

  bool validateEmailField() {
    if (emailAddress.text.isEmpty) {
      showToastMessage('Please enter your email address');
      return false;
    } else if (emailAddress.text.isNotEmpty && !Validator.validateEmail(emailAddress.text)) {
      showToastMessage('Please enter a valid email');
      return false;
    } else {
      return true;
    }
  }

  bool validatePasswordFields() {
    if (oldPasswordController.text.isEmpty ||
        newPasswordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      showToastMessage('No field can be blank');
      return false;
    } else if (oldPasswordController.text.length < 8 ||
        newPasswordController.text.length < 8 ||
        confirmPasswordController.text.length < 8) {
      showToastMessage('Password must contain at least 8 characters');
      return false;
    } else if (newPasswordController.text != confirmPasswordController.text) {
      showToastMessage('New password and confirm password does not match.');
      return false;
    } else {
      return true;
    }
  }

  Future<void> updatePassword(BuildContext context) async {
    if (validatePasswordFields()) {
      try {
        state = state.copyWith(isLoading: true);

        final FormData formData = FormData.fromMap({
          "old_password": oldPasswordController.text,
          "new_password": newPasswordController.text,
          "confirm_password": confirmPasswordController.text,
        });

        var headers = {
          'Accept': '*/*',
          'Content-Type': 'application/json',
          'token': await _hiveDataBase.box.get(AppPreferenceKeys.token),
        };

        _dio.options.headers.addAll(headers);

        final response = await _dio.post<Map<String, dynamic>>(
          '${AppUrls.baseUrl}${AppUrls.updatePassword}',
          data: formData,
        );

        if (response.statusCode == 200 && response.data != null) {
          showToastMessage('Password updated successfully!');

          oldPasswordController.text = '';
          newPasswordController.text = '';
          confirmPasswordController.text = '';

          if (!context.mounted) return;
          Navigator.pop(context);

          state = state.copyWith(isLoading: false);
        } else {
          showToastMessage('Something went wrong, try again');

          oldPasswordController.text = '';
          newPasswordController.text = '';
          confirmPasswordController.text = '';

          state = state.copyWith(isLoading: false);
        }
      } catch (error) {
        state = state.copyWith(isLoading: false);

        oldPasswordController.text = '';
        newPasswordController.text = '';
        confirmPasswordController.text = '';

        showToastMessage('Something, went wrong, please try again');
      }
    }
  }

  Future<void> changeEmailAddress(BuildContext context) async {
    if (validateEmailField()) {
      try {
        state = state.copyWith(isBeingSubmitted: true);

        final FormData formData = FormData.fromMap({"email": emailAddress.text});

        var headers = {
          'Accept': '*/*',
          'Content-Type': 'application/json',
          'token': await _hiveDataBase.box.get(AppPreferenceKeys.token),
        };

        _dio.options.headers.addAll(headers);

        final response = await _dio.post<Map<String, dynamic>>(
          '${AppUrls.baseUrl}${AppUrls.profileUpdate}',
          data: formData,
        );

        if (response.statusCode == 200 && response.data != null) {
          showToastMessage('Email Address Changed');

          emailAddress.text = '';

          await getUserDetails();

          if (!context.mounted) return;
          Navigator.pop(context);

          state = state.copyWith(isBeingSubmitted: false);
        } else {
          showToastMessage(response.statusMessage.toString());
          emailAddress.text = '';
          state = state.copyWith(isBeingSubmitted: false);
        }
      } catch (error) {
        state = state.copyWith(isBeingSubmitted: false);
        emailAddress.text = '';
        showToastMessage('Something went wrong. Please try in some time.');
      }
    }
  }

  bool validatePhoneNumber() {
    if (phoneNumber.text.isEmpty) {
      showToastMessage('Please enter your phone number');
      return false;
    } else if (phoneNumber.text.length < 10) {
      showToastMessage('Please enter a valid phone number');
      return false;
    } else if (!Validator.validatePhone(phoneNumber.text)) {
      showToastMessage('Please enter a valid phone number');
      return false;
    } else {
      return true;
    }
  }

  Future<void> changePhoneNumber(BuildContext context) async {
    if (validatePhoneNumber()) {
      try {
        state = state.copyWith(isBeingSubmitted: true);

        final FormData formData = FormData.fromMap({"phone": phoneNumber.text});

        var headers = {
          'Accept': '*/*',
          'Content-Type': 'application/json',
          'token': await _hiveDataBase.box.get(AppPreferenceKeys.token),
        };

        _dio.options.headers.addAll(headers);

        final response = await _dio.post<Map<String, dynamic>>(
          '${AppUrls.baseUrl}${AppUrls.profileUpdate}',
          data: formData,
        );

        if (response.statusCode == 200 && response.data != null) {
          showToastMessage('Phone Number Changed');

          phoneNumber.text = '';

          await getUserDetails();

          if (!context.mounted) return;
          Navigator.pop(context);

          state = state.copyWith(isBeingSubmitted: false);
        } else {
          showToastMessage(response.statusMessage.toString());
          phoneNumber.text = '';
          state = state.copyWith(isBeingSubmitted: false);
        }
      } catch (error) {
        state = state.copyWith(isBeingSubmitted: false);
        phoneNumber.text = '';
        showToastMessage('Something went wrong. Please try in some time.');
      }
    }
  }

  bool validateBio() {
    if (bioController.text.isEmpty || bioController.text.length < 50) {
      showToastMessage('Please add min 50 characters about you.');
      return false;
    }
    return true;
  }

  Future<void> updateBio(VoidCallback? onSuccess) async {
    try {
      state = state.copyWith(isLoading: true);

      bool isBioValid = validateBio();

      if (!isBioValid) {
        state = state.copyWith(isLoading: false);
        return;
      }

      final FormData formData = FormData.fromMap({
        "bio": bioController.text,
      });

      var headers = {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'token': await _hiveDataBase.box.get(AppPreferenceKeys.token),
      };

      _dio.options.headers.addAll(headers);

      final response = await _dio.post<Map<String, dynamic>>(
        '${AppUrls.baseUrl}${AppUrls.profileUpdate}',
        data: formData,
      );

      if (response.statusCode == 200 && response.data != null) {
        showToastMessage('Bio updated successfully!');

        await getUserDetails();

        if (onSuccess != null) onSuccess.call();

        state = state.copyWith(isLoading: false);
      } else {
        showToastMessage(response.statusCode.toString());
        state = state.copyWith(isLoading: false);
      }
    } catch (error) {
      state = state.copyWith(isLoading: false);
      showToastMessage('Something went wrong. Please try in some time.');
    }
  }

  bool validateContactFields() {
    if (contactNameController.text.isEmpty ||
        contactEmailController.text.isEmpty ||
        contactPhoneController.text.isEmpty ||
        contactMessageController.text.isEmpty) {
      showToastMessage('No field can be empty');
      return false;
    } else if (contactNameController.text.trim().length < 3) {
      showToastMessage('Name must have at least 3 letters.');
      return false;
    } else if (!Validator.validateEmail(contactEmailController.text)) {
      showToastMessage('Please enter a valid email id');
      return false;
    } else if (contactPhoneController.text.length < 10) {
      showToastMessage('Please enter a valid phone number');
      return false;
    }
    return true;
  }

  Future<void> requestHelp(BuildContext context) async {
    if (validateContactFields()) {
      try {
        state = state.copyWith(isLoading: true);

        final FormData formData = FormData.fromMap({
          "fullName": contactNameController.text,
          "email": contactEmailController.text,
          "subject": contactPhoneController.text,
          "message": contactMessageController.text,
        });

        var headers = {
          'Accept': '*/*',
          'Content-Type': 'application/json',
          'token': await _hiveDataBase.box.get(AppPreferenceKeys.token),
        };

        _dio.options.headers.addAll(headers);

        final response = await _dio.post<Map<String, dynamic>>(
          '${AppUrls.baseUrl}${AppUrls.contact}',
          data: formData,
        );

        if (response.statusCode == 200 && response.data != null) {
          showToastMessage('Thank you for reaching out. Our team will get to you soon.');
          contactMessageController.text = '';

          if (!context.mounted) return;
          Navigator.pop(context);

          state = state.copyWith(isLoading: false);
        } else {
          showToastMessage(response.statusMessage.toString());
          contactMessageController.text = '';
          state = state.copyWith(isLoading: false);
        }
      } catch (error) {
        state = state.copyWith(isLoading: false);
        contactMessageController.text = '';
        showToastMessage('Something went wrong. Please try in some time.');
      }
    }
  }

  Future<void> fetchUserActivities({int? perpage, bool isLoadMore = false}) async {
    try {
      state = state.copyWith(isLoading: !isLoadMore);

      if (isLoadMore && (state.currentPage * 10 == state.userActivitiesList?.length)) {
        state = state.copyWith(currentPage: state.currentPage + 1);
      } else {
        state = state.copyWith(currentPage: 1);
      }

      final FormData formData = FormData.fromMap({
        "perpage": perpage ?? 3,
        "page": state.currentPage,
      });

      var headers = {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'token': await _hiveDataBase.box.get(AppPreferenceKeys.token),
      };

      _dio.options.headers.addAll(headers);

      final response = await _dio.post<Map<String, dynamic>>(
        '${AppUrls.baseUrl}${AppUrls.userActivities}',
        data: formData,
      );

      if (response.statusCode == 200 && response.data != null) {
        final userActivitiesModel = UserActivities.fromJson(response.data ?? {});
        final userActivities = userActivitiesModel.activitiesList;

        if (isLoadMore) {
          final activityIds = state.userActivitiesList?.map((activity) => activity.id).toSet();

          final uniqueActivities = userActivities
              ?.where((activity) => !(activityIds?.contains(activity.id) ?? false))
              .toList();

          if ((uniqueActivities?.isEmpty ?? false) && isLoadMore) {
            showToastMessage('No new activities are available.');
          }
          state = state.copyWith(
            isLoading: false,
            userActivitiesList: [
              ...state.userActivitiesList ?? [],
              ...uniqueActivities ?? [],
            ],
          );

          return;
        }

        state = state.copyWith(
          isLoading: false,
          userActivitiesList: userActivities,
          totalPages: userActivitiesModel.pages ?? 0,
        );
      } else {
        showToastMessage(response.statusMessage.toString());
        contactMessageController.text = '';
        state = state.copyWith(isLoading: false);
      }
    } catch (error) {
      state = state.copyWith(isLoading: false);
      contactMessageController.text = '';
      showToastMessage('Something went wrong. Please try in some time.');
    }
  }

  Future<void> fetchDislikedPosts({bool isLoadMore = false, bool isLoadingStatus = false}) async {
    try {
      state = state.copyWith(isLoading: !isLoadMore && !isLoadingStatus);

      if (isLoadMore && (state.currentPage * 10 == state.dislikedPostsList.length)) {
        state = state.copyWith(currentPage: state.currentPage + 1);
      } else {
        state = state.copyWith(currentPage: 1);
      }

      final FormData formData = FormData.fromMap({
        "page": state.currentPage,
        "perpage": 10,
        "view_type": "dislike",
      });

      var headers = {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'token': await _hiveDataBase.box.get(AppPreferenceKeys.token),
      };

      _dio.options.headers.addAll(headers);

      final response = await _dio.post<Map<String, dynamic>>(
        '${AppUrls.baseUrl}${AppUrls.getPostFeed}',
        data: formData,
      );

      if (response.statusCode == 200 && response.data != null) {
        final dislikedPostsModel = PostModel.fromJson(response.data ?? {});
        final List<DataOfPostModel> dislikedPosts = [];

        for (var posts in dislikedPostsModel.postList ?? []) {
          dislikedPosts.add(posts);
        }

        List<CommentInfo> allComments = [];

        for (DataOfPostModel post in dislikedPostsModel.postList ?? []) {
          if (post.commentInfo != null) {
            allComments.addAll(post.commentInfo!);
          }
        }

        if (isLoadMore) {
          final postIds = state.dislikedPostsList.map((post) => post.id).toSet();

          final uniquePosts = dislikedPosts.where((post) => !(postIds.contains(post.id))).toList();

          if ((uniquePosts.isEmpty) && isLoadMore) {
            showToastMessage('No new posts are available.');
          }
          state = state.copyWith(
            isLoading: false,
            dislikedPostsList: [
              ...state.dislikedPostsList,
              ...uniquePosts,
            ],
          );

          return;
        }

        state = state.copyWith(
          isLoading: false,
          dislikedPostsList: dislikedPosts,
          totalPages: dislikedPostsModel.pages ?? 0,
          commentsList: allComments,
        );
      } else {
        showToastMessage(response.data?["message"]);
        contactMessageController.text = '';
        state = state.copyWith(isLoading: false);
      }
    } catch (error) {
      state = state.copyWith(isLoading: false);
      contactMessageController.text = '';
      showToastMessage('Something went wrong. Please try in some time.');
    }
  }

  Future<void> fetchlikedPosts({bool isLoadMore = false, bool isLoadingStatus = false}) async {
    try {
      state = state.copyWith(isLoading: !isLoadMore && !isLoadingStatus);

      if (isLoadMore && (state.currentPage * 10 == state.likedPostList.length)) {
        state = state.copyWith(currentPage: state.currentPage + 1);
      } else {
        state = state.copyWith(currentPage: 1);
      }

      final FormData formData = FormData.fromMap({
        "page": state.currentPage,
        "perpage": 10,
        "view_type": "like",
      });

      var headers = {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'token': await _hiveDataBase.box.get(AppPreferenceKeys.token),
      };

      _dio.options.headers.addAll(headers);

      final response = await _dio.post<Map<String, dynamic>>(
        '${AppUrls.baseUrl}${AppUrls.getPostFeed}',
        data: formData,
      );

      if (response.statusCode == 200 && response.data != null) {
        final likedPostsModel = PostModel.fromJson(response.data ?? {});
        final List<DataOfPostModel> likedPosts = [];

        for (var posts in likedPostsModel.postList ?? []) {
          likedPosts.add(posts);
        }

        List<CommentInfo> allComments = [];

        for (DataOfPostModel post in likedPostsModel.postList ?? []) {
          if (post.commentInfo != null) {
            allComments.addAll(post.commentInfo!);
          }
        }

        if (isLoadMore) {
          final postIds = state.likedPostList.map((post) => post.id).toSet();

          final uniquePosts = likedPosts.where((post) => !(postIds.contains(post.id))).toList();

          if ((uniquePosts.isEmpty) && isLoadMore) {
            showToastMessage('No new posts are available.');
          }
          state = state.copyWith(
            isLoading: false,
            likedPostList: [
              ...state.likedPostList,
              ...uniquePosts,
            ],
          );

          return;
        }

        state = state.copyWith(
          isLoading: false,
          likedPostList: likedPosts,
          totalPages: likedPostsModel.pages ?? 0,
          commentsList: allComments,
        );
      } else {
        showToastMessage(response.data?["message"]);
        contactMessageController.text = '';
        state = state.copyWith(isLoading: false);
      }
    } catch (error) {
      state = state.copyWith(isLoading: false);
      contactMessageController.text = '';
      showToastMessage('Something went wrong. Please try in some time.');
    }
  }

  Future<void> deactivateAccount({VoidCallback? onSuccess}) async {
    try {
      state = state.copyWith(isLoading: true);

      var headers = {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'token': await _hiveDataBase.box.get(AppPreferenceKeys.token),
      };

      _dio.options.headers.addAll(headers);

      var response = await _dio.get(
        "${AppUrls.baseUrl}${AppUrls.deactivateAccount}",
      );

      if (response.statusCode == 200 && response.data != null) {
        await _hiveDataBase.box.delete(AppPreferenceKeys.token);
        await _hiveDataBase.box.delete(AppPreferenceKeys.userEmail);
        await _hiveDataBase.box.delete(AppPreferenceKeys.userId);
        await _hiveDataBase.box.delete(AppPreferenceKeys.userFirstName);
        await _hiveDataBase.box.delete(AppPreferenceKeys.userLastName);
        await _hiveDataBase.box.delete(AppPreferenceKeys.fullName);
        await _hiveDataBase.box.delete(AppPreferenceKeys.userPhone);
        await _hiveDataBase.box.delete(AppPreferenceKeys.profileImage);

        showToastMessage(response.data["message"]);

        if (onSuccess != null) onSuccess.call();

        state = state.copyWith(isLoading: false);
      } else {
        showToastMessage(response.data["message"]);
        state = state.copyWith(isLoading: false);
      }
    } catch (error) {
      state = state.copyWith(isLoading: false);
      showToastMessage('Something went wrong. Please try in some time.');
    }
  }

  Future<void> deleteAccount({VoidCallback? onSuccess}) async {
    try {
      state = state.copyWith(isLoading: true);

      var headers = {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'token': await _hiveDataBase.box.get(AppPreferenceKeys.token),
      };

      _dio.options.headers.addAll(headers);

      var response = await _dio.get(
        "${AppUrls.baseUrl}${AppUrls.deleteAccount}",
      );

      if (response.statusCode == 200 && response.data != null) {
        await _hiveDataBase.box.delete(AppPreferenceKeys.token);
        await _hiveDataBase.box.delete(AppPreferenceKeys.userEmail);
        await _hiveDataBase.box.delete(AppPreferenceKeys.userId);
        await _hiveDataBase.box.delete(AppPreferenceKeys.userFirstName);
        await _hiveDataBase.box.delete(AppPreferenceKeys.userLastName);
        await _hiveDataBase.box.delete(AppPreferenceKeys.fullName);
        await _hiveDataBase.box.delete(AppPreferenceKeys.userPhone);
        await _hiveDataBase.box.delete(AppPreferenceKeys.profileImage);
        User? user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          await user.delete();
        }

        showToastMessage(response.data["message"]);

        if (onSuccess != null) onSuccess.call();

        state = state.copyWith(isLoading: false);
      } else {
        showToastMessage(response.data["message"]);
        state = state.copyWith(isLoading: false);
      }
    } catch (error) {
      state = state.copyWith(isLoading: false);
      showToastMessage('Something went wrong. Please try in some time.');
    }
  }

  Future<void> logout({required BuildContext context}) async {
    try {
      state = state.copyWith(isLoading: true);

      AutoRouter.of(context).pushAndPopUntil(
        const LandingIntroRoute(),
        predicate: (_) => false,
      );
      var headers = {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'token': _hiveDataBase.box.get(AppPreferenceKeys.token),
      };

      _dio.options.headers.addAll(headers);

      final response = await _dio.get<Map<String, dynamic>>(
        '${AppUrls.baseUrl}${AppUrls.logout}',
      );

      if (response.statusCode == 200 && response.data != null) {
        await _hiveDataBase.box.delete(AppPreferenceKeys.token);
        await _hiveDataBase.box.delete(AppPreferenceKeys.userEmail);
        await _hiveDataBase.box.delete(AppPreferenceKeys.userId);
        await _hiveDataBase.box.delete(AppPreferenceKeys.userFirstName);
        await _hiveDataBase.box.delete(AppPreferenceKeys.userLastName);
        await _hiveDataBase.box.delete(AppPreferenceKeys.fullName);
        await _hiveDataBase.box.delete(AppPreferenceKeys.userPhone);
        await _hiveDataBase.box.delete(AppPreferenceKeys.profileImage);
        await _hiveDataBase.box.delete(AppPreferenceKeys.deviceToken);
        // await _hiveDataBase.box.delete(AppPreferenceKeys.latitude);
        // await _hiveDataBase.box.delete(AppPreferenceKeys.longitude);

        // await _hiveDataBase.box.clear();

        state = state.copyWith(isLoading: false);
      } else {
        final message = response.data?['message'] as String?;
        showToastMessage(message ?? '');

        state = state.copyWith(isLoading: false);
      }
    } on DioException catch (e) {
      final error = DioExceptions.fromDioError(e).message;
      showToastMessage(error, errorMessage: 'Failed to logout');

      state = state.copyWith(isLoading: false);
    }
  }

  String? get getLatitude => _hiveDataBase.box.get(AppPreferenceKeys.latitude);
  String? get getLongitude => _hiveDataBase.box.get(AppPreferenceKeys.longitude);
  final TextEditingController searchController = TextEditingController();

  Future<void> getSavedList() async {
    state = state.copyWith(isLoading: true);
    try {
      var (response, dioException) = await _networkApiService
          .postApiRequestWithToken(url: '${AppUrls.baseUrl}${AppUrls.savedPostList}', body: {
        "lat": getLatitude,
        "lng": getLongitude,
      });
      state = state.copyWith(isLoading: false);

      if (response == null && dioException == null) {
        showConnectionWasInterruptedToastMessage();
      } else if (dioException != null) {
        showDioError(dioException);
      } else {
        SavedPostModel savedModel = SavedPostModel.fromJson(response.data);
        if (savedModel.status == 200) {
          state = state.copyWith(isLoading: false, savedList: savedModel.savedList);
        } else {
          showToastMessage(savedModel.message.toString());
        }
      }
    } catch (error) {
      state = state.copyWith(isLoading: false);
      showConnectionWasInterruptedToastMessage();
    }
  }

  Future<void> getNotificationList() async {
    state = state.copyWith(isLoading: true);
    try {
      var (response, dioException) = await _networkApiService.postApiRequestWithToken(
        url: '${AppUrls.baseUrl}${AppUrls.getAllNotifications}',
      );
      state = state.copyWith(isLoading: false);

      if (response == null && dioException == null) {
        showConnectionWasInterruptedToastMessage();
      } else if (dioException != null) {
        showDioError(dioException);
      } else {
        NotificationModel notificationModel = NotificationModel.fromJson(response.data);
        if (notificationModel.status == 200) {
          state = state.copyWith(
              isLoading: false, notificationList: notificationModel.notificationList);
        } else {
          showToastMessage(notificationModel.message.toString());
        }
      }
    } catch (error) {
      state = state.copyWith(isLoading: false);
      showConnectionWasInterruptedToastMessage();
    }
  }

  Future<void> getFAQList() async {
    state = state.copyWith(isLoading: true);
    try {
      var (response, dioException) = await _networkApiService
          .postApiRequestWithToken(url: '${AppUrls.baseUrl}${AppUrls.faqList}', body: {
        if (searchController.text.isNotEmpty) "search": searchController.text,
      });
      state = state.copyWith(isLoading: false);

      if (response == null && dioException == null) {
        showConnectionWasInterruptedToastMessage();
      } else if (dioException != null) {
        showDioError(dioException);
      } else {
        FaqModel faqModel = FaqModel.fromJson(response.data);
        if (faqModel.status == 200) {
          state = state.copyWith(isLoading: false, faqList: faqModel.faqList);
        } else {
          showToastMessage(faqModel.message.toString());
        }
      }
    } catch (error) {
      state = state.copyWith(isLoading: false);
      showConnectionWasInterruptedToastMessage();
    }
  }

  void searchFAQ() async {
    await getFAQList();
  }

  String formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays > 7) {
      return '${date.day}/${date.month}/${date.year}';
    } else if (difference.inDays > 1) {
      return '${difference.inDays} days ago';
    } else if (difference.inHours > 1) {
      return '${difference.inHours} hours ago';
    } else if (difference.inMinutes > 1) {
      return '${difference.inMinutes} minutes ago';
    } else {
      return 'Just now';
    }
  }

  // Future<void> postCommentLikeUnlike(
  //     VoidCallback voidCallback, String commentID) async {
  //   state = state.copyWith(isCommentLoading: true);
  //   try {
  //     var (response, dioException) =
  //     await _networkApiService.postApiRequestWithToken(
  //       url: '${AppUrls.baseUrl}${AppUrls.likeUnlikeComment}',
  //       body: {
  //         "comment_id": commentID,
  //       },
  //     );
  //     state = state.copyWith(isLoading: false);
  //
  //     if (response == null && dioException == null) {
  //       showConnectionWasInterruptedToastMessage();
  //     } else if (dioException != null) {
  //       showDioError(dioException);
  //     } else {
  //       Map<String, dynamic> jsonData = response.data;
  //
  //       if (response.statusCode == 200) {
  //         showToastMessage(jsonData['message']);
  //         // await getPostFeed(isPostLoading: true);
  //         state = state.copyWith(isCommentLoading: false);
  //         commentController.clear();
  //         voidCallback.call();
  //       } else {
  //         showToastMessage(jsonData['message']);
  //       }
  //     }
  //   } catch (error) {
  //     state = state.copyWith(isSavePost: false);
  //     showConnectionWasInterruptedToastMessage();
  //   }
  // }

  Future<void> getPrivacyPolicy() async {
    state = state.copyWith(isLoading: true);
    try {
      var (response, dioException) = await _networkApiService
          .getApiRequestWithToken(url: '${AppUrls.baseUrl}${AppUrls.privacyPolicy}');

      state = state.copyWith(isLoading: false);

      if (response == null && dioException == null) {
        showConnectionWasInterruptedToastMessage();
      } else if (dioException != null) {
        showDioError(dioException);
      } else {
        PrivacyPolicyModel ppModel = PrivacyPolicyModel.fromJson(response.data);

        if (ppModel.status == 200) {
          state = state.copyWith(
              isLoading: false,
              privacyPolicy: ppModel.data?.content ?? ''
          );
        } else {
          showToastMessage(ppModel.message ?? 'Failed to load privacy policy');
        }
      }
    } catch (error) {
      state = state.copyWith(isLoading: false);
      showConnectionWasInterruptedToastMessage();
    }
  }


}
