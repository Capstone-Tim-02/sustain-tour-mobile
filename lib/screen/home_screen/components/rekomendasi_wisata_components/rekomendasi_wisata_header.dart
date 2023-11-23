import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
import 'package:sustain_tour_mobile/widget/bottom_navbar_widget/bottom_navbar_widget_provider.dart';

class RekomendasiWisataHeader extends StatelessWidget {
  const RekomendasiWisataHeader({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavigationBarProvider bottomNavigationBarProvider = Provider.of<BottomNavigationBarProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(left: 19, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Rekomendasi Wisata",
            style: TextStyleWidget.titleT2(
              color: ColorThemeStyle.black100,
              fontWeight: FontWeight.w600)),
          GestureDetector(
            onTap: () {
              bottomNavigationBarProvider.onChangeIndex(1);
            },
            child: Text(
              "Lihat semua",
              style: TextStyleWidget.bodyB3(
                color: ColorThemeStyle.black100,
                fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}