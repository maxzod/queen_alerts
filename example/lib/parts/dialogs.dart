import 'package:flutter/material.dart';
import 'package:queen_alerts/queen_alerts.dart';

class DialogsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Text(
          'Dialogs',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Wrap(
          children: [
            OutlinedButton(
              onPressed: () {
                QueenAlerts.dialogs.info(context);
              },
              child: Text('success'),
            ),
            SizedBox(width: size.width * 0.01),
            OutlinedButton(
              onPressed: () {},
              child: Text('text'),
            ),
            SizedBox(width: size.width * 0.01),
            OutlinedButton(
              onPressed: () {},
              child: Text('text'),
            ),
            SizedBox(width: size.width * 0.01),
            OutlinedButton(
              onPressed: () {},
              child: Text('text'),
            ),
            SizedBox(width: size.width * 0.01),
            OutlinedButton(
              onPressed: () {},
              child: Text('text'),
            ),
            SizedBox(width: size.width * 0.01),
            OutlinedButton(
              onPressed: () {},
              child: Text('text'),
            ),
            SizedBox(width: size.width * 0.01),
            OutlinedButton(
              onPressed: () {},
              child: Text('text'),
            ),
            SizedBox(width: size.width * 0.01),
          ],
        ),
      ],
    );
  }
}
