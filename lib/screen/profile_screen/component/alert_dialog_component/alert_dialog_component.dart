import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
import 'package:sustain_tour_mobile/widget/badge_widget.dart';

class AlertDialogComponent extends StatelessWidget {
  final String text;
  final void Function()? onPressedNoButton;
  final void Function()? onPressedYesButton;
  final EdgeInsets? insetPadding;
  final EdgeInsetsGeometry? contentPadding;
  final String? labelRedButton;
  final String? labelBlueButton;
  final bool? reverseButtonPosition;
  const AlertDialogComponent(
      {super.key,
      required this.text,
      this.onPressedNoButton,
      this.onPressedYesButton,
      this.insetPadding,
      this.contentPadding,
      this.labelRedButton,
      this.labelBlueButton,
      this.reverseButtonPosition = false});

  @override
  Widget build(BuildContext context) {
    List<Widget> buttonWidgetList = [
      BadgeWidget.container(
          onPressed: reverseButtonPosition! ?  onPressedYesButton : onPressedNoButton,
          label: labelBlueButton ??'Tidak',
          width: 105,
          height: 42,
        ),
        BadgeWidget.outline(
          onPressed: reverseButtonPosition! ? onPressedNoButton : onPressedYesButton,
          borderColor: ColorThemeStyle.red,
          foregroundColor: ColorThemeStyle.red,
          overlayColor: const Color.fromARGB(255, 235, 124, 116),
          label: labelRedButton ?? 'Iya',
          width: 105,
          height: 42,
        ),
    ];

    if(reverseButtonPosition == true){
      buttonWidgetList = buttonWidgetList.reversed.toList();
    }

    return AlertDialog(
      insetPadding: insetPadding ??
          const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
      contentPadding: contentPadding ??
          const EdgeInsets.only(
            left: 31,
            top: 44,
            right: 31,
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
      actionsAlignment: MainAxisAlignment.spaceAround,
      actionsPadding: const EdgeInsets.only(
        left: 32,
        right: 32,
        bottom: 44,
      ),
      actions: buttonWidgetList
    );
  }
}
