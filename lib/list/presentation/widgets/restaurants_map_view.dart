import 'dart:async';
import 'dart:typed_data';
import 'Dart:ui' as ui;
import 'dart:math' as math;
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/core/utils/app_log.dart';
import 'package:for_the_table/core/utils/map_utls.dart';
import 'package:for_the_table/restaurant/shared/provider.dart';
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
  Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController _googleMapController;

  List<Marker> markers = [];

  @override
  void initState() {
    // markers = [
    //   Marker(
    //       markerId: MarkerId('1'),
    //       position: LatLng(
    //           double.parse('29.95106579999999'), double.parse('-90.0715323')),
    //       infoWindow: InfoWindow(
    //         title: 'Restaurant 1',
    //       )),
    //   Marker(
    //       markerId: MarkerId('2'),
    //       position:
    //           LatLng(double.parse('29.5290805'), double.parse('-95.0732687')),
    //       infoWindow: InfoWindow(
    //         title: 'Restaurant 2',
    //       )),
    //   Marker(
    //       markerId: MarkerId('3'),
    //       position:
    //           LatLng(double.parse('39.8204269'), double.parse('-105.0350646')),
    //       infoWindow: InfoWindow(
    //         title: 'Restaurant 3',
    //       )),
    //   Marker(
    //       markerId: MarkerId('4'),
    //       position:
    //           LatLng(double.parse('39.8278133'), double.parse('-105.0544523')),
    //       infoWindow: InfoWindow(
    //         title: 'Restaurant 4',
    //       )),
    //   Marker(
    //       markerId: MarkerId('5'),
    //       position: LatLng(
    //           double.parse('39.82088890000001'), double.parse('-105.0350689')),
    //       infoWindow: InfoWindow(
    //         title: 'Restaurant 5',
    //       ))
    // ];
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final state = ref.read(restaurantNotifierProvider);
      final stateNotifier = ref.read(restaurantNotifierProvider.notifier);
      await stateNotifier.getRestaurants(context: context);
      if (state.restaurantList != null) {
        var index = 0;
        // _currentPosition = CameraPosition(
        //   target: LatLng(
        //     double.parse((state.restaurantList![index].lat ?? '1')),
        //     double.parse(((state.restaurantList![index].lng ?? '1'))),
        //   ),
        //   zoom: 12,
        // );
        markers = state.restaurantList!.map<Marker>((item) {
          return Marker(
            markerId: MarkerId('${index + 1}'),
            position: LatLng(double.parse(item.lat!), double.parse(item.lng!)),
            infoWindow: InfoWindow(
              title: item.name,
            ),
          );
        }).toList();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.read(restaurantNotifierProvider);
    final stateNotifier = ref.read(restaurantNotifierProvider.notifier);
    AppLog.log('Markers ---------------- $markers');
    AppLog.log('Markers.length --------- >> ${markers.length}');
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            // color: Colors.red,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10).r,
            ),
            height: 0.52.sh,
            child: (state.isLoading)
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.colorPrimary,
                    ),
                  )
                : (markers.isNotEmpty)
                    ? Stack(
                        children: [
                          GoogleMap(
                            gestureRecognizers:
                                <Factory<OneSequenceGestureRecognizer>>[
                              new Factory<OneSequenceGestureRecognizer>(
                                () => new EagerGestureRecognizer(),
                              ),
                            ].toSet(),
                            myLocationButtonEnabled: false,
                            initialCameraPosition: CameraPosition(
                              target: LatLng(
                                double.parse(
                                    (state.restaurantList![0].lat ?? '1')),
                                double.parse(
                                    ((state.restaurantList![0].lng ?? '1'))),
                              ),
                              zoom: 12,
                            ),
                            onMapCreated: (GoogleMapController controller) {
                              _controller.complete(controller);
                              _googleMapController = controller;
                              _googleMapController.getVisibleRegion();

                              Set<Marker> _markers = Set();

                              _markers = Set.from(
                                markers,
                              );
                              Future.delayed(
                                  const Duration(milliseconds: 200),
                                  () => controller.animateCamera(
                                      CameraUpdate.newLatLngBounds(
                                          MapUtils.boundsFromLatLngList(_markers
                                              .map((loc) => loc.position)
                                              .toList()),
                                          1)));
                            },
                            markers: Set.from(markers),
                            zoomControlsEnabled: true,
                          ),
                          Positioned(
                            bottom: 20.0, // Adjust position as needed
                            right: 10.0, // Adjust position as needed
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    // mapController
                                    //     .animateCamera(CameraUpdate.zoomIn());
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
                                      style: AppTextStyles
                                          .textStylePoppinsMedium
                                          .copyWith(
                                        color: AppColors.colorPrimary,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ),
                                ),
                                8.verticalSpace,
                                GestureDetector(
                                  onTap: () {
                                    // mapController
                                    //     .animateCamera(CameraUpdate.zoomOut());
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
                                      style: AppTextStyles
                                          .textStylePoppinsMedium
                                          .copyWith(
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
                      )
                    : const Center(
                        child: Text('Something went wrong, please try again'),
                      ),
          ),
          100.verticalSpace,
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
