import 'package:flutter/material.dart';
import 'package:queen_alerts/src/toast/manager.dart';
import 'package:queen_alerts/src/toast/widgets/toast_faded_container.dart';

class BaseWithIconToast extends StatelessWidget {
  final Text text;
  final Color backgroundColor;
  final Gravity gravity;
  final Icon icon;
  final Duration duration;

  const BaseWithIconToast({
    required this.text,
    required this.icon,
    required this.backgroundColor,
    required this.duration,
    this.gravity = Gravity.center,
  });

  @override
  Widget build(BuildContext context) {
    return FadedToastContainer(
      backgroundColor: backgroundColor,
      duration: duration,
      gravity: gravity,
      child: Container(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            text,
          ],
        ),
      ),
    );
  }
}
