import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/screen/pusat_bantuan_screen/faq/faq_screen.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class PusatBantuanScreen extends StatelessWidget {
  const PusatBantuanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pusat Bantuan',
          style: TextStyleWidget.titleT2(
            fontWeight: FontWeightStyle.semiBold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          right: 16,
          left: 16,
          top: 52,
          bottom: 16,
        ),
        child: Column(
          children: [
            Center(
              child: SizedBox(
                height: 314,
                width: 260,
                child: Column(
                  children: [
                    const Icon(
                      Icons.image,
                      size: 182,
                    ),
                    const SizedBox(height: 32),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'Ada yang perlu ditanyakan?',
                        style: TextStyleWidget.titleT2(
                          fontWeight: FontWeightStyle.semiBold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'Kami menyediakan dua fitur yang dapat anda gunakan mengenai permasalahan di Destimate',
                        textAlign: TextAlign.center,
                        style: TextStyleWidget.bodyB3(
                          fontWeight: FontWeightStyle.medium,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 70,
              width: double.infinity,
              child: Row(
                children: [
                  const Icon(
                    Icons.account_circle_outlined,
                    size: 38,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const FAQScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'FAQ',
                      style: TextStyleWidget.titleT3(
                        fontWeight: FontWeightStyle.medium,
                        color: ColorThemeStyle.black100,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 70,
              width: double.infinity,
              child: Row(
                children: [
                  const Icon(
                    Icons.account_circle_outlined,
                    size: 38,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Virtual Asisten',
                      style: TextStyleWidget.titleT3(
                        fontWeight: FontWeightStyle.medium,
                        color: ColorThemeStyle.black100,
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
