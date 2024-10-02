// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'myText.dart';

enum VibIntensity { high, medium, low }

class myButton extends StatefulWidget {
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
    this.pressAnimation,
    this.pressAnimationScale,
    this.pressAnimationDuration,
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
  final bool? pressAnimation;
  final double? pressAnimationScale;
  final Duration? pressAnimationDuration;

  @override
  State<myButton> createState() => _myButtonState();
}

class _myButtonState extends State<myButton> {
  bool _isPressed = false;
  DateTime _startTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.enable ?? true ? 1 : 0.4,
      child: Padding(
        padding: widget.margin ?? const EdgeInsets.all(0),
        child: ClipRRect(
          borderRadius: widget.customBorderRadius ??
              BorderRadius.circular(widget.borderRadius ?? 20),
          child: Material(
            color: Colors.transparent,
            child: IgnorePointer(
              ignoring: !(widget.enable ?? true),
              child: InkWell(
                onTapDown: (details) {
                  setState(() => _isPressed = true);
                  _startTime = DateTime.now();
                },
                onTapCancel: () {
                  setState(() => _isPressed = false);
                },
                onTapUp: (details) async {
                  DateTime endTime = DateTime.now();
                  Duration difference = endTime.difference(_startTime);
                  if (difference.inMilliseconds < 100) {
                    await Future.delayed((100 - difference.inMilliseconds).ms,
                        () {
                      setState(() => _isPressed = false);
                    });
                  } else {
                    setState(() => _isPressed = false);
                  }
                },
                onTap: () {
                  if (widget.onPress != null) widget.onPress!();
                  if (widget.vibration == VibIntensity.low) {
                    HapticFeedback.lightImpact();
                  }
                  if (widget.vibration == VibIntensity.medium) {
                    HapticFeedback.mediumImpact();
                  }
                  if (widget.vibration == VibIntensity.high) {
                    HapticFeedback.heavyImpact();
                  }
                },
                splashColor: widget.splashColor,
                highlightColor: Colors.black.withOpacity(0.05),
                child: Ink(
                  height: widget.height,
                  width: widget.width,
                  padding: widget.customPadding ??
                      EdgeInsets.all(widget.padding ?? 15),
                  decoration: BoxDecoration(
                    border: widget.border,
                    borderRadius: widget.customBorderRadius ??
                        BorderRadius.circular(widget.borderRadius ?? 20),
                    color: widget.backgroundColor ?? Colors.blue,
                  ),
                  child: Center(
                    child: widget.child ??
                        myText(
                          text: widget.text ?? "Press",
                          color: widget.textColor ?? Colors.white,
                          fontSize: widget.textSize,
                          bold: widget.bold,
                        ),
                  ),
                ),
              ),
            ),
          ),
        )
            .animate(
              target: _isPressed && (widget.pressAnimation ?? false) ? 1 : 0,
            ) // Apply animation
            .scaleXY(
              begin: 1.0,
              end:
                  widget.pressAnimationScale ?? 0.95, // Scale down when pressed
              duration:
                  widget.pressAnimationDuration ?? 100.ms, // Animation duration
              curve: Curves.easeInOut, // Smooth transition
            ),
      ),
    );
  }
}
