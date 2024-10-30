import 'package:flutter/material.dart';

class HeartAnimationWidget extends StatefulWidget {
  const HeartAnimationWidget({
    super.key,
    required this.child,
    required this.isAnimating,
    this.duration = const Duration(milliseconds: 150),
    this.onEnd,
  });
  final Widget child;
  final bool isAnimating;
  final Duration duration;
  final VoidCallback? onEnd;

  @override
  State<HeartAnimationWidget> createState() => _HeartAnimationWidgetState();
}

class _HeartAnimationWidgetState extends State<HeartAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scale;

  @override
  void initState() {
    super.initState();
    final halfDuration = widget.duration.inMilliseconds ~/ 2;
    controller = AnimationController(
      vsync: this,
      duration: Duration(microseconds: halfDuration),
    );
    scale = Tween<double>(begin: 1, end: 1.2).animate(controller);
  }

  @override
  void didUpdateWidget(covariant HeartAnimationWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isAnimating != widget.isAnimating) {
      doAnimation();
    }
  }

  Future doAnimation() async {
    await controller.forward();
    await controller.reverse();
    await Future.delayed(const Duration(milliseconds: 400));

    if (widget.onEnd != null) {
      widget.onEnd!();
    }
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(scale: scale, child: widget.child);
  }
}
