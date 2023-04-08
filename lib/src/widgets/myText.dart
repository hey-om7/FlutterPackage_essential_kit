// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';

class myText extends StatelessWidget {
  const myText({
    super.key,
    required this.text,
    // this.isBold,
    this.color,
    this.fontSize,
    this.bold,
    this.padding,
  });
  final String text;
  final FontWeight? bold;
  final Color? color;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: Text(
        text,
        style: TextStyle(
            fontWeight: bold ?? FontWeight.normal,
            color: color ?? Colors.grey,
            fontSize: fontSize ?? 25.0,
            fontFamily: "Inter"),
      ),
    );
  }
}
