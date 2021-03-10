import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:queen_alerts/queen_alerts.dart';

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
            toast(context),
            alerts(context),
            loaders(context),
          ],
        ),
      ),
      // body: buildColumnWithExpandedChild(),
    );
  }

  Widget toast(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Text(
          'Toast',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              child: Text('text'),
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
            ),
            SizedBox(width: size.width * 0.01),
            OutlinedButton(
              child: Text('text with icon'),
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
            ),
            SizedBox(width: size.width * 0.01),
            OutlinedButton(
              child: Text('builder'),
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
            ),
          ],
        ),
      ],
    );
  }

  Widget loaders(BuildContext context) {
    void stopLoadingAfterSeconds() {
      Future.delayed(Duration(seconds: 3)).then((value) {
        QueenAlerts.load.stopLoading();
      });
    }

    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Text(
          'Loaders',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              child: Text('loadIos'),
              onPressed: () {
                QueenAlerts.load.loadIos(context);
                stopLoadingAfterSeconds();
              },
            ),
            SizedBox(width: size.width * 0.01),
            OutlinedButton(
              child: Text('loadAndroid'),
              onPressed: () {
                QueenAlerts.load.loadAndroid(context);
                stopLoadingAfterSeconds();
              },
            ),
            SizedBox(width: size.width * 0.01),
            OutlinedButton(
              child: Text('loadAdaptive'),
              onPressed: () {
                QueenAlerts.load.loadAdaptive(context);
                stopLoadingAfterSeconds();
              },
            ),
            SizedBox(width: size.width * 0.01),
            OutlinedButton(
              child: Text('loadWindows'),
              onPressed: () {
                QueenAlerts.load.loadWindows(context);
                stopLoadingAfterSeconds();
              },
            ),
            SizedBox(width: size.width * 0.01),
            OutlinedButton(
              child: Text('text with icon'),
              onPressed: () {
                QueenAlerts.load
                    .builder(context: context, builder: (_) => Container(child: Center(child: Text('plase wait rome was not built in a day'))));
                stopLoadingAfterSeconds();
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget alerts(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Text(
          'Alerts',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              child: Text('dnager'),
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
              child: Text('warning'),
              onPressed: () {
                QueenAlerts.prompt.warning(
                  context,
                  title: 'title',
                  subtitle: 'subtitle',
                );
              },
            ),
            SizedBox(width: size.width * 0.01),
            OutlinedButton(
              child: Text('info'),
              onPressed: () {
                QueenAlerts.prompt.info(
                  context,
                  title: 'title',
                  subtitle: 'subtitle',
                );
              },
            ),
            SizedBox(width: size.width * 0.01),
            OutlinedButton(
              child: Text('custom'),
              onPressed: () {
                QueenAlerts.prompt.custom(
                  context,
                  title: Text('title'),
                  subtitle: Text('subtitle'),
                  backGroundColor: Colors.blue,
                );
              },
            ),
            SizedBox(width: size.width * 0.01),
            OutlinedButton(
              child: Text('builder'),
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
            ),
          ],
        ),
      ],
    );
  }
}
