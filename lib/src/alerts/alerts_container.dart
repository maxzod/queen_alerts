import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_alerts/src/alerts/area.dart';
import 'package:queen_alerts/src/alerts/cubit/container_cubit.dart';

class QueenAlertsContiner extends StatelessWidget {
  final Widget child;
  final TextDirection direction;
  const QueenAlertsContiner(
      {required this.child, this.direction = TextDirection.ltr});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ContinerCubit(),
      child: Directionality(
        textDirection: direction,
        child: Stack(
          children: [child, QueenAlertArea()],
        ),
      ),
    );
  }
}
