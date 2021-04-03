import 'package:flutter/material.dart';

/// Data class which will contain all necessary information about toast entire
class ToastEntity {
  final OverlayEntry entry;
  final BuildContext context;
  final Duration duration;
  ToastEntity({
    required this.entry,
    required this.context,
    required this.duration,
  });
}
