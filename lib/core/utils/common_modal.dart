import 'package:flutter/material.dart';

import '../styles/app_colors.dart';

Future<void> commonModal(BuildContext context, Widget child,
    {Color backgroundColor = AppColors.colorWhite,
    Function()? callback,
    bool showDragHandle = false}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    isDismissible: false,
    enableDrag: showDragHandle,
    showDragHandle: showDragHandle,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16))),
    builder: (context) => showDragHandle
        ? FractionallySizedBox(
            heightFactor: 0.9,
            child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 20,
                        offset: Offset(5, 10),
                        spreadRadius: 0.1,
                        blurStyle: BlurStyle.normal),
                  ],
                ),
                child: child),
          )
        : Container(
            // padding: EdgeInsets.only(
            //     bottom: MediaQuery.of(context).viewInsets.bottom),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16)),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 20,
                    offset: Offset(5, 10),
                    spreadRadius: 0.1,
                    blurStyle: BlurStyle.normal),
              ],
            ),
            child: child),
  );
}
