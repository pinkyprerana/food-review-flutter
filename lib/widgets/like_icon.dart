import 'package:flutter/material.dart';
import 'package:for_the_table/core/constants/assets.dart';

class LikeIcon extends StatefulWidget {
  final VoidCallback onTap;
  final bool isLiked;

  const LikeIcon({
    super.key,
    required this.isLiked,
    required this.onTap,
  });

  @override
  State<LikeIcon> createState() => _LikeIconState();
}

class _LikeIconState extends State<LikeIcon> {
  var _isLiked = false;
  @override
  void initState() {
    _isLiked = widget.isLiked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap.call();
        setState(() {
          _isLiked = !_isLiked;
        });
      },
      child: (_isLiked) ? Image.asset(Assets.redHeart) : Image.asset(Assets.like),
    );
  }
}
