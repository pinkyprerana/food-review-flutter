import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/location/shared/provider.dart';
import 'package:for_the_table/widgets/app_button.dart';

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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            (state.isLoading)
                ? Text('Loading...')
                : Text(stateNotifier.address),
            5.verticalSpace,
            AppButton(
                text: 'Current Location',
                onPressed: () async {
                  stateNotifier.checkPermission(context);
                })
          ],
        ),
      ),
    );
  }
}
