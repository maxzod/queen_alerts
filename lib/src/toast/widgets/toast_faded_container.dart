import 'package:flutter/material.dart';
import 'package:queen_alerts/src/toast/manager.dart';
import 'package:queen_alerts/src/toast/utils.dart';

/// Widget that will make faded effect  before the givin duration by one second
class FadedToastContainer extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Gravity gravity;
  final Color backgroundColor;

  const FadedToastContainer({
    required this.duration,
    required this.child,
    required this.gravity,
    required this.backgroundColor,
  });
  @override
  _FadedToastContainerState createState() => _FadedToastContainerState();
}

class _FadedToastContainerState extends State<FadedToastContainer> {
  double opacity = 1;
  @override
  void initState() {
    /// set callback to trigger fade ainmation
    /// before the duration is up by 1 second
    Future.delayed(Duration(seconds: widget.duration.inSeconds - 1))
        .then((value) => setState(() => opacity = 0));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
      top: toastTopPostion(size, widget.gravity),
      bottom: toastBottomPostion(size, widget.gravity),
      child: Material(
        child: AnimatedOpacity(
          opacity: opacity,
          duration: Duration(seconds: 1),
          curve: Curves.ease,
          child: SizedBox(
            width: size.width,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: widget.backgroundColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: widget.child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
