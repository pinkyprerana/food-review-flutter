import 'package:auto_route/auto_route.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/auth/shared/providers.dart';
import 'package:for_the_table/core/routes/app_router.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/core/utils/common_util.dart';
import 'package:for_the_table/core/utils/toast.dart';
import 'package:for_the_table/core/utils/validator.dart';
import 'package:for_the_table/widgets/app_button.dart';
import 'package:for_the_table/widgets/custom_richtext.dart';
import 'package:for_the_table/widgets/custom_search_field.dart';

@RoutePage()
class SelectPreferencePage extends ConsumerStatefulWidget {
  const SelectPreferencePage({super.key});

  @override
  ConsumerState<SelectPreferencePage> createState() =>
      _SelectPreferencePageState();
}

class _SelectPreferencePageState extends ConsumerState<SelectPreferencePage> {
  final emailFocusNode = FocusNode();

  // multiple choice value
  List<String> tags = [];

  // list of string options
  List<String> options = [
    'Chinese Food',
    'Mexican Food',
    'Indian Cuisine',
    'Thai Food',
    'Continental',
    'Vegan',
    'Dairy Food',
    'hello worls',
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isScreenSmall = size.height < 750;
    final stateNotifier = ref.read(authNotifierProvider.notifier);
    final state = ref.read(authNotifierProvider);
    return Scaffold(
      backgroundColor: AppColors.colorBlack2,
      body: GestureDetector(
        onTap: () => dismissKeyboard(context),
        child: Column(
          children: [
            Container(
              height: 1.sh,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      0.07.sh.verticalSpace,
                      CustomRichText(
                        firstText: 'Enter Your',
                        secondText: 'Preferences',
                        firstTextStyle:
                            AppTextStyles.textStylePoppinsMedium.copyWith(
                          color: AppColors.colorPrimary,
                          fontSize: 16.sp,
                        ),
                        secondTextStyle:
                            AppTextStyles.textStylePoppinsMedium.copyWith(
                          color: AppColors.colorPrimaryAlpha,
                          fontSize: 16.sp,
                        ),
                      ),
                      10.verticalSpace,
                      Text(
                        'Select your Preferred food categories',
                        style: AppTextStyles.textStylePoppinsRegular.copyWith(
                          color: AppColors.colorPrimaryAlpha,
                          fontSize: 12.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomSearchField(),
                      20.verticalSpace,
                      Row(
                        children: [
                          Text(
                            'Preferences',
                            style:
                                AppTextStyles.textStylePoppinsRegular.copyWith(
                              color: AppColors.colorPrimaryAlpha,
                              fontSize: 12.sp,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      10.verticalSpace,
                      SizedBox(
                        height: 0.40.sh,
                        child: SingleChildScrollView(
                          physics: const ClampingScrollPhysics(),
                          primary: true,
                          child: ChipsChoice<String>.multiple(
                            value: tags,
                            padding: EdgeInsets.zero,
                            onChanged: (val) => setState(() => tags = val),
                            choiceItems: C2Choice.listFrom<String, String>(
                              source: options,
                              value: (i, v) => v,
                              label: (i, v) => v,
                              tooltip: (i, v) => v,
                            ),
                            textDirection: TextDirection.ltr,
                            wrapped: true,
                            choiceBuilder: (item, i) {
                              final isSelected = tags.contains(item.value);
                              return ChoiceChip(
                                showCheckmark: false,
                                label: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(item.label),
                                    6.horizontalSpace,
                                    Icon(
                                      isSelected
                                          ? Icons.check_circle
                                          : Icons.add_circle_outline_sharp,
                                      size: 16,
                                      color: isSelected
                                          ? Colors.white
                                          : AppColors.colorPrimaryAlpha,
                                    ),
                                  ],
                                ),
                                selected: isSelected,
                                onSelected: (_) {
                                  setState(() {
                                    isSelected
                                        ? tags.remove(item.value)
                                        : tags.add(item.value);
                                  });
                                },
                                selectedColor: AppColors.colorBlack2,
                                backgroundColor: AppColors.colorWhite,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 8,
                                ).r,
                                labelStyle: TextStyle(
                                  color: isSelected
                                      ? Colors.white
                                      : AppColors.colorPrimaryAlpha,
                                ),
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      color: AppColors.colorGrey3),
                                  borderRadius: isSelected
                                      ? BorderRadius.circular(13)
                                      : BorderRadius.circular(10),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  AppButton(
                    text: 'Submit',
                    onPressed: () {
                      dismissKeyboard(context);
                      // TODO: Handle forgot password logic here
                      AutoRouter.of(context).pushAndPopUntil(const BaseRoute(),
                          predicate: (_) => false);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
