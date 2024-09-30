import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/widgets/app_button.dart';
import 'package:for_the_table/widgets/expanded_common_text_field.dart';
import '../shared/providers.dart';

@RoutePage()
class AddBioPage extends ConsumerStatefulWidget {
  const AddBioPage({super.key});

  @override
  ConsumerState<AddBioPage> createState() => _AddBioPageState();
}

class _AddBioPageState extends ConsumerState<AddBioPage> {
  @override
  void initState() {
    final stateNotifier = ref.read(profileNotifierProvider.notifier);
    stateNotifier.populateBio();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final stateNotifier = ref.watch(profileNotifierProvider.notifier);
    final state = ref.watch(profileNotifierProvider);
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
          'Add Bio',
          style: AppTextStyles.textStylePoppinsBold.copyWith(
            color: AppColors.colorPrimary,
            fontSize: 16.sp,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0).r,
        child: Column(
          children: [
            SizedBox(
              height: 130.h,
              child: ExpandedCommonTextField(
                maxLines: null,
                expands: true,
                hint: 'Add your bio',
                controller: stateNotifier.bioController,
              ),
            ),
            const Spacer(),
            AppButton(
              text: 'Update',
              loading: state.isLoading,
              disable: state.isLoading,
              onPressed: () => stateNotifier.updateBio(() {
                Navigator.pop(context);
              }),
            ),
            40.verticalSpace,
          ],
        ),
      ),
    );
  }
}
