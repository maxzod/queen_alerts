import 'package:flutter/material.dart';
import 'package:queen_alerts/queen_alerts.dart';

class ToastsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Text(
          'Toast',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Wrap(
          children: [
            OutlinedButton(
              onPressed: () {
                QueenAlerts.toast.text(
                  context: context,
                  text: Text(
                    'toast with text : you can add any text Widget you want ! \n'
                    'also you can set the background color and the gravity [top,center,bottom]',
                    textAlign: TextAlign.center,
                  ),
                  backgroundColor: Colors.blue,
                );
              },
              child: Text('text'),
            ),
            SizedBox(width: size.width * 0.01),
            OutlinedButton(
              onPressed: () {
                QueenAlerts.toast.withIcon(
                  context: context,
                  text: Text(
                    'if you like it then like it on pub.dev :D',
                    textAlign: TextAlign.center,
                  ),
                  icon: Icon(Icons.star_outline),
                  backgroundColor: Colors.blue,
                );
              },
              child: Text('text with icon'),
            ),
            SizedBox(width: size.width * 0.01),
            OutlinedButton(
              onPressed: () {
                QueenAlerts.toast.builder(
                  context: context,
                  builder: (context) {
                    return Positioned(
                      top: 50,
                      height: 50,
                      width: 50,
                      left: 100,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        color: Colors.yellow,
                        child: CircularProgressIndicator(),
                      ),
                    );
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
