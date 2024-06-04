import 'dart:typed_data';
import 'Dart:ui' as ui;
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:label_marker/label_marker.dart';

class RestaurantMapView extends ConsumerStatefulWidget {
  const RestaurantMapView({
    super.key,
    required this.restaurants,
  });

  final List<Map<String, dynamic>> restaurants;

  @override
  ConsumerState<RestaurantMapView> createState() => _RestaurantMapViewState();
}

class _RestaurantMapViewState extends ConsumerState<RestaurantMapView> {
  late GoogleMapController mapController;
  Set<Marker> markers = {};

  LatLngBounds calculateBounds(List<Marker> markers) {
    double minLatitude = double.infinity;
    double maxLatitude = double.negativeInfinity;
    double minLongitude = double.infinity;
    double maxLongitude = double.negativeInfinity;

    if (markers.isEmpty) {
      return LatLngBounds(
          northeast: const LatLng(40.740776, -73.990004),
          southwest: const LatLng(40.740776, -73.990004));
    }

    for (Marker marker in markers) {
      minLatitude = math.min(minLatitude, marker.position.latitude);
      maxLatitude = math.max(maxLatitude, marker.position.latitude);
      minLongitude = math.min(minLongitude, marker.position.longitude);
      maxLongitude = math.max(maxLongitude, marker.position.longitude);
    }

    return LatLngBounds(
        northeast: LatLng(maxLatitude, maxLongitude),
        southwest: LatLng(minLatitude, minLongitude));
  }

  double calculateZoomLevel(LatLngBounds bounds, Size screenSize) {
    // Approximate projection constants for latitude and longitude
    const double WORLD_DIM = 256;
    const double ZOOM_MAX = 18;
    const double ZOOM_MIN = 0;

    LatLng northeast = bounds.northeast;
    LatLng southwest = bounds.southwest;

    double latFraction =
        (latRad(northeast.latitude) - latRad(southwest.latitude)) / math.pi;
    double lngDiff = northeast.longitude - southwest.longitude;
    double lngFraction = (lngDiff < 0 ? lngDiff + 360 : lngDiff) / 360;

    double latZoom = zoom(screenSize.height, WORLD_DIM, latFraction);
    double lngZoom = zoom(screenSize.width, WORLD_DIM, lngFraction);

    return math.min(math.min(latZoom, lngZoom), ZOOM_MAX);
  }

  double latRad(double lat) {
    double sin = math.sin(lat * math.pi / 180);
    double radX2 = math.log((1 + sin) / (1 - sin)) / 2;
    return math.max(math.min(radX2, math.pi), -math.pi) / 2;
  }

  double zoom(double mapPx, double worldPx, double fraction) {
    return (math.log(mapPx / worldPx / fraction) / math.ln2).clamp(0.0, 21.0);
  }

  LatLng _getCenter() {
    double totalLat = 0;
    double totalLng = 0;
    for (var restaurant in widget.restaurants) {
      totalLat += restaurant['lat'];
      totalLng += restaurant['lng'];
    }

    return LatLng(totalLat / widget.restaurants.length,
        totalLng / widget.restaurants.length);
  }

  Future<void> _onMapCreated() async {
    for (final restaurant in widget.restaurants) {
      final marker = LabelMarker(
        label: '⭐ ${restaurant['rating']}',
        markerId: MarkerId(restaurant['name']),
        position: LatLng(restaurant['lat'], restaurant['lng']),
        backgroundColor: AppColors.colorNavy,
        consumeTapEvents: true,
      );
      markers.addLabelMarker(marker);
    }

    // Call fitMarkersToView here if needed
    // await fitMarkersToView();
  }

  @override
  void initState() {
    _onMapCreated();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10).r,
      ),
      height: 0.52.sh,
      child: Stack(
        children: [
          GoogleMap(
            onMapCreated: (controller) async {
              mapController = controller;
              final loc = _getCenter();

              Future<void> fitMarkersToView() async {
                if (markers.isEmpty) {
                  return;
                }

                LatLngBounds bounds = calculateBounds(markers.toList());
                Size screenSize = MediaQuery.of(context).size;
                double zoomLevel = calculateZoomLevel(bounds, screenSize);

                await mapController.animateCamera(
                    CameraUpdate.newCameraPosition(
                        CameraPosition(target: loc, zoom: zoomLevel - 2)));
              }

              await fitMarkersToView();

              setState(() {});
            },
            initialCameraPosition: const CameraPosition(
                target: LatLng(40.740776, -73.990004),
                zoom: 11.3 // Center of New York
                ),
            markers: markers,
            zoomControlsEnabled: false,
          ),
          Positioned(
            bottom: 20.0, // Adjust position as needed
            right: 10.0, // Adjust position as needed
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    mapController.animateCamera(CameraUpdate.zoomIn());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 44.r,
                    width: 44.r,
                    decoration: BoxDecoration(
                      color: AppColors.colorWhite,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      '+',
                      style: AppTextStyles.textStylePoppinsMedium.copyWith(
                        color: AppColors.colorPrimary,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
                8.verticalSpace,
                GestureDetector(
                  onTap: () {
                    mapController.animateCamera(CameraUpdate.zoomOut());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 44.r,
                    width: 44.r,
                    decoration: BoxDecoration(
                      color: AppColors.colorWhite,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      '-',
                      style: AppTextStyles.textStylePoppinsMedium.copyWith(
                        color: AppColors.colorPrimary,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomMarker extends StatelessWidget {
  final String rating;
  final Color color;

  CustomMarker({required this.rating, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star, color: Colors.white, size: 24.0),
          SizedBox(height: 4.0),
          Text(
            rating,
            style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
