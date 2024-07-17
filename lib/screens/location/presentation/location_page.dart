import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/widgets/app_button.dart';
import '../shared/provider.dart';

@RoutePage()
class LocationPage extends ConsumerWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(locationNotifierProvider);
    final stateNotifier = ref.watch(locationNotifierProvider.notifier);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            30.verticalSpace,
            Text(
              'ENABLE YOUR\nLOCATION',
              textAlign: TextAlign.center,
              style:
                  AppTextStyles.textStyleLatoExtraBold.copyWith(fontSize: 32),
            ),
            20.verticalSpace,
            Image.asset(
              Assets.locationPin,
              width: 150,
            ),
            20.verticalSpace,
            Text(
              'Please allow us to access your\nlocation service',
              textAlign: TextAlign.center,
              style: AppTextStyles.textStyleLatoMedium.copyWith(fontSize: 18),
            ),
            const Spacer(),
            (state.isLoading)
                ? const Text('Loading...')
                : Text(stateNotifier.address),
            5.verticalSpace,
            AppButton(
              loading: state.isLoading,
              text: 'Enable Location',
              onPressed: () async {
                stateNotifier.checkPermission(context);
              },
            ),
            30.verticalSpace,
          ],
        ),
      ),
    );
  }
}
