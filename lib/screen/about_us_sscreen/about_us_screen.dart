import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tentang Aplikasi',
          style: TextStyleWidget.titleT2(
            fontWeight: FontWeightStyle.semiBold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 92),
          Center(
            child: Column(
              children: [
                Image.asset(
                  Assets.assetsImagesLogoDestimate,
                  height: 100,
                  width: 100,
                ),
                const SizedBox(height: 16),
                Text(
                  'Destination Mate',
                  style: TextStyleWidget.titleT2(
                    fontWeight: FontWeightStyle.regular,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Versi 1.0.00.00',
                  style: TextStyleWidget.bodyB3(
                    fontWeight: FontWeightStyle.semiBold,
                    color: ColorThemeStyle.grey100,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 16,
              left: 16,
              top: 32,
            ),
            child: Text(
              'Destimate adalah aplikasi yang memudahkan Anda menemukan tempat wisata di seluruh Indonesia. Tidak hanya itu, Destimate juga menyandang gelar sebagai aplikasi Sustain Tour, di mana kami berkomitmen untuk menghitung emisi karbon yang dihasilkan selama perjalanan Anda. Dengan informasi ini, Anda dapat mengetahui seberapa besar kontribusi Anda dalam melindungi lingkungan. Temukan dan jelajahi destinasi wisata, sambil memberikan dampak positif pada bumi kita. Destimate, lebih dari sekadar petualangan, ini adalah langkah menuju perjalanan yang berkelanjutan.',
              style: TextStyleWidget.labelL2(
                fontWeight: FontWeightStyle.regular,
                color: ColorThemeStyle.black100,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
