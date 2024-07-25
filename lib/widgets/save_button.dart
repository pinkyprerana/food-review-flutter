import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/constants/assets.dart';

class SaveButtonWidget extends ConsumerStatefulWidget {
  final bool isSavePost;
  final bool isSaved;

  const SaveButtonWidget({
    super.key,
    required this.isSavePost,
    required this.isSaved,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SaveButtonWidgetState();
}

class _SaveButtonWidgetState extends ConsumerState<SaveButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return
        // widget.isSavePost
        //     ? const SizedBox(
        //         height: 20,
        //         width: 20,
        //         child: Center(
        //           child: CircularProgressIndicator(
        //             color: AppColors.colorWhite,
        //           ),
        //         ),
        //       )
        //     :
        widget.isSaved
            ? Image.asset(
                Assets.saved,
                scale: 2,
              )
            : Image.asset(Assets.bookmark);
  }
}
