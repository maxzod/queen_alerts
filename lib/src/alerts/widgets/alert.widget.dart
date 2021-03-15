import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class QueenAlertWidget extends StatefulWidget {
  final Widget title;
  final Widget? subtitle;
  final Color color;
  final Widget icon;
  final VoidCallback onCloseClicked;
  final Duration duration;

  QueenAlertWidget({
    required this.title,
    required this.color,
    required this.icon,
    required this.duration,
    required this.onCloseClicked,
    this.subtitle,
  });

  @override
  _QueenAlertWidgetState createState() => _QueenAlertWidgetState();
}

class _QueenAlertWidgetState extends State<QueenAlertWidget> {
  double opacity = 1;
  @override
  void initState() {
    Future.delayed(Duration(seconds: widget.duration.inSeconds - 1))
        .then((value) {
      setState(() {
        opacity = 0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final largeScreen = width > 800;
    return AnimatedOpacity(
      duration: Duration(seconds: 1),
      opacity: opacity,
      child: Card(
        margin: EdgeInsets.symmetric(
            horizontal: width * .01, vertical: size.height * 0.01),
        color: widget.color,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * .01,
          ),
          width: largeScreen ? width * .30 : width * .98,
          height: size.height * .07,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widget.icon,
              SizedBox(width: size.width * 0.01),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.title,
                  if (widget.subtitle != null) widget.subtitle!,
                ],
              ),
              Spacer(),
              IconButton(
                  icon: Icon(Icons.close), onPressed: widget.onCloseClicked)
            ],
          ),
        ),
      ),
    );
  }
}
