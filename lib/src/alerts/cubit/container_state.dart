import 'package:flutter/material.dart';

abstract class ContainerState {
  const ContainerState();
}

class ContainerInintalState extends ContainerState {
  const ContainerInintalState();
}

class AlertsChanged extends ContainerState {
  final List<Widget> items;

  const AlertsChanged(this.items);
}
