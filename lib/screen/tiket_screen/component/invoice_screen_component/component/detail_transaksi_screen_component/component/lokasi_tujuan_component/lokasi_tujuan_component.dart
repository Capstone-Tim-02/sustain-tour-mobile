import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/constants/open_maps_func.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
import 'package:sustain_tour_mobile/widget/badge_widget.dart';

class LokasiTujuanComponent extends StatelessWidget {
  final String lokasiWisata;
  final String mapsLink;
  const LokasiTujuanComponent(
      {super.key, required this.lokasiWisata, required this.mapsLink});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Lokasi Tujuan',
          style: TextStyleWidget.titleT2(
            fontWeight: FontWeightStyle.semiBold,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          width: double.infinity,
          height: 110,
          decoration: BoxDecoration(
            color: ColorThemeStyle.green100,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          lokasiWisata,
          style: TextStyleWidget.bodyB3(
            fontWeight: FontWeightStyle.regular,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        BadgeWidget.outline(
          width: double.infinity,
          label: 'Buka Maps',
          fontWeight: FontWeightStyle.semiBold,
          onPressed: () {
            OpenMapsFunc.openMaps(context: context, mapsLink: mapsLink);
          },
        )
      ],
    );
  }
}
