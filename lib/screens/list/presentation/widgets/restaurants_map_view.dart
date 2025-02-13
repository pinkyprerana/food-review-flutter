import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../restaurant/shared/provider.dart';

class RestaurantMapView extends ConsumerStatefulWidget {
  const RestaurantMapView({
    super.key,
  });


  @override
  ConsumerState<RestaurantMapView> createState() => _RestaurantMapViewState();
}

class _RestaurantMapViewState extends ConsumerState<RestaurantMapView> {
  Completer<GoogleMapController> gController = Completer();
  // late GoogleMapController _googleMapController;

  // Set<Marker> markers = {};
  // List<LabelMarker> labelMarkers = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final stateNotifier = ref.read(restaurantNotifierProvider.notifier);
      stateNotifier.clearMarkers();
      await stateNotifier.getAllRestaurants();
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(restaurantNotifierProvider);
    final stateNotifier = ref.watch(restaurantNotifierProvider.notifier);

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
                            gestureRecognizers:
                            <Factory<OneSequenceGestureRecognizer>>{
                              Factory<OneSequenceGestureRecognizer>(
                                    () => EagerGestureRecognizer(),
                              ),
                            },
                            myLocationButtonEnabled: false,
                            initialCameraPosition: CameraPosition(
                              target: LatLng(
                                double.parse(
                                    (state.allRestaurantList[0].lat ?? '1')),
                                double.parse(
                                    ((state.allRestaurantList[0].lng ?? '1'))),
                              ),
                              zoom: 12,
                            ),
                            markers: Set<Marker>.of(stateNotifier.markers),
                            onMapCreated: (GoogleMapController controller) {
                              gController.complete(controller);
                              // _googleMapController = controller;
                              // _googleMapController.getVisibleRegion();
                              // controller.animateCamera(
                              //   CameraUpdate.newLatLngBounds(
                              //       MapUtils.boundsFromLatLngList(
                              //           stateNotifier.markers.map((loc) => loc.position).toList()),
                              //       1),
                              // );
                            },
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
