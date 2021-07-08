import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

buildFlushBar(
    {@required BuildContext buildContext,
    String title,
    String subtitle,
    bool isError = false}) {
  return Flushbar(
    title: title,
    message: subtitle,
    duration: Duration(seconds: 3),
    flushbarStyle: FlushbarStyle.FLOATING,
    reverseAnimationCurve: Curves.decelerate,
    forwardAnimationCurve: Curves.elasticOut,
    isDismissible: true,
    margin: EdgeInsets.all(10),
    icon: isError
        ? Icon(
            Icons.error,
            color: Colors.red,
            size: 35,
          )
        : Icon(
            Icons.warning,
            color: Colors.amber,
            size: 35,
          ),
    boxShadows: [
      BoxShadow(
          color: Colors.blue[800], offset: Offset(0.0, 2.0), blurRadius: 3.0)
    ],
    backgroundGradient:
        LinearGradient(colors: [Colors.green[500], Colors.green[200]]),
    borderRadius: BorderRadius.circular(8),
  )..show(buildContext);
}
