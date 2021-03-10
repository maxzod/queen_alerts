import 'package:flutter/material.dart';

class AlertEntity {
  final Widget child;
  final int seconds;
  late final DateTime createdAt;
  final String? tag;

  AlertEntity({required this.child, required this.seconds, this.tag}) {
    createdAt = DateTime.now();
  }

  bool shouldDisappear() {
    final timeToGo = createdAt.add(Duration(seconds: seconds));
    final now = DateTime.now();
    return now.isAfter(timeToGo);
  }

  Widget build() {
    return child;
  }
}
