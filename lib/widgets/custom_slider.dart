import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/screens/restaurant/shared/provider.dart';

class CustomSlider extends ConsumerWidget {
  const CustomSlider({super.key, required this.onChanged});
  final Function(dynamic) onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(restaurantNotifierProvider);
    final deviceSize = MediaQuery.sizeOf(context);

    return SliderTheme(
      data: const SliderThemeData(
        thumbColor: AppColors.colorPrimary,
        overlayColor: Colors.black12,
        valueIndicatorColor: AppColors.colorPrimary,

        /// track color
        activeTrackColor: AppColors.colorPrimaryAlpha,
        inactiveTrackColor: Colors.black12,

        /// ticks in between
        activeTickMarkColor: Colors.transparent,
        inactiveTickMarkColor: Colors.transparent,
      ),
      child: Column(
        children: [
          Row(
            children: [
              buildSideLabel(0),
              5.horizontalSpace,
              Expanded(
                child: Slider(
                  value: state.sliderValue,
                  onChanged: (value) {
                    onChanged(value);
                  },
                  min: 0,
                  max: 10,
                  divisions: 20,
                  label: state.sliderValue.toString(),
                ),
              ),
              5.horizontalSpace,
              buildSideLabel(10),
            ],
          ),
          deviceSize.height < 700 ? 0.verticalSpace : 10.verticalSpace,
          Text(
            'Your Rating-${state.sliderValue}',
            style: AppTextStyles.textStylePoppinsMedium.copyWith(
              fontSize: 13.sp,
              color: AppColors.colorPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSideLabel(double value) {
    return Text(
      value.toString(),
      style: AppTextStyles.textStylePoppinsLight.copyWith(
        color: AppColors.colorPrimary,
      ),
    );
  }
}
