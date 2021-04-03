import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:queen_alerts/src/dialogs/dto/animation_options.dart';
import 'package:queen_alerts/src/dialogs/widgets/base_queen_dialog.dart';
import 'package:queen_alerts/src/dialogs/widgets/info_hooked.dart';

class DialogsManager {
  DialogsManager._();
  static DialogsManager? _instance;
  static DialogsManager get instance => _instance ?? DialogsManager._();

  void success(BuildContext context) {}
  void info(
    BuildContext context, {
    DialogOptions animationOptions = const DialogOptions(),
  }) {
    _baseBuilder(
        context: context,
        animationOptions: animationOptions,
        builder: (_) => InfoQueenDialog(
              title: 'title',
              subtitle: 'subtitle',
              animationOptions: animationOptions,
            ));
  }

  Future<T> _baseBuilder<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    required DialogOptions animationOptions,
    bool dismissible = true,
  }) async {
    return await showDialog(
      context: context,
      barrierDismissible: dismissible,
      builder: (_) => BaseQueenDialog(
        animationOptions: animationOptions,
        child: builder(_),
      ),
    );
  }
}
// Container(
//                 height: 200,
//                 width: 200,
//                 decoration: ShapeDecoration(color: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))),
//                 child: Center(child: Text("Well hello there!")),
//               ),
