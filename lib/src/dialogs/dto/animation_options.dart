import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';

class DialogOptions {
  final Curve curve;
  final Duration duration;
  final Alignment position;

  const DialogOptions({
    this.curve = Curves.bounceOut,
    this.duration = const Duration(milliseconds: 700),
    this.position = Alignment.center,
  });
}
