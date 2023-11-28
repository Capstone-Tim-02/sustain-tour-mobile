import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';

class StepComponentWidget {
  static Container step({
    double? height,
    double? width,
    Widget? content,
    Color? backgroundColor,
    BoxShape? shape,
    BorderRadiusGeometry? borderRadius,
  }) =>
      Container(
        height: height ?? 40,
        width: width ?? 40,
        decoration: BoxDecoration(
          color: backgroundColor ?? ColorThemeStyle.blue100,
          shape: shape ?? BoxShape.rectangle,
          borderRadius: borderRadius,
        ),
        child: content,
      );

  static Container trail({
    double? height,
    double? width,
    Widget? content,
    Color? backgroundColor,
    BoxShape? shape,
    EdgeInsetsGeometry? margin,
    BorderRadiusGeometry? borderRadius,
  }) =>
      Container(
        height: height ?? 12,
        width: width ?? 4,
        margin: margin ?? const EdgeInsets.only(bottom: 4, left: 17.5),
        decoration: BoxDecoration(
          color: backgroundColor ?? ColorThemeStyle.blue100,
          shape: shape ?? BoxShape.rectangle,
          borderRadius:
              borderRadius ?? const BorderRadius.all(Radius.circular(8)),
        ),
        child: content,
      );
}
