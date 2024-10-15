import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';

import '../shared/providers.dart';

@RoutePage()
class AppInfoPage extends ConsumerStatefulWidget {
  const AppInfoPage({super.key});

  @override
  ConsumerState<AppInfoPage> createState() => _AppInfoPageState();
}


class _AppInfoPageState extends ConsumerState<AppInfoPage> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_)async{
      final profileNotifier = ref.read(profileNotifierProvider.notifier);
      await profileNotifier.getAppInfo();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(profileNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        // leadingWidth: 60,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
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
          'App Info',
          style: AppTextStyles.textStylePoppinsBold.copyWith(
            color: AppColors.colorPrimary,
            fontSize: 16.sp,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child:profileState.isLoading
              ? const CircularProgressIndicator(color: AppColors.colorPrimary,)
              :  Align(
              alignment: Alignment.topLeft,
              child: Text(
              profileState.appInfo.isEmpty ? "App info will appear here" : profileState.appInfo,
              style: AppTextStyles.textStylePoppinsRegular.copyWith(
                color: AppColors.colorPrimaryAlpha,
                fontSize: 12.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
