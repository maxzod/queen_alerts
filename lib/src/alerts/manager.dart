import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_alerts/src/alerts/cubit/container_cubit.dart';
import 'package:queen_alerts/src/alerts/widgets/alert.widget.dart';
import 'package:queen_alerts/src/alerts/widgets/danger.dart';
import 'package:queen_alerts/src/alerts/widgets/info.dart';
import 'package:queen_alerts/src/alerts/widgets/warning.dart';

/// public api  for developers
/// use `alert()` to alert for info,warnings,errors
/// user `show()` to show your own widget

class PromptsManager {
  /// singletons
  PromptsManager._();
  static PromptsManager? _instance;
  static PromptsManager get instance => _instance ?? PromptsManager._();

  /// display your own alert
  void builder(
    BuildContext context, {
    required WidgetBuilder builder,
    int seconds = 5,
    String? tag,
  }) {
    BlocProvider.of<ContainerCubit>(context).addAlert(
      child: Builder(builder: builder),
      seconds: seconds,
      tag: tag,
    );
  }

  /// build alert like queen alert style
  void custom(
    BuildContext context, {
    Widget? icon,
    Widget? title,
    Widget? subtitle,
    Widget? closeButton,
    Color backGroundColor = Colors.blue,
    int seconds = 5,
    String tag = 'custom',
  }) {
    BlocProvider.of<ContainerCubit>(context).addAlert(
      child: QueenAlertWidget(
        color: backGroundColor,
        duration: Duration(seconds: seconds),
        icon: icon ?? SizedBox(),
        onCloseClicked: () {},
        title: title ?? SizedBox(),
        subtitle: subtitle ?? SizedBox(),
      ),
      seconds: seconds,
      tag: tag,
    );
  }

  /// alert with info
  void info(BuildContext context, {required String title, String? subtitle, int seconds = 5}) {
    BlocProvider.of<ContainerCubit>(context).addAlert(
      child: InfoAlertWidget(
        title: title,
        subtitle: subtitle,
        duration: Duration(seconds: seconds),
      ),
      seconds: seconds,
      tag: 'info',
    );
  }

  /// alert with danger
  void danger(BuildContext context, {required String title, String? subtitle, int seconds = 5}) {
    BlocProvider.of<ContainerCubit>(context).addAlert(
      child: DangerAlertWidget(
        title: title,
        subtitle: subtitle,
        duration: Duration(seconds: seconds),
      ),
      seconds: seconds,
      tag: 'danger',
    );
  }

  /// alert with warning
  void warning(BuildContext context, {required String title, String? subtitle, int seconds = 5}) {
    BlocProvider.of<ContainerCubit>(context).addAlert(
      child: WarningAlertWidget(
        title: title,
        subtitle: subtitle,
        duration: Duration(seconds: seconds),
      ),
      seconds: seconds,
      tag: 'warning',
    );
  }

  /// close alert by tag
  void close(BuildContext context, {required String tag}) {
    BlocProvider.of<ContainerCubit>(context).closeByTag(tag);
  }

  void closeInfo(BuildContext context) => close(context, tag: 'info');
  void closeDanger(BuildContext context) => close(context, tag: 'danger');
  void closeWarning(BuildContext context) => close(context, tag: 'warning');
}
