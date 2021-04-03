import 'package:flutter/material.dart';

abstract class ContainerState {
  const ContainerState();
}

class ContainerInitialState extends ContainerState {
  const ContainerInitialState();
}

class AlertsChanged extends ContainerState {
  final List<Widget> items;

  const AlertsChanged(this.items);
}
