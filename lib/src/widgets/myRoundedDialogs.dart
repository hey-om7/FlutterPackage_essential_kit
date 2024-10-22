import 'package:flutter/material.dart';

class myRoundedDialogBox {
  myRoundedDialogBox({
    required BuildContext
        context, // Now pass the context directly to the constructor
    this.child,
    required this.height,
    required this.width,
    this.curveRadius,
    this.onDialogClosed,
  }) {
    // Automatically show the dialog in the constructor
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(curveRadius?.toDouble() ?? 35),
          ),
          child: Container(
            clipBehavior: Clip.hardEdge,
            height: height,
            width: width,
            child: child ?? Container(),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.circular(curveRadius?.toDouble() ?? 35),
            ),
          ),
        );
      },
    ).then((var val) {
      if (onDialogClosed != null) {
        onDialogClosed!();
      }
    });
  }

  final Widget? child;
  final int? curveRadius;
  final double height;
  final double width;
  final VoidCallback? onDialogClosed;
}
