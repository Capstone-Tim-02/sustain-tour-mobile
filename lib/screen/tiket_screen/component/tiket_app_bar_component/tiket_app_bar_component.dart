import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class TiketAppBarComponent {
  static AppBar tiketAppBar = AppBar(
    title: Text(
      'Transaksi',
      style: TextStyleWidget.titleT1(
        fontWeight: FontWeightStyle.semiBold,
      ),
    ),
    centerTitle: true,
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.white,
  );
}
