import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:queen_alerts/src/loaders/widgets/andiroid.dart';
import 'package:queen_alerts/src/loaders/widgets/ios.dart';
import 'dart:io' show Platform;

import 'package:queen_alerts/src/loaders/widgets/windows.dart';

/// display loading indecators over the entire app and bloc ui events
/// until you remove it manuly using the stop method
class LoadingManager {
  /// singleton pattren
  LoadingManager._();
  static LoadingManager? _instance;
  static LoadingManager get instance => _instance ?? LoadingManager._();

  /// wather there is loading indecator or not
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  /// current overlay entry (current displaed loading indecator)
  OverlayEntry? _entry;

  /// core function it take params then insert them in the overlay
  void _buildAndInsertEntry(
      {required BuildContext context,
      required WidgetBuilder builder,
      Color backgroundColor = Colors.black12}) {
    /// if isLoading stop
    if (isLoading) stopLoading();

    /// set isLoading to true
    _isLoading = true;

    /// build new entry
    _entry = OverlayEntry(
        builder: (ctx) =>
            Material(color: backgroundColor, child: builder(ctx)));

    /// insert the new entry in the overlay
    Navigator.of(context).overlay!.insert(_entry!);
  }

  /// remove the pervious loading indecator if is visable
  /// clean up
  void stopLoading() {
    /// remove the current indecator if is visable
    _entry?.remove();
    _isLoading = false;
    _entry = null;
  }

  /// build your own loading indicator
  void builder(
      {required BuildContext context,
      required WidgetBuilder builder,
      Color backgroundColor = Colors.black12}) {
    _buildAndInsertEntry(
      context: context,
      builder: builder,
      backgroundColor: backgroundColor,
    );
  }

  /// * platform loaders

  /// load progress indicator for Ios devices
  void loadIos(BuildContext context) {
    _buildAndInsertEntry(
      context: context,
      builder: (_) => IosLoadingIndecator(),
    );
  }

  /// load progress indicator for android devices
  void loadAndroid(BuildContext context) {
    _buildAndInsertEntry(
      context: context,
      builder: (_) => AndroidLoadingIndecator(),
    );
  }

  /// load progress indicator for current platform
  void loadAdaptive(BuildContext context) {
    if (kIsWeb) {
      loadWindows(context);
    } else if (Platform.isAndroid) {
      loadAndroid(context);
    } else if (Platform.isIOS || Platform.isMacOS) {
      loadIos(context);
    } else if (Platform.isWindows) {
      loadWindows(context);
    }
  }

  /// load progress indicator for windoas platform
  void loadWindows(BuildContext context) {
    _buildAndInsertEntry(
      context: context,
      builder: (_) => WindowsIndicator(),
    );
  }
}
