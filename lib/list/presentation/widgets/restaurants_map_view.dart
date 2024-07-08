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

  Set<Marker> markers = {};
  List<LabelMarker> labelMarkers = [];

  @override
  void initState() {
    final state = ref.read(restaurantNotifierProvider);
    AppLog.log(
        'state.restaurantList.length ------------>>> ${state.restaurantList?.length}');

    var index = 0;

    for (final item in state.restaurantList!) {
      final marker = LabelMarker(
        label: '⭐ ${item.rating}',
        markerId: MarkerId(item.name.toString()),
        position: LatLng(double.parse(item.lat!), double.parse(item.lng!)),
        infoWindow: InfoWindow(
          title: item.name,
        ),
      );
      markers.addLabelMarker(marker).then((_) {
        setState(() {});
      });
      AppLog.log('markers.length -------------->> ${markers.length}');
    }

    AppLog.log('markers -------------->> ${markers}');

    // AppLog.log('markers.length -------------->> ${markers.length}');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(restaurantNotifierProvider);

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
            child: (markers.isNotEmpty)
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
                            double.parse((state.restaurantList![0].lat ?? '1')),
                            double.parse(
                                ((state.restaurantList![0].lng ?? '1'))),
                          ),
                          zoom: 12,
                        ),
                        onMapCreated: (GoogleMapController controller) {
                          // setState(() {
                          //   controller = controller;
                          // });
                          _controller.complete(controller);
                          _googleMapController = controller;
                          _googleMapController.getVisibleRegion();

                          Set<Marker> _markers = Set();

                          // _markers = Set.from(
                          //   markers,
                          // );
                          _markers = markers;
                          Future.delayed(
                              const Duration(milliseconds: 200),
                              () => controller.animateCamera(
                                  CameraUpdate.newLatLngBounds(
                                      MapUtils.boundsFromLatLngList(_markers
                                          .map((loc) => loc.position)
                                          .toList()),
                                      1)));
                        },
                        markers: markers,
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
                                  style: AppTextStyles.textStylePoppinsMedium
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
                                  style: AppTextStyles.textStylePoppinsMedium
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
