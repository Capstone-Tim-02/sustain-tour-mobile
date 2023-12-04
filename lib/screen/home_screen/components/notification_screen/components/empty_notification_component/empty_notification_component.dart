import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class EmptyNotificationComponent extends StatelessWidget {
  const EmptyNotificationComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(Assets.assetsImagesNotFoundWisata),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70.0),
          child: Text(
            'Upss maaf, anda belum mempunyai notifikasi apapun',
            textAlign: TextAlign.center,
            style: TextStyleWidget.bodyB2(
              fontWeight: FontWeightStyle.medium,
              color: ColorThemeStyle.grey100,
            ),
          ),
        ),
      ],
    );
  }
}
