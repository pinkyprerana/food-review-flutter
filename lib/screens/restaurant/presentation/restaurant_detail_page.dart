import 'dart:async';
import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/app_urls.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/core/utils/modal_bottom_sheet.dart';
import 'package:for_the_table/core/utils/toast.dart';
import 'package:for_the_table/screens/home/presentation/widgets/post_item_widget.dart';
import 'package:for_the_table/screens/restaurant/presentation/widgets/photo_or_video_box.dart';
import 'package:for_the_table/widgets/app_button.dart';
import 'package:for_the_table/widgets/custom_input_field.dart';
import 'package:for_the_table/widgets/custom_slider.dart';
import 'package:for_the_table/widgets/expanded_common_text_field.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../widgets/save_restaurant_icon.dart';
import '../shared/provider.dart';

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
    // required this.rating,
    // required this.numberOfReviews,
    required this.restaurantId,
    required this.isBookmarked,
  });
  final String lat;
  final String lng;
  final String name;
  final String address;
  final String image;
  // final String rating;
  final String description;
  // final String numberOfReviews;
  final String restaurantId;
  final bool isBookmarked;

  @override
  ConsumerState<RestaurantDetailPage> createState() => _RestaurantDetailPageState();
}

class _RestaurantDetailPageState extends ConsumerState<RestaurantDetailPage> {
  final Completer<GoogleMapController> _controller = Completer();
  late CameraPosition _currentPosition;
  List<Marker> marker = [];
  // List<Marker> _list = [
  //   Marker(markerId: MarkerId('1'), position: )
  // ];

  @override
  void initState() {
    _currentPosition = CameraPosition(
      target: LatLng(double.parse(widget.lat), double.parse(widget.lng)),
      zoom: 12,
    );
    List<Marker> list = [
      Marker(
          markerId: const MarkerId('1'),
          position: LatLng(double.parse(widget.lat), double.parse(widget.lng)),
          infoWindow: InfoWindow(
            title: widget.name,
          ))
    ];
    marker.addAll(list);
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final restaurantStateNotifier = ref.read(restaurantNotifierProvider.notifier);
      restaurantStateNotifier.clearStateVariables();
      Future.wait([
        restaurantStateNotifier.getPosts(context: context, restaurantId: widget.restaurantId),
        restaurantStateNotifier.restaurantDetails(widget.restaurantId),
      ]);
      // await restaurantStateNotifier.getPosts(
      //     context: context, restaurantId: widget.restaurantId);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.future.then((ctlrer) => ctlrer.dispose());
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);
    final state = ref.watch(restaurantNotifierProvider);
    final stateNotifier = ref.watch(restaurantNotifierProvider.notifier);

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
            margin: const EdgeInsets.only(top: 10, left: 20, right: 0, bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.colorPrimary.withOpacity(0.20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                5.horizontalSpace, //this is for centering the icon
                Icon(Icons.arrow_back_ios, color: AppColors.colorPrimary, size: 15.h),
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
      body: SmartRefresher(
        controller: stateNotifier.restaurantRefreshController2,
        enablePullUp: true,
        enablePullDown: false,
        onRefresh: () {},
        onLoading: () {
          stateNotifier.loadMorePosts(context, widget.restaurantId);
        },
        footer: CustomFooter(
          builder: (BuildContext context, mode) {
            if (!state.isMoreDataFetchable) {
              mode = LoadStatus.noMore;
            }
            Widget body;
            if (mode == LoadStatus.idle) {
              body = const SizedBox.shrink();
            } else if (mode == LoadStatus.loading) {
              body = const CupertinoActivityIndicator();
            } else if (mode == LoadStatus.failed) {
              body = Text(
                "Load Failed!Click retry!",
                style: AppTextStyles.textStylePoppinsLight,
              );
            } else if (mode == LoadStatus.canLoading) {
              body = Text(
                "release to load more",
                style: AppTextStyles.textStylePoppinsLight,
              );
            } else {
              body = Text(
                "No more Data",
                style: AppTextStyles.textStylePoppinsLight,
              );
            }
            return SizedBox(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        child: SingleChildScrollView(
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
                          SizedBox(
                            width: double.infinity,
                            height: 175.h,
                            // color: Colors.red,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: GoogleMap(
                                myLocationButtonEnabled: false,
                                initialCameraPosition: _currentPosition,
                                markers: Set<Marker>.of(marker),
                                onMapCreated: (GoogleMapController controller) {
                                  _controller.complete(controller);
                                },
                                // gestureRecognizers: Set()
                                //   ..add(Factory<PanGestureRecognizer>(
                                //       () => PanGestureRecognizer())),
                                gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                                  Factory<OneSequenceGestureRecognizer>(
                                    () => EagerGestureRecognizer(),
                                  ),
                                },
                                // gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
                                //   Factory<OneSequenceGestureRecognizer>(
                                //     () => EagerGestureRecognizer(),
                                //   ),
                                // ].toSet(),
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
                                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                            child: (widget.description != '')
                                                ? Text(
                                                    widget.description,
                                                    style: AppTextStyles.textStylePoppinsRegular
                                                        .copyWith(
                                                      fontSize: 12.sp,
                                                      color: AppColors.colorPrimaryAlpha,
                                                    ),
                                                  )
                                                : Text(
                                                    'There is No Description at the moment',
                                                    style: AppTextStyles.textStylePoppinsRegular
                                                        .copyWith(
                                                      fontSize: 12.sp,
                                                      color: AppColors.colorPrimaryAlpha,
                                                    ),
                                                  )),
                                        5.verticalSpace,
                                        const Divider(
                                          thickness: 1,
                                          color: AppColors.colorBorder,
                                        ),
                                        10.verticalSpace,
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                padding: const EdgeInsets.all(8).r,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10).r,
                                                    border: Border.all(
                                                      width: 1,
                                                      color: AppColors.colorBorder,
                                                    )),
                                                child: (stateNotifier.reastaurantDetials
                                                            ?.restaurantDetails?.totalRating !=
                                                        0.0)
                                                    ? Text(
                                                        ((stateNotifier
                                                                        .reastaurantDetials
                                                                        ?.restaurantDetails
                                                                        ?.totalRating ??
                                                                    0.0) )
                                                            .toString(),
                                                        style: AppTextStyles
                                                            .textStylePoppinsSemiBold
                                                            .copyWith(
                                                          fontSize: 16.sp,
                                                          color: AppColors.colorPrimary,
                                                        ),
                                                      )
                                                    : Text(
                                                        '0.0',
                                                        style: AppTextStyles
                                                            .textStylePoppinsSemiBold
                                                            .copyWith(
                                                          fontSize: 16.sp,
                                                          color: AppColors.colorPrimary,
                                                        ),
                                                      ),
                                              ),
                                              5.horizontalSpace,
                                              Flexible(
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      decoration: const BoxDecoration(
                                                          border: Border(
                                                              bottom: BorderSide(
                                                                  color: AppColors.colorBlack))),
                                                      child: Text(
                                                        'Restaurant Score',
                                                        style: AppTextStyles.textStyleUbuntuRegular
                                                            .copyWith(
                                                          fontSize: 10.sp,
                                                          color: AppColors.colorPrimary,
                                                        ),
                                                      ),
                                                    ),
                                                    5.verticalSpace,
                                                    (stateNotifier
                                                                .reastaurantDetials
                                                                ?.restaurantDetails
                                                                ?.restaurantUserCount !=
                                                            0.0)
                                                        ? Text(
                                                            '${stateNotifier.reastaurantDetials?.restaurantDetails?.restaurantUserCount} reviews',
                                                            style: AppTextStyles
                                                                .textStylePoppinsRegular
                                                                .copyWith(
                                                              fontSize: 10.sp,
                                                              color: AppColors.colorPrimaryAlpha,
                                                            ),
                                                            overflow: TextOverflow.clip,
                                                          )
                                                        : Text(
                                                            'reviews',
                                                            style: AppTextStyles
                                                                .textStylePoppinsRegular
                                                                .copyWith(
                                                              fontSize: 10.sp,
                                                              color: AppColors.colorPrimaryAlpha,
                                                            ),
                                                            overflow: TextOverflow.clip,
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
                                          padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0 ),
                                          child: Center(
                                            child: GestureDetector(
                                              onTap: () {
                                                stateNotifier.clearStateSliderValue();
                                                stateNotifier.clearImageOrVideo();
                                                stateNotifier.clearReviewFields();
                                                if (stateNotifier.reastaurantDetials
                                                        ?.restaurantDetails?.isReview ??
                                                    false) {
                                                  showToastMessage(
                                                      'Your review has already been added');
                                                  return;
                                                }

                                                commonModal(
                                                  context,
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  isReviewSource: true,
                                                  child: SingleChildScrollView(
                                                    physics: const AlwaysScrollableScrollPhysics(),
                                                    child: Column(
                                                      children: [
                                                        20.verticalSpace,
                                                        CustomSlider(
                                                          onChanged: (value) {
                                                            stateNotifier
                                                                .sliderValueUpdate(value);
                                                          },
                                                        ),
                                                        10.verticalSpace,
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment.start,
                                                          children: [
                                                            Text(
                                                              'Add a Title',
                                                              style: AppTextStyles
                                                                  .textStylePoppinsMedium
                                                                  .copyWith(
                                                                fontSize: 13.sp,
                                                                color: AppColors.colorPrimary,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        5.verticalSpace,
                                                        CustomInputField(
                                                          controller:
                                                              stateNotifier.titleTextController,
                                                          hint: 'Write the title',
                                                        ),
                                                        mediaQuery.height < 700
                                                            ? 15.verticalSpace
                                                            : 20.verticalSpace,
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment.start,
                                                          children: [
                                                            Text(
                                                              'Add a written review',
                                                              style: AppTextStyles
                                                                  .textStylePoppinsMedium
                                                                  .copyWith(
                                                                fontSize: 13.sp,
                                                                color: AppColors.colorPrimary,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        5.verticalSpace,
                                                        SizedBox(
                                                          height: 130.h,
                                                          child: ExpandedCommonTextField(
                                                            controller: stateNotifier
                                                                .reviewTextController,
                                                            maxLines: null,
                                                            expands: true,
                                                            hint: 'Write review',
                                                          ),
                                                        ),
                                                        mediaQuery.height < 700
                                                            ? 15.verticalSpace
                                                            : 20.verticalSpace,
                                                        Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment.start,
                                                            children: [
                                                              Text(
                                                                'Add a Photo or Video',
                                                                style: AppTextStyles
                                                                    .textStylePoppinsMedium
                                                                    .copyWith(
                                                                  fontSize: 13.sp,
                                                                  color: AppColors.colorPrimary,
                                                                ),
                                                              )
                                                            ]),
                                                        5.verticalSpace,
                                                        const PhotoOrVideoBox(),
                                                        10.verticalSpace,
                                                        AppButton(
                                                          loading: state.isLoadingForReviewSubmit,
                                                          text: 'Submit',
                                                          onPressed: () {
                                                            stateNotifier.submitReview(
                                                                onSuccess: () {
                                                              Navigator.pop(context);
                                                            });
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: SizedBox(
                                                width: double.maxFinite,
                                                child: Text(
                                                  'Write A Review',
                                                  style: AppTextStyles.textStylePoppinsRegular
                                                      .copyWith(
                                                    fontSize: 10.sp,
                                                    color: AppColors.colorPrimaryAlpha,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        // 10.verticalSpace,
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
                                            borderRadius: BorderRadius.circular(10),
                                            border:
                                                Border.all(color: AppColors.colorWhite, width: 4),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: AppColors.colorShadow.withOpacity(0.1),
                                                  offset: const Offset(0, 2),
                                                  blurRadius: 10,
                                                  spreadRadius: 0)
                                            ],
                                            image: DecorationImage(
                                              image: (widget.image.contains('jpg') ||
                                                      widget.image.contains('png') ||
                                                      widget.image.contains('jpeg') ||
                                                      widget.image.contains('gif') ||
                                                      widget.image.contains('bmp') ||
                                                      widget.image.contains('tiff') ||
                                                      widget.image.contains('tif') ||
                                                      widget.image.contains('webp') ||
                                                      widget.image.contains('heic') ||
                                                      widget.image.contains('heif') ||
                                                      widget.image.contains('svg') ||
                                                      widget.image.contains('raw') ||
                                                      widget.image.contains('cr2') ||
                                                      widget.image.contains('nef') ||
                                                      widget.image.contains('arw'))
                                                  ? CachedNetworkImageProvider(
                                                      '${AppUrls.restaurantLocation}${widget.image}')
                                                  : const AssetImage(Assets.noRestaurantImage),
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 10,
                                    left: (Platform.isIOS) ? 157 : 147,
                                    child: SizedBox(
                                        width: mediaQuery.width * 0.5,
                                        //height: mediaQuery.height * 0.3,
                                        //color: Colors.red,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 140.w,
                                              child: Text(
                                                widget.name,
                                                style:
                                                    AppTextStyles.textStylePoppinsMedium.copyWith(
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
                                                SizedBox(
                                                  width: 130.w,
                                                  child: Text(
                                                    widget.address,
                                                    // maxLines: 1,
                                                    // overflow: TextOverflow.ellipsis,
                                                    style: AppTextStyles.textStylePoppinsRegular
                                                        .copyWith(
                                                      fontSize: 9.sp,
                                                      color: AppColors.colorPrimaryAlpha,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        )),
                                  ),
                                  Positioned(
                                      left: (Platform.isIOS) ? 320 : 295,
                                      top: 10,
                                      child: (state.isLoadingForRestaurantDetails ||
                                              stateNotifier.reastaurantDetials == null)
                                          ? const SizedBox(
                                              height: 20,
                                              width: 20,
                                              child: Center(
                                                child: CircularProgressIndicator(
                                                  color: AppColors.colorPrimary,
                                                ),
                                              ),
                                            )
                                          : SaveRestaurantIcon(
                                              // isBookmarked:
                                              //     widget.isBookmarked,
                                              isBookmarked: stateNotifier.reastaurantDetials
                                                      ?.restaurantDetails?.isSave ??
                                                  false,
                                              onTap: () async {
                                                await stateNotifier
                                                    .saveRestaurant(widget.restaurantId);
                                              }))
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
                      style: AppTextStyles.textStylePoppinsMedium
                          .copyWith(fontSize: 13.sp, color: AppColors.colorPrimary),
                    ),
                  ],
                ),
                10.verticalSpace,

                //list of posts
                (state.isLoadingForPosts)
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.colorPrimary,
                        ),
                      )
                    : (state.postPerRestaurantList != null &&
                            (state.postPerRestaurantList?.isNotEmpty ?? false))
                        ? ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.postPerRestaurantList?.length ?? 0,
                            itemBuilder: (context, index) {
                              return PostItemWidget2(
                                postList: state.postPerRestaurantList![index],
                                restaurantId:
                                    state.postPerRestaurantList?[index].restaurantInfo?.id ?? '',
                                userId: state.postPerRestaurantList?[index].userInfo?.id ?? '',
                                isRequested:
                                    state.postPerRestaurantList?[index].isFollowingRequest ?? false,
                                isFollowing:
                                    state.postPerRestaurantList?[index].isFollowing ?? false,
                                commentCount: state.postPerRestaurantList?[index].commentCount ?? 0,
                                restaurantAddress:
                                    state.postPerRestaurantList?[index].restaurantInfo?.address ??
                                        '',
                                userName:
                                    state.postPerRestaurantList?[index].userInfo?.fullName ?? '',
                                userImage:
                                    '${AppUrls.profilePicLocation}/${state.postPerRestaurantList?[index].userInfo?.profileImage}',
                                restaurantName:
                                    state.postPerRestaurantList?[index].restaurantInfo?.name ?? '',
                                cuisine:
                                    state.postPerRestaurantList?[index].preferenceInfo?.title ?? '',
                                description: state.postPerRestaurantList?[index].description ?? '',
                                title: state.postPerRestaurantList?[index].title ?? '',
                                image:
                                    '${AppUrls.postImageLocation}${state.postPerRestaurantList?[index].file}',
                                isLiked: state.postPerRestaurantList?[index].isMyLike,
                                isSaved: state.postPerRestaurantList?[index].isSave,
                              );
                            },
                            separatorBuilder: (BuildContext context, int index) => 5.verticalSpace,
                          )
                        : Center(
                            child: Text(
                              'No Posts Found',
                              textAlign: TextAlign.center,
                              style: AppTextStyles.textStylePoppins.copyWith(
                                fontSize: 15.sp,
                              ),
                            ),
                          ),

                // 10.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
