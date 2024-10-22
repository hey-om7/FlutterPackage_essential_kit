import 'package:flutter/material.dart';

void myNavigator(BuildContext context, Widget page,
    {bool? replace,
    Duration? delay,
    bool? removeAllPreviousPagesFromStack}) async {
  if (delay != null) await Future.delayed(delay, () {});

  if (replace != null && replace) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
    return;
  }
  if (removeAllPreviousPagesFromStack != null &&
      removeAllPreviousPagesFromStack == true) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => page),
      (Route<dynamic> route) => false,
    );
  }

  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}
