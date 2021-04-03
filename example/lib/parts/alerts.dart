import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:queen_alerts/queen_alerts.dart';

class AlertsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Text(
          'Alerts',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Wrap(
          children: [
            OutlinedButton(
              child: Text('danger'),
              onPressed: () {
                QueenAlerts.prompt.danger(
                  context,
                  title: 'title',
                  subtitle: 'subtitle',
                );
              },
            ),
            SizedBox(width: size.width * 0.01),
            OutlinedButton(
              onPressed: () {
                QueenAlerts.prompt.warning(
                  context,
                  title: 'title',
                  subtitle: 'subtitle',
                );
              },
              child: Text('warning'),
            ),
            SizedBox(width: size.width * 0.01),
            OutlinedButton(
              onPressed: () {
                QueenAlerts.prompt.info(
                  context,
                  title: 'title',
                  subtitle: 'subtitle',
                );
              },
              child: Text('info'),
            ),
            SizedBox(width: size.width * 0.01),
            OutlinedButton(
              onPressed: () {
                QueenAlerts.prompt.custom(
                  context,
                  title: Text('title'),
                  subtitle: Text('subtitle'),
                  backGroundColor: Colors.blue,
                );
              },
              child: Text('custom'),
            ),
            SizedBox(width: size.width * 0.01),
            OutlinedButton(
              onPressed: () {
                QueenAlerts.prompt.builder(
                  context,
                  builder: (context) {
                    return Material(
                        child: Card(
                      margin: EdgeInsets.symmetric(
                        horizontal: kIsWeb ? size.width * 0.01 : size.width * .03,
                        vertical: size.height * 0.01,
                      ),
                      color: Colors.lightBlue,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: size.width * .01),
                        width: kIsWeb ? size.width * 0.25 : size.width,
                        height: size.height * .07,
                        child: Center(child: Text('alert builder')),
                      ),
                    ));
                  },
                );
              },
              child: Text('builder'),
            ),
          ],
        ),
      ],
    );
  }
}
