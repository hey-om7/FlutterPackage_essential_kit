// ignore_for_file: camel_case_types, avoid_print

library essential_kit;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum VibIntensity { high, medium, low }

class myButton extends StatelessWidget {
  const myButton({
    super.key,
    this.text,
    this.textColor,
    this.backgroundColor,
    this.borderRadius,
    this.padding,
    this.margin,
    this.bold,
    this.textSize,
    this.child,
    this.onPress,
    this.splashColor,
    this.height,
    this.width,
    this.vibration,
    this.border,
    this.enable,
    this.customBorderRadius,
    this.customPadding,
  });
  final String? text;
  final Color? textColor;
  final Color? backgroundColor;
  final double? borderRadius;
  final double? padding;
  final EdgeInsets? customPadding;
  final EdgeInsets? margin;
  final FontWeight? bold;
  final double? textSize;
  final Widget? child;
  final VoidCallback? onPress;
  final Color? splashColor;
  final double? height;
  final double? width;
  final VibIntensity? vibration;
  final Border? border;
  final bool? enable;
  final BorderRadius? customBorderRadius;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: enable ?? true ? 1 : 0.4,
      child: Padding(
        padding: margin ?? const EdgeInsets.all(0),
        child: ClipRRect(
          borderRadius:
              customBorderRadius ?? BorderRadius.circular(borderRadius ?? 20),
          child: Material(
            color: Colors.transparent,
            child: IgnorePointer(
              ignoring: !(enable ?? true),
              child: InkWell(
                onTap: () {
                  if (onPress != null) onPress!();
                  if (vibration == VibIntensity.low) {
                    HapticFeedback.lightImpact();
                  }
                  if (vibration == VibIntensity.medium) {
                    HapticFeedback.mediumImpact();
                  }
                  if (vibration == VibIntensity.high) {
                    HapticFeedback.heavyImpact();
                  }
                },
                splashColor: splashColor,
                highlightColor: Colors.black.withOpacity(0.05),
                child: Ink(
                  height: height,
                  width: width,
                  padding: customPadding ?? EdgeInsets.all(padding ?? 15),
                  decoration: BoxDecoration(
                    border: border,
                    borderRadius: customBorderRadius ??
                        BorderRadius.circular(borderRadius ?? 20),
                    color: backgroundColor ?? Colors.blue,
                  ),
                  child: Center(
                    child: child ??
                        myText(
                          text: text ?? "Press",
                          color: textColor ?? Colors.white,
                          fontSize: textSize,
                          bold: bold,
                        ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

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

void toastMessagePopup(context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
  ));
}

double getDeviceWidth(context) {
  return MediaQuery.of(context).size.width;
}

double getDeviceHeight(context) {
  return MediaQuery.of(context).size.height;
}

void printWarning(String text) {
  print('\x1B[33m$text\x1B[0m');
}

void printError(String text) {
  print('\x1B[31m$text\x1B[0m');
}

void printBlue(String text) {
  print('\x1B[34m$text\x1B[0m');
}
