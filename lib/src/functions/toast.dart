import 'package:flutter/material.dart';

void toastMessagePopup(context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
  ));
}
