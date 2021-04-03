import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_alerts/src/alerts/area.dart';
import 'package:queen_alerts/src/alerts/cubit/container_cubit.dart';

class QueenAlertsContainer extends StatelessWidget {
  final Widget child;
  final Alignment alignment;
  const QueenAlertsContainer({
    required this.child,
    this.alignment = Alignment.bottomCenter,
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ContainerCubit(),
      child: Stack(
        alignment: alignment,
        children: [child, QueenAlertArea()],
      ),
    );
  }
}
