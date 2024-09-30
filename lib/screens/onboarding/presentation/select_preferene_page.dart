import 'package:auto_route/auto_route.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/routes/app_router.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/core/utils/common_util.dart';
import 'package:for_the_table/widgets/app_button.dart';
import 'package:for_the_table/widgets/custom_richtext.dart';
import 'package:for_the_table/widgets/custom_search_field.dart';
import '../shared/provider.dart';

@RoutePage()
class SelectPreferencePage extends ConsumerStatefulWidget {
  const SelectPreferencePage({super.key});

  @override
  ConsumerState<SelectPreferencePage> createState() => _SelectPreferencePageState();
}

class _SelectPreferencePageState extends ConsumerState<SelectPreferencePage> {
  final emailFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final preferenceNotifier = ref.read(preferenceNotifierProvider.notifier);
      await preferenceNotifier.getAllPreference();
    });
  }

  @override
  Widget build(BuildContext context) {
    var preferenceState = ref.watch(preferenceNotifierProvider);
    final preferenceNotifier = ref.read(preferenceNotifierProvider.notifier);
    var tags = ref.watch(preferenceNotifierProvider).tags;
    final preferencesList = preferenceState.data??[];
    final options = preferencesList
        .map((preference) => preference.title ?? '')
        .where((title) => title.isNotEmpty)
        .toList();

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
                        firstTextStyle: AppTextStyles.textStylePoppinsMedium.copyWith(
                          color: AppColors.colorPrimary,
                          fontSize: 16.sp,
                        ),
                        secondTextStyle: AppTextStyles.textStylePoppinsMedium.copyWith(
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
                            style: AppTextStyles.textStylePoppinsRegular.copyWith(
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
                            onChanged: (val) => preferenceState = preferenceState.copyWith(tags: val),
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
                                      color:
                                          isSelected ? Colors.white : AppColors.colorPrimaryAlpha,
                                    ),
                                  ],
                                ),
                                selected: isSelected,
                                onSelected: (_) {
                                  preferenceNotifier.toggleTag(item.value);
                                },
                                selectedColor: AppColors.colorBlack2,
                                backgroundColor: AppColors.colorWhite,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 8,
                                ).r,
                                labelStyle: TextStyle(
                                  color: isSelected ? Colors.white : AppColors.colorPrimaryAlpha,
                                ),
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(color: AppColors.colorGrey3),
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

                      AutoRouter.of(context)
                          .pushAndPopUntil(const BaseRoute(), predicate: (_) => false);
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
