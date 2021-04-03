import 'package:queen_alerts/src/alerts/manager.dart';
import 'package:queen_alerts/src/dialogs/manager.dart';
import 'package:queen_alerts/src/toast/manager.dart';

/// public api for developers to ease the library usage with one interface
abstract class QueenAlerts {
  /// show alerts
  static final prompt = PromptsManager.instance;

  /// show toasts [https://developer.android.com/guide/topics/ui/notifiers/toasts]
  static final toast = ToastManager.instance;

  /// show dialogs
  static final dialogs = DialogsManager.instance;
}
