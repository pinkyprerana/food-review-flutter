import 'package:flutter/material.dart';
import 'package:for_the_table/core/constants/assets.dart';

class SaveIcon extends StatefulWidget {
  final VoidCallback onTap;
  final bool isSaved;

  const SaveIcon({
    super.key,
    required this.isSaved,
    required this.onTap,
  });

  @override
  State<SaveIcon> createState() => _SaveIconState();
}

class _SaveIconState extends State<SaveIcon> {
  var _isSaved = false;
  @override
  void initState() {
    _isSaved = widget.isSaved;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap.call();
        setState(() {
          _isSaved = !_isSaved;
        });
      },
      child: (_isSaved)
          ? Image.asset(
              Assets.saved,
              scale: 2,
            )
          : Image.asset(Assets.bookmark),
    );
  }
}
