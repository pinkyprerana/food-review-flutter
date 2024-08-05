import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/utils/app_log.dart';
import 'package:for_the_table/screens/restaurant/presentation/widgets/video_widget.dart';
import 'package:for_the_table/screens/restaurant/shared/provider.dart';

class PhotoOrVideoBox extends ConsumerWidget {
  const PhotoOrVideoBox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateNotifier = ref.watch(restaurantNotifierProvider.notifier);
    final state = ref.watch(restaurantNotifierProvider);
    AppLog.log('state.imageOrVideo------------ ${state.imageOrVideo?.path}');
    return GestureDetector(
      onTap: () async {
        stateNotifier.checkPermissionForGallery(context);
      },
      child: DottedBorder(
          borderType: BorderType.RRect,
          radius: const Radius.circular(10),
          strokeWidth: 1,
          color: const Color(0xffCED0D2),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
                width: 344.w,
                height: 148.h,
                child: state.imageOrVideo == null
                    ? Center(
                        child: Image.asset(Assets.add),
                      )
                    : state.isVideo
                        ? VideoWidget(File(state.imageOrVideo!.path))
                        : Image.file(File(state.imageOrVideo!.path))
                // child: (state.imageOrVideo != null)
                //     ? Image.file(File(state.imageOrVideo!.path))
                //     : Center(
                //         child: Image.asset(Assets.add),
                //       ),
                ),
          )),
    );
  }
}
