import 'package:flutter/material.dart';

double getDeviceWidth(context) {
  return MediaQuery.of(context).size.width;
}

double getDeviceHeight(context) {
  return MediaQuery.of(context).size.height;
}
