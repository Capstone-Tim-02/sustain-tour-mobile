import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class EditTextFieldComponentWidget extends StatelessWidget {
  final bool? autofocus;
  final TextEditingController? controller;
  final String? label;
  final void Function(String)? onChanged;
  const EditTextFieldComponentWidget(
      {super.key, this.autofocus, this.controller, this.label, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: autofocus ?? true,
      controller: controller,
      cursorColor: ColorThemeStyle.blue100,
      style: TextStyleWidget.titleT2(
          fontWeight: FontWeight.w500, color: Colors.black),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(bottom: -8),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
          color: ColorThemeStyle.grey100,
          width: 2,
        )),
        label: Text(
          label ?? '',
          style: TextStyleWidget.titleT3(
              fontWeight: FontWeightStyle.medium, color: Colors.black),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
      onChanged: onChanged,
    );
  }
}
