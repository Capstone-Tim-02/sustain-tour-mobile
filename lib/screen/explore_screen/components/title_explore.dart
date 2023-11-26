import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class TitleExplore {
  static AppBar exploreAppBar = AppBar(
    title: Text(
      'Explore',
      style: TextStyleWidget.titleT2(
        fontWeight: FontWeightStyle.semiBold,
      ),
    ),
    centerTitle: true,
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.white,
  );
}