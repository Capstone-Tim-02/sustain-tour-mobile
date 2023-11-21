import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/shadow_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class EditAccountPhotoOptionItemComponent extends StatelessWidget {
  final Widget icon;
  final String text;
  final Color? color;
  final Color? textColor;
  final bool isUseShadow;
  const EditAccountPhotoOptionItemComponent(
      {super.key,
      required this.icon,
      required this.text,
      this.color,
      this.textColor,
      this.isUseShadow = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 51,
      decoration: BoxDecoration(
          color: color ?? ColorThemeStyle.blue100,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            isUseShadow ? ShadowStyle.shadowFix2 : const BoxShadow()
          ]),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            width: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: icon,
          ),
          const SizedBox(
            width: 30,
          ),
          Text(
            text,
            style: TextStyleWidget.titleT3(
              fontWeight: FontWeightStyle.regular,
              color: textColor ?? Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
