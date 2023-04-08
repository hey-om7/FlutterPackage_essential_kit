// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'myText.dart';

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
