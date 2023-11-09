import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class ProfileAppBarComponent {
  static AppBar profileAppBar = AppBar(
    title: Padding(
      padding: const EdgeInsets.only(
        top: 24,
      ),
      child: Text(
        'Profile',
        style: TextStyleWidget.titleT2(
          fontWeight: FontWeightStyle.semiBold,
        ),
      ),
    ),
    centerTitle: true,
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.white,
  );
}
