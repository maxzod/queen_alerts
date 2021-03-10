import 'package:flutter/material.dart';
import 'package:queen_alerts/queen_alerts.dart';
import 'package:queen_alerts_example/example.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    debugShowCheckedModeBanner: false,
    // home: TestScreen(),
    home: HomeScreen(),
    builder: (_, child) => QueenAlertsContiner(
      // direction: TextDirection.ltr,
      child: child!,
    ),
  ));
}
