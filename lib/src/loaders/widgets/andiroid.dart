import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AndroidLoadingIndecator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO :: Style Cupertion indecator
    return Container(
      color: Colors.black54,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
