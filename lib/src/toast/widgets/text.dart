import 'package:flutter/material.dart';
import 'package:queen_alerts/src/toast/manager.dart';
import 'package:queen_alerts/src/toast/widgets/toast_faded_container.dart';

class BaseToast extends StatelessWidget {
  final Text text;
  final Color backgroundColor;
  final Gravity gravity;
  final Duration duration;

  const BaseToast({
    required this.text,
    required this.backgroundColor,
    required this.duration,
    this.gravity = Gravity.center,
  });

  @override
  Widget build(BuildContext context) {
    return FadedToastContainer(
      duration: duration,
      gravity: gravity,
      backgroundColor: backgroundColor,
      child: text,
    );
  }
}
