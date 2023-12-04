import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
import 'package:sustain_tour_mobile/widget/bottom_navbar_widget/bottom_navbar_widget_provider.dart';

class PromoHeader extends StatelessWidget {
  const PromoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavigationBarProvider bottomNavigationBarProvider =
        Provider.of<BottomNavigationBarProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 32, bottom: 8, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Penawaran Khusus",
            style: TextStyleWidget.titleT2(
                color: ColorThemeStyle.black100, fontWeight: FontWeight.w600),
          ),
          GestureDetector(
            onTap: () {
              bottomNavigationBarProvider.onChangeIndex(2);
            },
            child: Text(
              "Lihat semua",
              style: TextStyleWidget.bodyB3(
                  color: ColorThemeStyle.black100, fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
