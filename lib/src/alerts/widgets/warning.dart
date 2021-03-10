import 'package:flutter/material.dart';
import 'package:queen_alerts/src/alerts/widgets/alert.widget.dart';
import 'package:queen_alerts/src/interface.dart';

class WarningAlertWidget extends StatelessWidget {
  final String title;
  final Duration duration;

  final String? subtitle;

  const WarningAlertWidget({
    required this.title,
    this.subtitle,
    required this.duration,
  });
  @override
  Widget build(BuildContext context) {
    return QueenAlertWidget(
      duration: duration,
      onCloseClicked: () => QueenAlerts.prompt.close(context, tag: 'warning'),
      color: Color(0xFFffc107),
      icon: Icon(Icons.warning),
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
