import 'dart:ui';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../base/shared/providers.dart';
import '../../core/constants/assets.dart';
import '../../core/styles/app_colors.dart';
import '../../core/styles/app_text_styles.dart';
import '../../profile/presentation/widgets/small_profile_container.dart';
import '../../widgets/app_button.dart';
import '../shared/providers.dart';

@RoutePage()
class PeopleProfilePage extends ConsumerStatefulWidget {
  final String peoplename;
  final String peopleimage;

  const PeopleProfilePage({
    super.key,
    required this.peoplename,
    required this.peopleimage,
  });

  @override
  ConsumerState<PeopleProfilePage> createState() => _PeopleProfilePageState();
}

class _PeopleProfilePageState extends ConsumerState<PeopleProfilePage> {
  bool isFollowing = true;


  @override
  Widget build(BuildContext context) {
    // final isFollowing = ref.watch(FollowNotifierProvider);
    final followNotifier = ref.watch(FollowNotifierProvider.notifier);
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: false,
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Container(
          color: AppColors.colorWhite,
          margin: const EdgeInsets.only(top: 20).r,
          padding: const EdgeInsets.symmetric(horizontal: 16).r,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                IconButton(
                  icon: Image.asset(Assets.backArrowButton, scale: 1.5,),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                5.horizontalSpace,
                Text(
                  'Profile',
                  style: AppTextStyles.textStylePoppinsSemiBold
                      .copyWith(fontSize: 15.sp, color: AppColors.colorBlack),
                ),
              ],
              ),
              20.verticalSpace,
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.colorCream,
                  image: const DecorationImage(
                      image: AssetImage(Assets.coverPhoto), //widget.coverphoto
                    fit: BoxFit.fill
                  ),
                  border: Border.all(width: 1, color: AppColors.colorBorder),
                ),
                child: Column(
                  children: [
                    90.verticalSpace,
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 25)
                              .r,
                          decoration: BoxDecoration(
                            color: AppColors.colorWhite,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              80.verticalSpace,
                              Text(
                                widget.peoplename,
                                style: AppTextStyles.textStylePoppinsSemiBold
                                    .copyWith(
                                  fontSize: 16.sp,
                                  color: AppColors.colorText2,
                                ),
                              ),
                              5.verticalSpace,
                              Text(
                                'Joined May 23, 2024',
                                style: AppTextStyles.textStylePoppinsRegular
                                    .copyWith(
                                  fontSize: 10.sp,
                                  color: AppColors.colorText3,
                                ),
                              ),
                              10.verticalSpace,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  AppButton(
                                    width: 160.w,
                                    text: isFollowing? 'Following':'Follow',
                                    color:  isFollowing? AppColors.colorBackground : AppColors.colorBlack,
                                    textColor:  isFollowing? AppColors.colorBlack: AppColors.colorBackground,
                                    onPressed: (){
                                      setState(() {
                                        isFollowing = !isFollowing;
                                      });
                                    }
                                  ),
                                  SmallProfileContainer(
                                      widget: Center(
                                        child: Image.asset(Assets.share),
                                      )),
                                ],
                              ),
                              10.verticalSpace,
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  SmallProfileContainer(
                                    widget: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '1.2M',
                                                  style: AppTextStyles
                                                      .textStylePoppinsBold
                                                      .copyWith(
                                                    fontSize: 14.sp,
                                                    color: AppColors.colorPrimary,
                                                  ),
                                                ),
                                                Text(
                                                  'Followers',
                                                  style: AppTextStyles
                                                      .textStylePoppinsRegular
                                                      .copyWith(
                                                    fontSize: 10.sp,
                                                    color: AppColors.colorText3,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            5.horizontalSpace,
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SmallProfileContainer(
                                    widget: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '1.2M',
                                              style: AppTextStyles
                                                  .textStylePoppinsBold
                                                  .copyWith(
                                                fontSize: 14.sp,
                                                color: AppColors.colorPrimary,
                                              ),
                                            ),
                                            Text(
                                              'Following',
                                              style: AppTextStyles
                                                  .textStylePoppinsRegular
                                                  .copyWith(
                                                fontSize: 10.sp,
                                                color: AppColors.colorText3,
                                              ),
                                            ),
                                          ],
                                        ),
                                        5.horizontalSpace,
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              isFollowing?
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SmallProfileContainer(
                                    widget: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '300',
                                          style: AppTextStyles
                                              .textStylePoppinsBold
                                              .copyWith(
                                            fontSize: 14.sp,
                                            color: AppColors.colorPrimary,
                                          ),
                                        ),
                                        Text(
                                          'Reviewed Restaurant',
                                          style: AppTextStyles
                                              .textStylePoppinsRegular
                                              .copyWith(
                                            fontSize: 10.sp,
                                            color: AppColors.colorText3,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '200',
                                        style: AppTextStyles
                                            .textStylePoppinsBold
                                            .copyWith(
                                          fontSize: 14.sp,
                                          color: AppColors.colorPrimary,
                                        ),
                                      ),
                                      Text(
                                        'Saved Restaurant',
                                        style: AppTextStyles
                                            .textStylePoppinsRegular
                                            .copyWith(
                                          fontSize: 10.sp,
                                          color: AppColors.colorText3,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                                  :const SizedBox(),
                            ],
                          ),
                        ),
                        Positioned(
                          top: -55,
                          left: 0,
                          right: 0,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Center(
                                child: Container(
                                  width: 110.w,
                                  height: 110.h,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
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
                                      image:  DecorationImage(
                                        image: AssetImage(widget.peopleimage),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                              ),
                              Positioned(
                                bottom: -12,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(17),
                                      color: AppColors.colorWhite,
                                    ),
                                    child: Center(
                                      child: Text(
                                        '01',
                                        style: AppTextStyles
                                            .textStylePoppinsMedium
                                            .copyWith(
                                            fontSize: 13.sp,
                                            color: AppColors.colorText),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              18.verticalSpace,
              Text("Posts",
                style: AppTextStyles.textStylePoppinsMedium.copyWith(
                  fontSize: 13.sp,
                  color: AppColors.colorPrimary,
                ),
              ),
              isFollowing
                  ?  SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                width: double.infinity,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 3 / 3,
                  ),
                  itemCount: imageUrls.length,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        margin: const EdgeInsets.all(2),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.asset(
                              imageUrls[index],
                              fit: BoxFit.cover,
                            ),
                            // isFollowing?
                            //   ImageFiltered(
                            //     imageFilter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                            //     child: Container(
                            //       color: Colors.transparent,
                            //     ),
                            //   )
                            //       : SizedBox()
                            // ,
                            Positioned(
                                top: 8,
                                right: 8,
                                child: Image.asset(Assets.save)
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
              :BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  color: Colors.white.withOpacity(0.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: double.infinity,
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 3 / 3,
                      ),
                      itemCount: imageUrls.length,
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            margin: const EdgeInsets.all(2),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.asset(
                                  imageUrls[index],
                                  fit: BoxFit.cover,
                                ),
                                // isFollowing?
                                //   ImageFiltered(
                                //     imageFilter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                                //     child: Container(
                                //       color: Colors.transparent,
                                //     ),
                                //   )
                                //       : SizedBox()
                                // ,
                                Positioned(
                                    top: 8,
                                    right: 8,
                                    child: Image.asset(Assets.save)
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              )
              ,
              20.verticalSpace
            ],
          ),
        ),
      ),
    );
  }

  final List<String> imageUrls = [
   Assets.coverPhoto, Assets.photo,Assets.coverPhoto, Assets.photo,
    Assets.coverPhoto, Assets.photo,Assets.coverPhoto, Assets.photo,
    Assets.coverPhoto, Assets.photo,Assets.coverPhoto, Assets.photo,
  ];
}
