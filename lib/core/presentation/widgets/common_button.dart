import "package:base_structure/theme/constants.dart";
import "package:flutter/material.dart";

class CommonButton extends StatelessWidget {
  final double width;
  final double height;
  final Color? backgroundColor;
  final Color? contentColor;
  final Widget contentWidget;
  final void Function() onPressed;

  const CommonButton(
      {super.key,
      required this.width,
      required this.height,
      this.backgroundColor,
      this.contentColor,
      required this.contentWidget,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return SizedBox(
        width: width,
        height: height,
        child: FilledButton(
          onPressed: onPressed,
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(
                  contentColor ?? themeData.colorScheme.surface),
              backgroundColor: MaterialStateProperty.all<Color>(
                  backgroundColor ?? themeData.colorScheme.primary),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(AppBorderRadius.b100))))),
          child: contentWidget,
        ));
  }
}
