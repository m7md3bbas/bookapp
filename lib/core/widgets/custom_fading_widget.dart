import 'package:flutter/material.dart';

class CustomFadingWidget extends StatefulWidget {
  const CustomFadingWidget({super.key, required this.child});
  final Widget child;
  @override
  State<CustomFadingWidget> createState() => _CustomFadingWidgetState();
}

class _CustomFadingWidgetState extends State<CustomFadingWidget>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationcontroller;

  @override
  void initState() {
    animationcontroller = AnimationController(vsync: this);
    animation =
        Tween<double>(begin: 0.2, end: 0.8).animate(animationcontroller);
    animation.addListener(
      () {
        setState(() {});
      },
    );
     animationcontroller.repeat(
            reverse: true, period: const Duration(milliseconds: 600));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: animation.value,
      child: widget.child,
    );
  }
}
