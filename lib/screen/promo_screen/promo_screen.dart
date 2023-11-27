import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class PromoScreen extends StatelessWidget {
  const PromoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 68),
        Image.asset(
          Assets.assetsImagesNotFoundWisata,
          height: 162,
          width: 248,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 8),
          child: Text(
            'Upss maaf, anda belum pernah menggunakan poin untuk memesan tiket',
            textAlign: TextAlign.center,
            style: TextStyleWidget.bodyB2(
              color: ColorThemeStyle.grey100,
              fontWeight: FontWeightStyle.medium,
            ),
          ),
        ),
      ],
    );
  }
}
