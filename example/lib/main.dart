import 'package:flutter/material.dart';
import 'package:queen_alerts/queen_alerts.dart';
import 'package:queen_alerts_example/example.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();

  runApp(MaterialApp(
    title: 'Flutter Demo',
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
    builder: (_, child) => QueenAlertsContainer(
      alignment: Alignment.centerLeft,
      child: child!,
    ),
  ));
}
