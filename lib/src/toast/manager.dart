import 'dart:async';

import 'package:flutter/material.dart';
import 'package:queen_alerts/src/toast/entity.dart';
import 'package:queen_alerts/src/toast/widgets/text.dart';
import 'package:queen_alerts/src/toast/widget/with_icon.dart';

/// which gravity to place the toast in
enum Gravity { top, bottom, center }

/// this class is responsible for
/// displaying (inserting Widgets in the overlay)
/// then remove them after while (provided duration)
/// * what will happened if i inserted tow toasts directly after each other ?
/// * the manager will remove the old one even if the duration did not finish yet
/// ? you can user builder method to display your own custom style toast which is a => Widget
/// ? or you can user pre-built toasts
class ToastManager {
  /// singleton pattern
  ToastManager._();
  static ToastManager? _instance;
  static ToastManager get instance => _instance ?? ToastManager._();

  /// the current displayed entry (toast)
  final _pending = <ToastEntity>[];

  /// if true there is another toast on the the screen
  var _isVisible = false;

  /// the manager main method which will insert in remove toasts
  void _buildAndInsertEntry({
    required BuildContext context,
    required WidgetBuilder builder,
    required Duration duration,
  }) {
    /// insert the new toast to _pending list
    _pending.add(
      ToastEntity(
        entry: OverlayEntry(builder: builder),
        context: context,
        duration: duration,
      ),
    );

    if (!_isVisible) _displayNext();
  }

  void _displayNext() {
    /// true so if any one calls to show another toast it will not trigger this function
    _isVisible = true;

    /// current `ToastEntity` to display
    final _entity = _pending.first;

    /// get the overlay and insert entry on it
    Navigator.of(_entity.context).overlay!.insert(_entity.entry);

    /// await until the toast time finish then remove it from the overlay
    /// then call the function to show another one and go on .....
    Future.delayed(_entity.duration).then((value) {
      /// remove the current entry from the overlay
      _pending.first.entry.remove();

      /// remove the current `ToastEntity` from the list
      _pending.remove(_entity);

      /// if the _pending list is empty means there is no other toasts to show so stop calling this function
      /// just set to false so any other toast will be aded can trigger this function
      if (_pending.isEmpty) {
        _isVisible = false;
      } else {
        _displayNext();
      }
    });
  }

  /// build your own toast
  /// you need to wrap your Widget inside `Positioned` Widget
  /// and set the height and width
  /// also set the top,bottom,right,left attributes to place the toast where ever you want
  void builder({
    required BuildContext context,
    required WidgetBuilder builder,
    int seconds = 3,
  }) {
    _buildAndInsertEntry(
      context: context,
      builder: builder,
      duration: Duration(seconds: seconds),
    );
  }

  /// display toast with text
  void text({
    required BuildContext context,
    required Text text,
    Color backgroundColor = Colors.black45,
    int seconds = 3,
    Gravity gravity = Gravity.bottom,
  }) {
    _buildAndInsertEntry(
      context: context,
      duration: Duration(seconds: seconds),
      builder: (_) => BaseToast(
        backgroundColor: backgroundColor,
        text: text,
        duration: Duration(seconds: seconds),
        gravity: gravity,
      ),
    );
  }

  /// _show toast with Icon
  void withIcon({
    required BuildContext context,
    required Text text,
    required Icon icon,
    Color backgroundColor = Colors.black45,
    int seconds = 3,
    Gravity gravity = Gravity.center,
  }) {
    _buildAndInsertEntry(
      context: context,
      duration: Duration(seconds: seconds),
      builder: (_) => BaseWithIconToast(
        backgroundColor: backgroundColor,
        text: text,
        icon: icon,
        duration: Duration(seconds: seconds),
        gravity: gravity,
      ),
    );
  }
}
