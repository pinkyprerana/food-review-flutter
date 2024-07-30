import 'package:flutter/material.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/utils/app_log.dart';

class SaveIcon extends StatefulWidget {
  const SaveIcon({super.key, required this.isBookmarked, required this.onTap});
  final VoidCallback onTap;
  final bool isBookmarked;

  @override
  State<SaveIcon> createState() => _SaveIconState();
}

class _SaveIconState extends State<SaveIcon> {
  var _isSaved;
  @override
  void initState() {
    _isSaved = widget.isBookmarked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppLog.log('_isSaved---------->> $_isSaved');
    AppLog.log('widget.isBookmarked---------->> ${widget.isBookmarked}');
    return GestureDetector(
        onTap: () {
          widget.onTap.call();
          setState(() {
            _isSaved = !_isSaved;
          });
        },
        child: (_isSaved)
            ? const Icon(
                Icons.bookmark,
                color: Colors.amber,
              )
            : const Icon(
                Icons.bookmark_border_outlined,
                color: AppColors.colorPrimary,
              )
        // : Image.asset(
        //     Assets.bookmark,
        //     color: AppColors.colorPrimary,
        //   ),
        );
  }
}
