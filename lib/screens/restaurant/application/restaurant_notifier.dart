import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/app_urls.dart';
import 'package:for_the_table/core/infrastructure/dio_exceptions.dart';
import 'package:for_the_table/core/infrastructure/hive_database.dart';
import 'package:for_the_table/core/infrastructure/network_api_services.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/core/utils/app_log.dart';
import 'package:for_the_table/core/utils/toast.dart';
import 'package:for_the_table/model/restaurant/all_restaurants_model.dart';
import 'package:for_the_table/model/restaurant/restaurant_details_model.dart';
import 'package:for_the_table/model/restaurant/restaurantlist_response_model.dart';
import 'package:for_the_table/model/restaurant/saved_restaurants_response_model.dart';
import 'package:for_the_table/screens/restaurant/application/restaurant_state.dart';
import 'package:for_the_table/screens/your_lists/shared/provider.dart';
import 'package:for_the_table/widgets/app_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:uuid/uuid.dart';
import '../../home/domain/post_feed_model.dart';

class RestaurantNotifier extends StateNotifier<RestaurantState> {
  RestaurantNotifier(this._dio, this._hiveDataBase, this._networkApiService, )
      : super(const RestaurantState());

  final HiveDatabase _hiveDataBase;
  final Dio _dio;
  final NetworkApiService _networkApiService;


  int totalNumberOfRestaurants = 0;

  RestaurantDetailsModel? reastaurantDetials;

  RefreshController restaurantRefreshController = RefreshController();
  RefreshController restaurantRefreshController2 = RefreshController();
  RefreshController savedRestaurantRefreshController = RefreshController();

  TextEditingController titleTextController = TextEditingController();
  TextEditingController reviewTextController = TextEditingController();

  List<SavedRestaurant>? localSavedRestaurantList = [];
  Set<Marker> markers = {};
  // List<LabelMarker> markers = [];

  @override
  void dispose() {
    restaurantRefreshController.dispose();
    super.dispose();
  }

  void clearMarkers() {
    markers = {};
  }

  void clearStateVariables() {
    state = state.copyWith(totalPagesPosts: 0);
    state = state.copyWith(currentPageForPosts: 1);
    state = state.copyWith(postPerRestaurantList: []);
    AppLog.log('state.totalPagesPosts ------>> ${state.totalPagesPosts}');
    AppLog.log('state.currentPageForPosts ------>> ${state.currentPageForPosts}');
    AppLog.log('state.postPerRestaurantList ------>> ${state.postPerRestaurantList}');
  }

  Future<void> loadMoreRestaurants(BuildContext context,  WidgetRef ref) async {
    AppLog.log('state.currentPage: ------->> ${state.currentPage}');
    if (state.currentPage >= state.totalPages) {
      showToastMessage('No more restaurants');
      restaurantRefreshController.loadComplete();
      return;
    }

    await getRestaurants(isLoadMore: true, ref: ref);
    restaurantRefreshController.loadComplete();
  }

  Future<void> getRestaurants({
    bool isLoadMore = false,
    required WidgetRef ref,
  }) async {
    final search = ref.read(yourPeopleNotifierProvider.notifier).searchController;
    try {
      state = state.copyWith(isLoading: !isLoadMore);

      if (isLoadMore && (state.currentPage * 10 == state.restaurantList?.length)) {
        state = state.copyWith(currentPage: state.currentPage + 1);
      } else {
        state = state.copyWith(currentPage: 1);
      }

      final data = {
        "perpage": 10,
        "page": state.currentPage,
        if (search.text.isNotEmpty) "search": search.text,
      };

      final headers = {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'token': _hiveDataBase.box.get(AppPreferenceKeys.token),
      };

      _dio.options.headers.addAll(headers);

      final response = await _dio.post<Map<String, dynamic>>(
        '${AppUrls.baseUrl}${AppUrls.restaurantList}',
        data: data,
      );

      if (response.statusCode == 200 && response.data != null) {
        final restaurantListResponseModel = RestaurantlistResponseModel.fromJson(response.data!);

        final List<Restaurant>? restaurantList = restaurantListResponseModel.restaurantList;

        if (isLoadMore) {
          final currentRestaurantIds = state.restaurantList?.map((friend) => friend.id).toSet();

          final uniqueRestaurants = restaurantList
              ?.where((friend) => !(currentRestaurantIds?.contains(friend.id) ?? false))
              .toList();

          if ((uniqueRestaurants?.isEmpty ?? false) && isLoadMore) {
            showToastMessage('No new profiles to display.');
          }

          state = state.copyWith(
            isLoading: false,
            restaurantList: [
              ...state.restaurantList ?? [],
              ...uniqueRestaurants ?? [],
            ],
          );

          return;
        }

        state = state.copyWith(
          isLoading: false,
          restaurantList: [
            ...restaurantList ?? [],
          ],
          totalPages: restaurantListResponseModel.pages ?? 0,
          totalNumberOfRestaurants: restaurantListResponseModel.total ?? 0,
        );
      } else {
        final message = response.data?['message'] as String?;
        showToastMessage(message ?? '');

        state = state.copyWith(isLoading: false);
      }
    } on DioException catch (e) {
      final error = DioExceptions.fromDioError(e).message;
      showToastMessage(error, errorMessage: 'Failed to get restaurants');

      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> getAllRestaurants() async {
    try {
      state = state.copyWith(isAllRestaurantsLoading: true);

      final headers = {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'token': _hiveDataBase.box.get(AppPreferenceKeys.token),
      };

      _dio.options.headers.addAll(headers);

      final response = await _dio.post<Map<String, dynamic>>(
        '${AppUrls.baseUrl}${AppUrls.getAllRestaurants}',
      );

      if (response.statusCode == 200 && response.data != null) {
        AppLog.log('response +++++++++++ $response');
        final allReastaurantsModel =
            AllRestaurantsModel.fromJson(response.data!);

        // final List<RestaurantData> allRestaurantList = [
        //   allReastaurantsModel.data?[0] ?? RestaurantData(),
        //   allReastaurantsModel.data?[1] ?? RestaurantData(),
        //   allReastaurantsModel.data?[2] ?? RestaurantData(),
        //   allReastaurantsModel.data?[3] ?? RestaurantData()
        // ];

        final List<RestaurantData> allRestaurantList = [];

        for (var restaurant in allReastaurantsModel.data ?? []) {
          allRestaurantList.add(restaurant);
        }

        if (allRestaurantList.isNotEmpty) {
          addMarker(allRestaurantList);
        }

        state = state.copyWith(
          isAllRestaurantsLoading: false,
          allRestaurantList: [...allRestaurantList],
        );
      } else {
        final message = response.data?['message'] as String?;
        showToastMessage(message ?? '');

        state = state.copyWith(isAllRestaurantsLoading: false);
      }
    } on DioException catch (e) {
      final error = DioExceptions.fromDioError(e).message;
      showToastMessage(error, errorMessage: 'Failed to get restaurants');

      state = state.copyWith(isAllRestaurantsLoading: false);
    }
  }

  Future<void> getHomeRestaurants({
    bool isLoadMore = false,
  }) async {
    try {
      state = state.copyWith(isLoading: true);

      final data = {
        "perpage": 4,
        "page": 1,
        "search": "",
      };

      final headers = {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'token': _hiveDataBase.box.get(AppPreferenceKeys.token),
      };

      _dio.options.headers.addAll(headers);

      final response = await _dio.post<Map<String, dynamic>>(
        '${AppUrls.baseUrl}${AppUrls.restaurantList}',
        data: data,
      );

      if (response.statusCode == 200 && response.data != null) {
        final reastaurantListResponseModel =
            RestaurantlistResponseModel.fromJson(response.data!);

        final List<Restaurant>? restaurantList =
            reastaurantListResponseModel.restaurantList;

        totalNumberOfRestaurants = reastaurantListResponseModel.total ?? 0;

        state = state.copyWith(
          isLoading: false,
          homeRestaurantList: restaurantList,
          // restaurantList: [
          //   ...state.restaurantList ?? [],
          //   ...restaurantList ?? []
          // ],
        );
      } else {
        final message = response.data?['message'] as String?;
        showToastMessage(message ?? '');

        state = state.copyWith(isLoading: false);
      }
    } on DioException catch (e) {
      final error = DioExceptions.fromDioError(e).message;
      showToastMessage(error, errorMessage: 'Failed to get restaurants');

      state = state.copyWith(isLoading: false);
    }
  }

  String? get userId => _hiveDataBase.box.get(AppPreferenceKeys.userId);
  String? get getLatitude => _hiveDataBase.box.get(AppPreferenceKeys.latitude);
  String? get getLongitude => _hiveDataBase.box.get(AppPreferenceKeys.longitude);

  Future<void> getPostListRelatedToRestaurant(
      VoidCallback voidCallback, String restaurantId) async {
    state = state.copyWith(isLoading: true);
    try {
      var (response, dioException) = await _networkApiService
          .postApiRequestWithToken(url: '${AppUrls.baseUrl}${AppUrls.getPostFeed}', body: {
        "lat": getLatitude,
        "lng": getLongitude,
        'restaurant_id': restaurantId, //"668d35376a30ef22a21e2f06"
        'user_id': userId
      });
      state = state.copyWith(isLoading: false);

      if (response == null && dioException == null) {
        showConnectionWasInterruptedToastMessage();
      } else if (dioException != null) {
        showDioError(dioException);
      } else {
        PostModel postModel = PostModel.fromJson(response.data);
        if (postModel.status == 200) {
          state = state.copyWith(isLoading: false, postList: postModel.postList);
        } else {
          showToastMessage(postModel.message.toString());
        }
      }
    } catch (error) {
      AppLog.log("Error fetching post feed: $error");
      state = state.copyWith(isLoading: false);
      showConnectionWasInterruptedToastMessage();
    }
  }

  Future<void> loadMorePosts(BuildContext context, String? restaurantId) async {
    AppLog.log('state.currentPageForPosts: ------->> ${state.currentPageForPosts}');
    if (state.currentPageForPosts >= state.totalPagesPosts) {
      showToastMessage('No more posts');
      restaurantRefreshController2.loadComplete();
      return;
    }

    await getPosts(context: context, restaurantId: restaurantId, isLoadMore: true);
    restaurantRefreshController2.loadComplete();
  }

  Future<void> getPosts(
      {required BuildContext context,
      bool isLoadMore = false,
      required String? restaurantId}) async {
    AppLog.log('state.currentPageForPosts ======== ${state.currentPageForPosts}');
    try {
      state = state.copyWith(isLoadingForPosts: !isLoadMore);

      if (isLoadMore) {
        state = state.copyWith(currentPageForPosts: state.currentPageForPosts + 1);
      }

      final data = {
        "serach_keyword": "",
        "perpage": 5,
        "page": state.currentPageForPosts,
        "lat": _hiveDataBase.box.get(AppPreferenceKeys.latitude),
        "lng": _hiveDataBase.box.get(AppPreferenceKeys.longitude),
        "restaurant_id": restaurantId,
      };

      final headers = {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'token': _hiveDataBase.box.get(AppPreferenceKeys.token),
      };

      _dio.options.headers.addAll(headers);

      final response = await _dio.post<Map<String, dynamic>>(
        '${AppUrls.baseUrl}${AppUrls.postListPerRestaurant}',
        data: data,
      );

      if (response.statusCode == 200 && response.data != null) {
        AppLog.log('response ---->> $response');
        final postlistPerRestaurantResponseModel =
            PostModel.fromJson(response.data!);

        final List<DataOfPostModel>? postList = postlistPerRestaurantResponseModel.postList;

        state = state.copyWith(
          isLoadingForPosts: false,
          postPerRestaurantList: [...state.postPerRestaurantList ?? [], ...postList ?? []],
          totalPagesPosts: postlistPerRestaurantResponseModel.pages ?? 0,
        );
      } else {
        final message = response.data?['message'] as String?;
        showToastMessage(message ?? '');

        state = state.copyWith(isLoadingForPosts: false);
      }
    } on DioException catch (e) {
      final error = DioExceptions.fromDioError(e).message;
      showToastMessage(error, errorMessage: 'Failed to get posts');

      state = state.copyWith(isLoadingForPosts: false);
    }
  }

  Future<void> saveRestaurant(String restaurantID) async {
    AppLog.log('restaurantID------------->>>> $restaurantID');
    try {
      state = state.copyWith(isLoadingSaveRestaurant: true);

      final data = {
        "restaurant_id": restaurantID,
      };

      final headers = {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'token': _hiveDataBase.box.get(AppPreferenceKeys.token),
      };

      _dio.options.headers.addAll(headers);

      final response = await _dio.post<Map<String, dynamic>>(
        '${AppUrls.baseUrl}${AppUrls.saveRestaurant}',
        data: data,
      );

      if (response.statusCode == 200 && response.data != null) {
        AppLog.log('save restaurant response ----->> $response');

        final message = response.data?['message'] as String?;
        showToastMessage(message ?? '');

        // AppLog.log(localSavedRestaurantList![0].toString());

        if (localSavedRestaurantList != null && (localSavedRestaurantList?.isNotEmpty ?? false)) {
          for (int i = 0; i < localSavedRestaurantList!.length; i++) {
            if (restaurantID == localSavedRestaurantList![i].id) {
              localSavedRestaurantList![i] =
                  localSavedRestaurantList![i].copyWith(isSaveLocally: false);
            }
          }
        }

        AppLog.log('localSavedRestaurantList +++++++++ $localSavedRestaurantList');

        // await getSavedRestaurants();
        if (localSavedRestaurantList != null && (localSavedRestaurantList?.isNotEmpty ?? false)) {
          updateLocalSavedRestaurantList();
        }

        state = state.copyWith(isLoadingSaveRestaurant: false);
      } else {
        final message = response.data?['message'] as String?;
        showToastMessage(message ?? '');

        state = state.copyWith(isLoadingSaveRestaurant: false);
      }
    } on DioException catch (e) {
      final error = DioExceptions.fromDioError(e).message;
      showToastMessage(error, errorMessage: 'Failed to save/unsave restaurant');

      state = state.copyWith(isLoadingSaveRestaurant: false);
    }
  }

  String restId = '';

  Future<void> restaurantDetails(String restaurantId) async {
    restId = restaurantId;
    AppLog.log('restaurantID------------->>>> $restaurantId');
    try {
      state = state.copyWith(isLoadingForRestaurantDetails: true);

      final data = {
        "restaurant_id": restaurantId,
      };

      final headers = {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'token': _hiveDataBase.box.get(AppPreferenceKeys.token),
      };

      _dio.options.headers.addAll(headers);

      final response = await _dio.post<Map<String, dynamic>>(
        '${AppUrls.baseUrl}${AppUrls.restaurnatDetails}',
        data: data,
      );
      if (response.statusCode == 200 && response.data != null) {
        AppLog.log('restaurant details----->> $response');

        AppLog.log('response.data ======== ${response.data}');

        reastaurantDetials = RestaurantDetailsModel.fromJson(response.data ?? {});

        // AppLog.log(
        //     'Restaurant-details variable ------->>>${reastaurantDetials.toString()}');

        // final message = response.data?['message'] as String?;
        // showToastMessage(message ?? '');

        state = state.copyWith(isLoadingForRestaurantDetails: false);
      } else {
        final message = response.data?['message'] as String?;
        showToastMessage(message ?? '');

        state = state.copyWith(isLoadingForRestaurantDetails: false);
      }
    } on DioException catch (e) {
      final error = DioExceptions.fromDioError(e).message;
      showToastMessage(error, errorMessage: 'Failed to get restaurant details');

      state = state.copyWith(isLoadingForRestaurantDetails: false);
    }
  }

  Future<void> loadMoreSavedRestaurants() async {
    if (state.currentPageForSavedRestaurantList >= state.totalPagesForSavedRestaurantList) {
      showToastMessage('No more restaurants');
      savedRestaurantRefreshController.loadComplete();
      return;
    }

    await getSavedRestaurants(isLoadMore: true);
    AppLog.log('more saved restaurants are called');
    savedRestaurantRefreshController.loadComplete();
  }

  Future<void> getSavedRestaurants({bool isLoadMore = false}) async {
    try {
      state = state.copyWith(isLoadingSaveRestaurantList: !isLoadMore);

      // if (isLoadMore) {
      //   state = state.copyWith(
      //       currentPageForSavedRestaurantList:
      //           state.currentPageForSavedRestaurantList + 1);
      // }

      if (isLoadMore &&
          (state.currentPageForSavedRestaurantList * 10 == state.savedRestaurantList?.length)) {
        state = state.copyWith(
            currentPageForSavedRestaurantList: state.currentPageForSavedRestaurantList + 1);
      } else {
        state = state.copyWith(currentPageForSavedRestaurantList: 1);
      }
      final data = {
        "search": "",
        "perpage": 10,
        "page": state.currentPageForSavedRestaurantList,
      };

      final headers = {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'token': _hiveDataBase.box.get(AppPreferenceKeys.token),
      };

      _dio.options.headers.addAll(headers);

      final response = await _dio.post<Map<String, dynamic>>(
        '${AppUrls.baseUrl}${AppUrls.getSavedRestaurantList}',
        data: data,
      );

      if (response.statusCode == 200 && response.data != null) {
        AppLog.log('RESPONSE:------------ $response');
        final savedRestaurantsResponseModel =
            SavedRestaurantsResponseModel.fromJson(response.data!);

        final List<SavedRestaurant>? savedRestaurantList =
            savedRestaurantsResponseModel.savedRestaurantList;

        if (isLoadMore) {
          final restIds = state.savedRestaurantList?.map((rest) => rest.id).toSet();

          final uniqueRestaurants =
              savedRestaurantList?.where((rest) => !(restIds?.contains(rest.id) ?? false)).toList();

          if ((uniqueRestaurants?.isEmpty ?? false) && isLoadMore) {
            showToastMessage('No new posts are available.');
          }
          state = state.copyWith(
            isLoading: false,
            savedRestaurantList: [
              ...state.savedRestaurantList ?? [],
              ...uniqueRestaurants ?? [],
            ],
          );

          return;
        }

        state = state.copyWith(
          isLoadingSaveRestaurantList: false,
          savedRestaurantList: [
            // ...state.savedRestaurantList ?? [],
            ...savedRestaurantList ?? [],
          ],
          totalPagesForSavedRestaurantList: savedRestaurantsResponseModel.pages ?? 0,
        );

        localSavedRestaurantList = [...state.savedRestaurantList ?? []];

        AppLog.log('localSavedRestaurantList------>> ${localSavedRestaurantList?.length}');
      } else {
        final message = response.data?['message'] as String?;
        showToastMessage(message ?? '');

        state = state.copyWith(isLoadingSaveRestaurantList: false);
      }
    } on DioException catch (e) {
      final error = DioExceptions.fromDioError(e).message;
      showToastMessage(error, errorMessage: 'Failed to get restaurants');

      state = state.copyWith(isLoadingSaveRestaurantList: false);
    }
  }

  void updateLocalSavedRestaurantList() {
    AppLog.log('localSavedRestaurantList ------------- $localSavedRestaurantList');
    localSavedRestaurantList?.retainWhere((item) => item.isSaveLocally == true);

    state = state.copyWith(savedRestaurantList: [...localSavedRestaurantList ?? []]);
  }

  void sliderValueUpdate(double value) {
    state = state.copyWith(sliderValue: value);
    AppLog.log('state.sliderValue -------->> ${state.sliderValue}');
  }

  void clearStateSliderValue() {
    state = state.copyWith(sliderValue: 0);
  }

  void clearImageOrVideo() {
    state = state.copyWith(imageOrVideo: null);
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

  final ImagePicker picker = ImagePicker();
  XFile? image;

  Future<void> checkPermissionForGallery(BuildContext context) async {
    PermissionStatus permission;

    if (Platform.isAndroid) {
      permission = await Permission.storage.request();
    } else {
      permission = await Permission.photos.request();
    }

    switch (permission) {
      case PermissionStatus.granted:
        AppLog.log('permission granted');
        if (!context.mounted) return;
        showOptionDialog(context);
        // pickImageOrVideo();
        break;
      case PermissionStatus.denied:
        AppLog.log('permission denied');
        final permissionAgain = await Permission.photos.request();
        if (permissionAgain == PermissionStatus.denied) {
          showToastMessage('Request Denied, please go to app settings to grant gallery permission');
          if (!context.mounted) return;
          _showPermissionDialog(context);
        } else if (permissionAgain == PermissionStatus.permanentlyDenied) {
          showToastMessage('Request Denied, please go to app settings to grant gallery permission');
          if (!context.mounted) return;
          _showPermissionDialog(context);
        } else if (permissionAgain == PermissionStatus.granted) {
          AppLog.log('permission granted');
          // pickImageOrVideo();
          if (!context.mounted) return;
          showOptionDialog(context);
        }
        break;
      case PermissionStatus.permanentlyDenied:
        AppLog.log('permission denied');
        final permissionAgain = await Permission.photos.request();
        if (permissionAgain == PermissionStatus.denied) {
          showToastMessage('Request Denied, please go to app settings to grant gallery permission');
          if (!context.mounted) return;
          _showPermissionDialog(context);
        } else if (permissionAgain == PermissionStatus.permanentlyDenied) {
          showToastMessage('Request Denied, please go to app settings to grant gallery permission');
          if (!context.mounted) return;
          _showPermissionDialog(context);
        } else if (permissionAgain == PermissionStatus.granted) {
          AppLog.log('permission granted');
          // pickImageOrVideo();
          if (!context.mounted) return;
          showOptionDialog(context);
        }
        break;
      case PermissionStatus.limited:
        AppLog.log('permission limited');
        break;
      case PermissionStatus.restricted:
        AppLog.log('permission restricted');
        break;
      case PermissionStatus.provisional:
        AppLog.log('permission provisional');
        break;
      default:
    }
  }

  XFile? pickedFile;

  Future<void> pickImageOrVideo({photo = true}) async {
    pickedFile = (photo)
        ? await picker.pickImage(
            source: ImageSource.gallery,
            imageQuality: 50,
          )
        : await picker.pickVideo(
            source: ImageSource.gallery,
          );

    if (pickedFile == null) {
      return;
    }

    // filePicked = File(pickedFile.path);

    // AppLog.log('pickedFile-------- ${pickedFile.path}');

    state = (photo)
        ? state.copyWith(imageOrVideo: pickedFile, isVideo: false)
        : state.copyWith(imageOrVideo: pickedFile, isVideo: true);
  }

  bool validateReviewFields() {
    if (titleTextController.text.trim().isEmpty) {
      showToastMessage('Please enter a title');
      return false;
    } else if (reviewTextController.text.trim().isEmpty) {
      showToastMessage('Please enter a review');
      return false;
    } else {
      return true;
    }
  }

  void clearReviewFields() {
    reviewTextController.text = '';
    titleTextController.text = '';
  }

  Future<void> submitReview({required VoidCallback onSuccess}) async {
    if (validateReviewFields()) {
      final filePicked = File(pickedFile?.path ?? '');

      state = state.copyWith(isLoadingForReviewSubmit: true);

      final FormData formData = FormData.fromMap({
        if (filePicked.path.isNotEmpty)
          "review_file": await MultipartFile.fromFile(filePicked.path),
        "description": reviewTextController.text,
        "title": titleTextController.text,
        "rating": state.sliderValue.toString(),
        "restaurant_id": restId,
      });

      var headers = {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'token': await _hiveDataBase.box.get(AppPreferenceKeys.token),
      };

      _dio.options.headers.addAll(headers);

      try {
        final response = await _dio.post<Map<String, dynamic>>(
          '${AppUrls.baseUrl}${AppUrls.reviewSubmit}',
          data: formData,
        );

        if (response.statusCode == 200 && response.data != null) {
          titleTextController.text = '';
          reviewTextController.text = '';
          // filePicked = null;
          await restaurantDetails(restId);
          onSuccess.call();
          state =
              state.copyWith(isLoadingForReviewSubmit: false, sliderValue: 0, imageOrVideo: null);
          showToastMessage('Review Submitted');
        } else {
          showToastMessage('Review submission failed');
          state = state.copyWith(isLoadingForReviewSubmit: false);
        }
      } catch (error) {
        showToastMessage('Something went wrong, please try again');
        state = state.copyWith(isLoadingForReviewSubmit: false);
      }
    }
  }

  void showOptionDialog(BuildContext context) {
    showDialog(
        context: (context),
        builder: (ctx) {
          return AlertDialog(
            title: Center(
                child: Text(
              'Choose an option',
              style: AppTextStyles.textStylePoppins.copyWith(fontSize: 17.sp),
            )),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppButton(
                  text: 'Pick Image',
                  onPressed: () {
                    pickImageOrVideo();
                    Navigator.pop(context);
                  },
                ),
                10.verticalSpace,
                AppButton(
                  text: 'Pick Video',
                  onPressed: () {
                    pickImageOrVideo(photo: false);
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          );
        });
  }

  void addMarker(List<RestaurantData> restaurantList) {
    for (final item in restaurantList) {
      var uuid = const Uuid();
      var uniqueString = uuid.v4();
      final marker = Marker(
        // markerId: MarkerId(item.name.toString()),
        markerId: MarkerId(uniqueString),
        position: LatLng(
            double.parse(item.lat ?? '1'), double.parse(item.lng ?? '1')),
        infoWindow: InfoWindow(
          title: item.name,
          snippet: (item.rating != '') ? '⭐ ${item.rating}' : '⭐ 0.0',
        ),
      );
      markers.add(marker);
      // markers.addLabelMarker(marker);
    }
    // state = state.copyWith();
  }
}
