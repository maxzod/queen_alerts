import 'package:flutter/material.dart';
import 'package:queen_alerts/src/alerts/widgets/alert.widget.dart';
import 'package:queen_alerts/src/interface.dart';

class InfoAlertWidget extends StatelessWidget {
  final String title;
  final Duration duration;

  final String? subtitle;

  const InfoAlertWidget({
    required this.title,
    this.subtitle,
    required this.duration,
  });
  @override
  Widget build(BuildContext context) {
    return QueenAlertWidget(
      duration: duration,
      onCloseClicked: () => QueenAlerts.prompt.close(context, tag: 'info'),
      color: Color(0xFF17a2b8),
      icon: Icon(Icons.info),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
      subtitle: subtitle == null
          ? null
          : Text(
              subtitle!,
              style: Theme.of(context).textTheme.bodyText1,
            ),
    );
  }
}
