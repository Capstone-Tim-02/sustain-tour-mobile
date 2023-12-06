import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class WisataNotFoundScreen extends StatelessWidget {
  const WisataNotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 125),
          Image.asset(Assets.assetsImagesNotFoundWisata),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              "Hmm, yang kamu cari tidak ditemukan",
              style: TextStyleWidget.titleT2(
                color: ColorThemeStyle.black100,
                fontWeight: FontWeight.w600
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            "Maaf, tidak ada yang sesuai. Tapi tenang,\nkamu bisa coba kata kunci lainnya kok.",
            style: TextStyleWidget.bodyB3(
              color: ColorThemeStyle.black100,
              fontWeight: FontWeight.w400
            ),
            textAlign: TextAlign.center,
          )
        ],
      )
    );
  }
}