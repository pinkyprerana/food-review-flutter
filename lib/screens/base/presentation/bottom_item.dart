import 'package:flutter/cupertino.dart';

import '../../../core/styles/app_colors.dart';

class BottomItem extends StatelessWidget {
  final String icon;
  final String text;
  final bool active;
  const BottomItem(
      {super.key,
      required this.icon,
      required this.text,
      required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 56,
      alignment: Alignment.center,
      color: AppColors.colorTransparent,
      child: icon.isEmpty
          ? Container()
          : Image.asset(
              icon,
            ),
    );
  }
}
