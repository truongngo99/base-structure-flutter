import "package:flutter/material.dart";

class CommonButton extends StatelessWidget {
  final double width;
  final double height;
  final Color? backgroundColor;
  final Color? contentColor;

  const CommonButton(
      {super.key,
      required this.width,
      required this.height,
      this.backgroundColor,
      this.contentColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: FilledButton(onPressed: onPressed, child: child));
  }
}
