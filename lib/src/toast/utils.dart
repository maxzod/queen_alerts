import 'package:flutter/cupertino.dart';
import 'package:queen_alerts/src/toast/manager.dart';

/// get size to leave from top
double? toastTopPostion(Size size, Gravity position) {
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
double? toastBottomPostion(Size size, Gravity position) {
  switch (position) {
    case Gravity.top:
      return null;
    case Gravity.bottom:
      return size.height * 0.1;
    case Gravity.center:
      return null;
  }
}

// int? bottomValue(BuildContext context, ToastPosition position) {
//   switch (position) {
//     case ToastPosition.top:
//       return null;

//     case ToastPosition.bottom:
//       return 0;

//     case ToastPosition.center:
//       return (MediaQuery.of(context).size.height * .5).toInt();
//   }
// }
