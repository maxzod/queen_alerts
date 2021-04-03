import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:queen_alerts/src/alerts/cubit/container_state.dart';
import 'package:queen_alerts/src/alerts/widgets/alert_entity.dart';
export 'package:queen_alerts/src/alerts/cubit/container_state.dart';

class ContainerCubit extends Cubit<ContainerState> {
  ContainerCubit() : super(const ContainerInitialState());
  final _items = <AlertEntity>[];
  Timer? _timer;

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }

  void closeByTag(String tag) {
    _items.removeWhere((element) => element.tag != null && element.tag == tag);
    emitChanges();
  }

  void addAlert({required Widget child, required int seconds, String? tag}) {
    // add item to alerts list
    _items.add(AlertEntity(child: child, seconds: seconds, tag: tag));
    // if the is off open it
    // wake up the timer because there is view on the container
    if (_timer == null || !_timer!.isActive) {
      /// 1 second to remove any old views
      _timer = Timer.periodic(Duration(seconds: 1), _handelTimerTick);
      emitChanges();
    } else {
      // timer is active just add items
      emitChanges();
    }
  }

  void _handelTimerTick(Timer timer) {
    final _countBeforeTick = _items.length;
    _items.removeWhere((element) => element.shouldDisappear());

    final _countAfterTick = _items.length;

    if (_countBeforeTick != _countAfterTick) emitChanges();

    if (_items.isEmpty) _closeTimer();
  }

  void _closeTimer() {
    emit(const AlertsChanged([]));
    _timer!.cancel();
  }

  void emitChanges() => emit(AlertsChanged(_items.map<Widget>((e) => e.child).toList()));
}
