import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_alerts/src/alerts/cubit/container_cubit.dart';
import 'package:queen_alerts/src/alerts/cubit/container_state.dart';

class QueenAlertArea extends StatefulWidget {
  @override
  _QueenAlertAreaState createState() => _QueenAlertAreaState();
}

class _QueenAlertAreaState extends State<QueenAlertArea> {
  @override
  Widget build(BuildContext context) {
    final txtD = Directionality.of(context);
    return Positioned(
      top: kIsWeb ? 0 : MediaQuery.of(context).size.height * 0.01,
      right: txtD == TextDirection.rtl ? 0 : null,
      left: txtD == TextDirection.rtl ? null : 0,
      child: BlocBuilder<ContinerCubit, ContainerState>(builder: (ctx, state) {
        if (state is AlertsChanged) {
          return Column(children: state.items);
        }
        return SizedBox();
      }),
    );
  }
}
