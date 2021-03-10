import 'package:flutter/material.dart';
import 'package:queen_alerts/src/alerts/widgets/alert.widget.dart';
import 'package:queen_alerts/src/interface.dart';

class DangerAlertWidget extends StatelessWidget {
  final String title;

  final String? subtitle;
  final Duration duration;

  const DangerAlertWidget({
    required this.title,
    required this.duration,
    this.subtitle,
  });
  @override
  Widget build(BuildContext context) {
    return QueenAlertWidget(
      duration: duration,
      onCloseClicked: () => QueenAlerts.prompt.close(context, tag: 'danger'),
      color: Color(0xFFdc3545),
      icon: Icon(Icons.dangerous, color: Colors.white),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white),
      ),
      subtitle: subtitle == null
          ? null
          : Text(
              subtitle!,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white),
            ),
    );
  }
}
