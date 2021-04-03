import 'package:flutter/cupertino.dart';
import 'package:queen_alerts/src/toast/manager.dart';

/// get size to leave from top
double? toastTopPosition(Size size, Gravity position) {
  switch (position) {
    case Gravity.top:
      return size.height * 0.1;
    case Gravity.bottom:
      return null;
    case Gravity.center:
      return size.height * .5;
  }
}

/// get size to   from  bottom
double? toastBottomPosition(Size size, Gravity position) {
  switch (position) {
    case Gravity.top:
      return null;
    case Gravity.bottom:
      return size.height * 0.1;
    case Gravity.center:
      return null;
  }
}
