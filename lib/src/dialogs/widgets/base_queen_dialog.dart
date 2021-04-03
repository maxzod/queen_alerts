import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:queen_alerts/src/dialogs/dto/animation_options.dart';

class BaseQueenDialog extends HookWidget {
  final DialogOptions animationOptions;
  final Widget child;

  BaseQueenDialog({
    required this.child,
    required this.animationOptions,
  });

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(duration: animationOptions.duration);
    final _animation = CurvedAnimation(parent: controller, curve: animationOptions.curve);
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: _animation,
          child: true ? Text('center') : child,
        ),
      ),
    );
  }
}
