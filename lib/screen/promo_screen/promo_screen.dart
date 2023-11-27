import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class PromoScreen extends StatelessWidget {
  const PromoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     title: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       mainAxisSize: MainAxisSize.min,
      //       children: [
      //         Text(
      //           'Promo',
      //           style: TextStyleWidget.headlineH3(
      //             fontWeight: FontWeightStyle.bold,
      //           ),
      //         ),
      //         Text(
      //           'Berbagai promo baru tersedia di DestiMate',
      //           style: TextStyleWidget.bodyB3(
      //               fontWeight: FontWeightStyle.regular,
      //               color: ColorThemeStyle.grey100),
      //         ),
      //       ],
      //     ),
      //     toolbarHeight: 60, // Atur ukuran sesuai kebutuhan

      //     backgroundColor: ColorThemeStyle.green100),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 68),
            SizedBox(
              width: 276,
              height: 56,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Promo',
                    style: TextStyleWidget.headlineH3(
                      fontWeight: FontWeightStyle.bold,
                    ),
                  ),
                  Text(
                    'Berbagai promo baru tersedia di DestiMate',
                    style: TextStyleWidget.bodyB3(
                        fontWeight: FontWeightStyle.regular,
                        color: ColorThemeStyle.grey100),
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 134),
                  Image.asset(
                    Assets.assetsImagesNotFoundWisata,
                    height: 162,
                    width: 248,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 90, vertical: 8),
                    child: Text(
                      'Upss maaf, belum ada promo yang tersedia',
                      textAlign: TextAlign.center,
                      style: TextStyleWidget.bodyB2(
                        color: ColorThemeStyle.grey100,
                        fontWeight: FontWeightStyle.medium,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
