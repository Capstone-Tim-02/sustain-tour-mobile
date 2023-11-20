import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
import 'package:sustain_tour_mobile/widget/badge_widget.dart';

class AlertDialogComponent extends StatelessWidget {
  final String text;
  final void Function()? onPressedNoButton;
  final void Function()? onPressedYesButton;
  const AlertDialogComponent(
      {super.key,
      required this.text,
      this.onPressedNoButton,
      this.onPressedYesButton});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.only(
        left: 33,
        top: 44,
        right: 33,
        bottom: 32,
      ),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      backgroundColor: Colors.white,
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyleWidget.titleT1(
          fontWeight: FontWeightStyle.medium,
          color: ColorThemeStyle.blue100,
          height: 1.81,
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: const EdgeInsets.only(
        left: 32,
        right: 32,
        bottom: 44,
      ),
      actions: [
        BadgeWidget.container(
          onPressed: onPressedNoButton,
          label: 'Tidak',
          width: 110,
          height: 42,
        ),
        const SizedBox(
          width: 24,
        ),
        BadgeWidget.outline(
          onPressed: onPressedYesButton,
          borderColor: Colors.red,
          foregroundColor: Colors.red,
          overlayColor: const Color.fromARGB(255, 235, 124, 116),
          label: 'Iya',
          width: 110,
          height: 42,
        ),
      ],
    );
  }
}
