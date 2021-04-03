import 'package:flutter/material.dart';
import 'package:queen_alerts_example/parts/alerts.dart';
import 'package:queen_alerts_example/parts/dialogs.dart';
import 'package:queen_alerts_example/parts/toast.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('👑 Queen Alerts 👑'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ToastsContainer(),
            AlertsContainer(),
            DialogsContainer(),
          ],
        ),
      ),
    );
  }
}
