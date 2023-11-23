import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class TitleExplore extends StatelessWidget {
  const TitleExplore({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 4),
      child: Text(
        "Explore",
        style: TextStyleWidget.titleT2(
          color: ColorThemeStyle.black100,
          fontWeight: FontWeight.w600
        ),
      ),
    );
  }
}