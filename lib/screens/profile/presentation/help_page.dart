import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/widgets/app_button.dart';
import 'package:for_the_table/widgets/custom_input_field.dart';
import 'package:for_the_table/widgets/expanded_common_text_field.dart';
import '../shared/providers.dart';

@RoutePage()
class HelpPage extends ConsumerStatefulWidget {
  const HelpPage({super.key});

  @override
  ConsumerState<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends ConsumerState<HelpPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      final stateNotifier = ref.watch(profileNotifierProvider.notifier);
      stateNotifier.populateContactDetails();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final stateNotifier = ref.watch(profileNotifierProvider.notifier);
    final state = ref.watch(profileNotifierProvider);

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
          'Help',
          style: AppTextStyles.textStylePoppinsBold.copyWith(
            color: AppColors.colorPrimary,
            fontSize: 16.sp,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0).r,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Contact us',
                    style: AppTextStyles.textStylePoppinsMedium.copyWith(
                      fontSize: 13.sp,
                      color: AppColors.colorPrimary,
                    ),
                  ),
                ],
              ),
              10.verticalSpace,
              CustomInputField(
                label: 'Full name',
                hint: 'Enter your full name',
                controller: stateNotifier.contactNameController,
              ),
              10.verticalSpace,
              CustomInputField(
                label: 'Email',
                hint: 'Enter the email',
                controller: stateNotifier.contactEmailController,
              ),
              10.verticalSpace,
              CustomInputField(
                label: 'Phone number',
                hint: 'Enter the phone number',
                controller: stateNotifier.contactPhoneController,
              ),
              10.verticalSpace,
              SizedBox(
                height: 130.h,
                child: ExpandedCommonTextField(
                  label: 'Message',
                  maxLines: null,
                  expands: true,
                  hint: 'Enter message here',
                  controller: stateNotifier.contactMessageController,
                ),
              ),
              20.verticalSpace,
              AppButton(
                text: 'Send',
                loading: state.isLoading,
                disable: state.isLoading,
                onPressed: () => stateNotifier.requestHelp(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
