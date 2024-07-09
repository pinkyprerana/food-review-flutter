import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/routes/app_router.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/core/utils/modal_bottom_sheet.dart';
import 'package:for_the_table/home/presentation/widgets/post_widget.dart';
import 'package:for_the_table/post_feed/domain/postFeed_model.dart';
import 'package:for_the_table/profile/presentation/widgets/small_profile_container.dart';
import 'package:for_the_table/restaurant/shared/provider.dart';
import 'package:for_the_table/widgets/app_button.dart';
import 'package:for_the_table/widgets/custom_input_field.dart';
import 'package:for_the_table/widgets/expanded_common_text_field.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../post_feed/shared/provider.dart';

@RoutePage()
class RestaurantDetailPage extends ConsumerStatefulWidget {
  const RestaurantDetailPage({
    super.key,
    required this.address,
    required this.image,
    required this.lat,
    required this.lng,
    required this.name,
    required this.description,
    required this.rating,
    required this.numberOfReviews,
  });
  final String lat;
  final String lng;
  final String name;
  final String address;
  final String image;
  final String rating;
  final String description;
  final String numberOfReviews;

  @override
  ConsumerState<RestaurantDetailPage> createState() => _RestaurantDetailPageState();
}

class _RestaurantDetailPageState extends ConsumerState<RestaurantDetailPage> {
  Completer<GoogleMapController> _controller = Completer();

  late CameraPosition _currentPosition;
  List<Marker> _marker = [];
  // List<Marker> _list = [
  //   Marker(markerId: MarkerId('1'), position: )
  // ];

  @override
  void initState() {
    _currentPosition = CameraPosition(
      target: LatLng(double.parse(widget.lat), double.parse(widget.lng)),
      zoom: 12,
    );
    List<Marker> _list = [
      Marker(
          markerId: MarkerId('1'),
          position: LatLng(double.parse(widget.lat), double.parse(widget.lng)),
          infoWindow: InfoWindow(
            title: widget.name,
          ))
    ];
    _marker.addAll(_list);
    super.initState();
  }

  // final CameraPosition _currentPosition =  CameraPosition(
  //   target: LatLng(double.parse(widget.lat), 80.2707),
  //   zoom: 12,
  // );
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);
    final postFeedState = ref.watch(postFeedNotifierProvider);
    final postFeedList = postFeedState.postList;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        // leadingWidth: 60,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            // width: 20.w,
            // height: 20.h,
            alignment: Alignment.center,
            margin:
                const EdgeInsets.only(top: 10, left: 20, right: 0, bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.colorPrimary.withOpacity(0.20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                5.horizontalSpace, //this is for centering the icon
                Icon(Icons.arrow_back_ios,
                    color: AppColors.colorPrimary, size: 15.h),
              ],
            ),
          ),
        ),
        title: Text(
          'Restaurant',
          style: AppTextStyles.textStylePoppinsBold.copyWith(
            color: AppColors.colorPrimary,
            fontSize: 16.sp,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(18.0).r,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                //height: 380.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.colorCream,
                  border: Border.all(width: 1, color: AppColors.colorBorder),
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 175.h,
                          // color: Colors.red,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: GoogleMap(
                              myLocationButtonEnabled: false,
                              initialCameraPosition: _currentPosition,
                              markers: Set<Marker>.of(_marker),
                              onMapCreated: (GoogleMapController controller) {
                                _controller.complete(controller);
                              },
                              // gestureRecognizers: Set()
                              //   ..add(Factory<PanGestureRecognizer>(
                              //       () => PanGestureRecognizer())),
                              gestureRecognizers:
                                  <Factory<OneSequenceGestureRecognizer>>[
                                new Factory<OneSequenceGestureRecognizer>(
                                  () => new EagerGestureRecognizer(),
                                ),
                              ].toSet(),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            // const Spacer(),
                            160.verticalSpace,

                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  width: double.infinity,
                                  // padding: const EdgeInsets.only(
                                  //         left: 20, right: 20, bottom: 25)
                                  //     .r,

                                  decoration: BoxDecoration(
                                    color: AppColors.colorWhite,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                    children: [
                                      80.verticalSpace,
                                      const Divider(
                                        thickness: 1,
                                        color: AppColors.colorBorder,
                                      ),
                                      5.verticalSpace,
                                      Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                          child: (widget.description != '')
                                              ? Text(
                                                  widget.description,
                                                  style: AppTextStyles
                                                      .textStylePoppinsRegular
                                                      .copyWith(
                                                    fontSize: 12.sp,
                                                    color: AppColors
                                                        .colorPrimaryAlpha,
                                                  ),
                                                )
                                              : Text(
                                                  'There is No Description at the moment',
                                                  style: AppTextStyles
                                                      .textStylePoppinsRegular
                                                      .copyWith(
                                                    fontSize: 12.sp,
                                                    color: AppColors
                                                        .colorPrimaryAlpha,
                                                  ),
                                                )),
                                      5.verticalSpace,
                                      const Divider(
                                        thickness: 1,
                                        color: AppColors.colorBorder,
                                      ),
                                      10.verticalSpace,
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding:
                                                  const EdgeInsets.all(8).r,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10)
                                                          .r,
                                                  border: Border.all(
                                                    width: 1,
                                                    color:
                                                        AppColors.colorBorder,
                                                  )),
                                              child: (widget.rating != '')
                                                  ? Text(
                                                      widget.rating,
                                                      style: AppTextStyles
                                                          .textStylePoppinsSemiBold
                                                          .copyWith(
                                                        fontSize: 16.sp,
                                                        color: AppColors
                                                            .colorPrimary,
                                                      ),
                                                    )
                                                  : Text(
                                                      '0.0',
                                                      style: AppTextStyles
                                                          .textStylePoppinsSemiBold
                                                          .copyWith(
                                                        fontSize: 16.sp,
                                                        color: AppColors
                                                            .colorPrimary,
                                                      ),
                                                    ),
                                            ),
                                            5.horizontalSpace,
                                            Flexible(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    decoration: const BoxDecoration(
                                                        border: Border(
                                                            bottom: BorderSide(
                                                                color: AppColors
                                                                    .colorBlack))),
                                                    child: Text(
                                                      'Restaurant Score',
                                                      style: AppTextStyles
                                                          .textStyleUbuntuRegular
                                                          .copyWith(
                                                        fontSize: 10.sp,
                                                        color: AppColors
                                                            .colorPrimary,
                                                      ),
                                                    ),
                                                  ),
                                                  5.verticalSpace,
                                                  (widget.numberOfReviews != '')
                                                      ? Text(
                                                          '${widget.numberOfReviews} reviews',
                                                          style: AppTextStyles
                                                              .textStylePoppinsRegular
                                                              .copyWith(
                                                            fontSize: 10.sp,
                                                            color: AppColors
                                                                .colorPrimaryAlpha,
                                                          ),
                                                          overflow:
                                                              TextOverflow.clip,
                                                        )
                                                      : Text(
                                                          'reviews',
                                                          style: AppTextStyles
                                                              .textStylePoppinsRegular
                                                              .copyWith(
                                                            fontSize: 10.sp,
                                                            color: AppColors
                                                                .colorPrimaryAlpha,
                                                          ),
                                                          overflow:
                                                              TextOverflow.clip,
                                                        )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      10.verticalSpace,
                                      const Divider(
                                        thickness: 1,
                                        color: AppColors.colorBorder,
                                      ),
                                      5.verticalSpace,
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            GestureDetector(
                                              onTap: () => commonModal(context,
                                                  onTap: () {
                                                Navigator.pop(context);
                                              },
                                                  child: Stack(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Image.asset(
                                                                  Assets.rate),
                                                              2.horizontalSpace,
                                                              Image.asset(
                                                                  Assets.rate),
                                                              2.horizontalSpace,
                                                              Image.asset(
                                                                  Assets.rate),
                                                              2.horizontalSpace,
                                                              Image.asset(
                                                                  Assets.rate),
                                                              2.horizontalSpace,
                                                              Image.asset(
                                                                  Assets.rate),
                                                            ],
                                                          ),
                                                          10.verticalSpace,
                                                          Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'Add a Title',
                                                                  style: AppTextStyles
                                                                      .textStylePoppinsMedium
                                                                      .copyWith(
                                                                    fontSize:
                                                                        13.sp,
                                                                    color: AppColors
                                                                        .colorPrimary,
                                                                  ),
                                                                )
                                                              ]),
                                                          5.verticalSpace,
                                                          const CustomInputField(
                                                            hint:
                                                                'Write the title',
                                                          ),
                                                          20.verticalSpace,
                                                          Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'Add a written review',
                                                                  style: AppTextStyles
                                                                      .textStylePoppinsMedium
                                                                      .copyWith(
                                                                    fontSize:
                                                                        13.sp,
                                                                    color: AppColors
                                                                        .colorPrimary,
                                                                  ),
                                                                )
                                                              ]),
                                                          5.verticalSpace,
                                                          SizedBox(
                                                            height: 130.h,
                                                            child:
                                                                const ExpandedCommonTextField(
                                                              maxLines: null,
                                                              expands: true,
                                                              hint:
                                                                  'Write review',
                                                            ),
                                                          ),
                                                          20.verticalSpace,
                                                          Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'Add a Photo or Video',
                                                                  style: AppTextStyles
                                                                      .textStylePoppinsMedium
                                                                      .copyWith(
                                                                    fontSize:
                                                                        13.sp,
                                                                    color: AppColors
                                                                        .colorPrimary,
                                                                  ),
                                                                )
                                                              ]),
                                                          5.verticalSpace,
                                                          DottedBorder(
                                                              borderType:
                                                                  BorderType
                                                                      .RRect,
                                                              radius:
                                                                  const Radius
                                                                      .circular(
                                                                      10),
                                                              strokeWidth: 1,
                                                              color: const Color(
                                                                  0xffCED0D2),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                child: SizedBox(
                                                                  width: 344.w,
                                                                  height: 148.h,
                                                                  child: Center(
                                                                    child: Image
                                                                        .asset(Assets
                                                                            .add),
                                                                  ),
                                                                ),
                                                              )),
                                                          10.verticalSpace,
                                                          const AppButton(
                                                            text: 'Submit',
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  )),
                                              child: Text(
                                                'Write A Review',
                                                style: AppTextStyles
                                                    .textStylePoppinsRegular
                                                    .copyWith(
                                                  fontSize: 10.sp,
                                                  color: AppColors
                                                      .colorPrimaryAlpha,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      10.verticalSpace,
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: -55,
                                  left: 0,
                                  right: 190,
                                  child: Center(
                                    child: Container(
                                      width: 110.w,
                                      height: 110.h,
                                      decoration: BoxDecoration(
                                          // shape: BoxShape.circle,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: AppColors.colorWhite,
                                              width: 4),
                                          boxShadow: [
                                            BoxShadow(
                                                color: AppColors.colorShadow
                                                    .withOpacity(0.1),
                                                offset: const Offset(0, 2),
                                                blurRadius: 10,
                                                spreadRadius: 0)
                                          ],
                                          image: DecorationImage(
                                            image: (widget.image
                                                        .contains('jpg') ||
                                                    widget.image
                                                        .contains('png'))
                                                ? CachedNetworkImageProvider(
                                                    'https://forthetable.dedicateddevelopers.us/uploads/restaurant/${widget.image}')
                                                : const AssetImage(
                                                    Assets.noRestaurantImage),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ),
                                ),
                                // Positioned(
                                //   top: 10,
                                //   left: 155,
                                //   child: Container(
                                //     width: mediaQuery.width * 0.5,
                                //     child: Column(
                                //       children: [
                                //         Container(
                                //           // height: 50.h,
                                //           // color: AppColors.colorRed,
                                //           child: Row(
                                //             mainAxisAlignment:
                                //                 MainAxisAlignment.spaceBetween,
                                //             children: [
                                //               Expanded(
                                //                 child: Text(
                                //                   widget.name,
                                //                   style: AppTextStyles
                                //                       .textStylePoppinsMedium
                                //                       .copyWith(
                                //                     fontSize: 13.sp,
                                //                     color:
                                //                         AppColors.colorPrimary,
                                //                   ),
                                //                 ),
                                //               ),
                                //               IconButton(
                                //                   onPressed: () {
                                //                     AutoRouter.of(context).push(
                                //                         const SavedRoute());
                                //                   },
                                //                   icon: Image.asset(
                                //                     Assets.bookmark,
                                //                     color:
                                //                         AppColors.colorPrimary,
                                //                   ))
                                //             ],
                                //           ),
                                //         ),
                                //         Container(
                                //           color: Colors.amber,
                                //           child: Row(
                                //             mainAxisSize: MainAxisSize.min,
                                //             mainAxisAlignment:
                                //                 MainAxisAlignment.start,
                                //             children: [
                                //               Image.asset(
                                //                 Assets.locationBig,
                                //                 color: AppColors.colorPrimary,
                                //               ),
                                //               3.horizontalSpace,
                                //               Expanded(
                                //                 child: Text(
                                //                   widget.address,
                                //                   // maxLines: 1,
                                //                   // overflow: TextOverflow.ellipsis,
                                //                   style: AppTextStyles
                                //                       .textStylePoppinsRegular
                                //                       .copyWith(
                                //                     fontSize: 10.sp,
                                //                     color: AppColors
                                //                         .colorPrimaryAlpha,
                                //                   ),
                                //                 ),
                                //               ),
                                //             ],
                                //           ),
                                //         ),
                                //       ],
                                //     ),
                                //   ),
                                // )
                                Positioned(
                                  top: 10,
                                  left: (Platform.isIOS) ? 157 : 150,
                                  child: Container(
                                      width: mediaQuery.width * 0.5,
                                      //height: mediaQuery.height * 0.3,
                                      //color: Colors.red,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 140.w,
                                            child: Text(
                                              widget.name,
                                              style: AppTextStyles
                                                  .textStylePoppinsMedium
                                                  .copyWith(
                                                fontSize: 11.sp,
                                                color: AppColors.colorPrimary,
                                              ),
                                            ),
                                          ),
                                          5.verticalSpace,
                                          Row(
                                            children: [
                                              Image.asset(
                                                Assets.locationBig,
                                                color: AppColors.colorPrimary,
                                              ),
                                              3.horizontalSpace,
                                              Container(
                                                width: 130.w,
                                                child: Text(
                                                  widget.address,
                                                  // maxLines: 1,
                                                  // overflow: TextOverflow.ellipsis,
                                                  style: AppTextStyles
                                                      .textStylePoppinsRegular
                                                      .copyWith(
                                                    fontSize: 9.sp,
                                                    color: AppColors
                                                        .colorPrimaryAlpha,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      )),
                                ),
                                Positioned(
                                    left: 310,
                                    top: 10,
                                    child: GestureDetector(
                                      onTap: () => AutoRouter.of(context)
                                          .push(const SavedRoute()),
                                      child: Image.asset(
                                        Assets.bookmark,
                                        color: AppColors.colorPrimary,
                                      ),
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              20.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Post List',
                    style: AppTextStyles.textStylePoppinsMedium.copyWith(
                        fontSize: 13.sp, color: AppColors.colorPrimary),
                  ),
                ],
              ),
              10.verticalSpace,
              //list of posts
              ListView.builder(
                  itemCount: postFeedList.length > 3 ? 3 : postFeedList.length, //3
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(0),
                  itemBuilder: (context, index) {
                    if (index < 0 || index >= postFeedList.length) {
                      return const SizedBox.shrink();
                    }

                    final postList = postFeedList[index];
                    final restaurantState = ref.watch(restaurantNotifierProvider);
                    final restaurantStateNotifier = ref.watch(restaurantNotifierProvider.notifier);
                    restaurantStateNotifier.getPostListRelatedToRestaurant((){},postList.id);
                    final postListOfRestaurant= restaurantState.postList;
                    return postFeedList.isEmpty
                        ? PostWidget(postList: postListOfRestaurant  as DataOfPostModel,)
                        : const Center(
                          child: Text("No post"),
                          );
                  }),
              10.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
