import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/infrastructure/hive_database.dart';
import 'package:for_the_table/core/routes/app_router.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../core/constants/app_urls.dart';
import '../../../core/utils/app_log.dart';
import '../../../core/utils/toast.dart';
import 'location_state.dart';

class LocationNotifier extends StateNotifier<LocationState> {
  LocationNotifier(
    this._dio,
    this._hiveDataBase,
  ) : super(const LocationState());

  final Dio _dio;
  final HiveDatabase _hiveDataBase;
  String address = '';

  checkPermissionForIOS(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    AppLog.log('serviceEnabled -------->> $serviceEnabled');

    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return;
    }

    permission = await Geolocator.checkPermission();
    AppLog.log('permission --------->> $permission');

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      _showPermissionDialog(context);
    } else {
      getLocation(context);
    }
  }

  void _showPermissionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Location Permission Required'),
        content: const Text(
            'This app needs location permission to work properly. Please grant the permission in settings.'),
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

  checkPermission(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    AppLog.log('serviceEnabled -------->> $serviceEnabled');

    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return;
    }

    permission = await Geolocator.checkPermission();
    AppLog.log('permission --------->> $permission');

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        showToastMessage(
            'Request Denied, please go to app settings to grant location permission');
        _showPermissionDialog(context);
        return;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Platform.isIOS ? openAppSettings() : showToastMessage('Denied Forever');
      // Platform.isIOS
      //     ? _showPermissionDialog(context)
      //     : showToastMessage('Denied Forever');
      _showPermissionDialog(context);
      return;
    }

    getLocation(context);
  }

  getLocation(BuildContext context) async {
    try {
      state = state.copyWith(isLoading: true);

      print('getLocation is called');

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      AppLog.log('postion.lat: -------->> ${position.latitude}');
      AppLog.log('postion.long: -------->> ${position.longitude}');

      List<Placemark> result =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = result[0];
      AppLog.log('place ------>> $place');
      AppLog.log('place ---- >> ${place.locality}');

      AppLog.log('result --------->> $result');

      if (result.isNotEmpty) {
        // state = state.copyWith(isLoading: false);

        address =
            '${result[0].name}, ${result[0].locality}, ${result[0].administrativeArea}';
        await _hiveDataBase.box
            .put(AppPreferenceKeys.isLocationFetched, 'true');
        await _hiveDataBase.box
            .put(AppPreferenceKeys.latitude, position.latitude.toString());
        await _hiveDataBase.box
            .put(AppPreferenceKeys.longitude, position.longitude.toString());
        await _hiveDataBase.box.put(AppPreferenceKeys.location,
            '${place.name}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}');
        updateProfile(
            position.latitude,
            position.longitude,
            '${place.name}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}',
            context);
      }
    } catch (e) {
      showToastMessage('something went wrongzz');
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> updateProfile(
      double lat, double long, String location, BuildContext context) async {
    try {
      state = state.copyWith(isLoading: true);

      final FormData formData = FormData.fromMap({
        "lat": lat,
        "lng": long,
        "location": location,
      });

      var headers = {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'token': await _hiveDataBase.box.get(AppPreferenceKeys.token),
      };

      _dio.options.headers.addAll(headers);

      final response = await _dio.post<Map<String, dynamic>>(
        '${AppUrls.BASE_URL}${AppUrls.profileUpdate}',
        data: formData,
      );

      if (response.statusCode == 200 && response.data != null) {
        showToastMessage('Location updated successfully');
        AutoRouter.of(context)
            .pushAndPopUntil(const BaseRoute(), predicate: (_) => false);
        state = state.copyWith(isLoading: false);
      } else {
        showToastMessage('Something went wrong, try again');

        state = state.copyWith(isLoading: false);
      }
    } catch (error) {
      state = state.copyWith(isLoading: false);

      showToastMessage('Something, went wrong, please try again');
    }
  }
}
