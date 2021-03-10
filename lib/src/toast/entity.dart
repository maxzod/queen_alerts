import 'package:flutter/material.dart';

/// Data class wich will contain all neceasry information about toast intery
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
