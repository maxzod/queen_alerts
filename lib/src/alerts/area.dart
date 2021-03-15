import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_alerts/src/alerts/cubit/container_cubit.dart';
import 'package:queen_alerts/src/alerts/cubit/container_state.dart';

class QueenAlertArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContinerCubit, ContainerState>(
      builder: (ctx, state) {
        if (state is AlertsChanged) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: state.items,
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
