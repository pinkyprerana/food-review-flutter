import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/utils/app_log.dart';
import 'package:for_the_table/core/utils/map_utls.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:label_marker/label_marker.dart';

import '../../../restaurant/shared/provider.dart';

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

  Set<Marker> markers = {};
  List<LabelMarker> labelMarkers = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final stateNotifier = ref.read(restaurantNotifierProvider.notifier);
      await stateNotifier.getAllRestaurants();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(restaurantNotifierProvider);
    final stateNotifier = ref.watch(restaurantNotifierProvider.notifier);
    // AppLog.log('stateNotifier.maekers ----------->> ${stateNotifier.markers}');

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
            child: state.isAllRestaurantsLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.colorPrimary,
                    ),
                  )
                : state.allRestaurantList.isNotEmpty
                    ? Stack(
                        children: [
                          GoogleMap(
                            gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
                              Factory<OneSequenceGestureRecognizer>(
                                () => EagerGestureRecognizer(),
                              ),
                            ].toSet(),
                            myLocationButtonEnabled: false,
                            initialCameraPosition: CameraPosition(
                              target: LatLng(
                                double.parse((state.allRestaurantList[0].lat ?? '1')),
                                double.parse(((state.allRestaurantList[0].lng ?? '1'))),
                              ),
                              zoom: 12,
                            ),
                            onMapCreated: (GoogleMapController controller) {
                              _controller.complete(controller);
                              _googleMapController = controller;
                              _googleMapController.getVisibleRegion();
                              controller.animateCamera(
                                CameraUpdate.newLatLngBounds(
                                    MapUtils.boundsFromLatLngList(
                                        stateNotifier.markers.map((loc) => loc.position).toList()),
                                    1),
                              );

                              // Set<Marker> markers = Set();

                              markers = stateNotifier.markers;
                              // Future.delayed(
                              //   const Duration(milliseconds: 200),
                              //   () => controller.animateCamera(
                              //     CameraUpdate.newLatLngBounds(
                              //         MapUtils.boundsFromLatLngList(
                              //             markers.map((loc) => loc.position).toList()),
                              //         1),
                              //   ),
                              // );
                            },
                            // markers: markers,
                            zoomControlsEnabled: true,
                          ),
                        ],
                      )
                    : const Center(
                        child: Text('Data not available at the moment'),
                      ),
          ),
          100.verticalSpace,
        ],
      ),
    );
  }
}
