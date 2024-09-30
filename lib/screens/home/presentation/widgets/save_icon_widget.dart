import 'package:flutter/material.dart';
import 'package:for_the_table/core/constants/assets.dart';

class SaveIconWidget extends StatefulWidget {
  final VoidCallback onTap;
  final bool isSaved;

  const SaveIconWidget({
    super.key,
    required this.isSaved,
    required this.onTap,
  });

  @override
  State<SaveIconWidget> createState() => _SaveIconState();
}

class _SaveIconState extends State<SaveIconWidget> {
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
