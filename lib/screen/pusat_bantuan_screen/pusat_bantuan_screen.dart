import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: 16,
              left: 16,
              top: 32,
              bottom: 16,
            ),
            child: Center(
              child: SizedBox(
                width: 280,
                height: 268,
                child: Column(
                  children: [
                    Image.asset(
                      Assets.assetsImagesPusatBantuan,
                      height: 166,
                      width: 280,
                    ),
                    const SizedBox(height: 16),
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
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const FaqScreen(),
                ),
              );
            },
            child: ListTile(
              leading: const Icon(
                Icons.account_circle_rounded,
                color: ColorThemeStyle.black100,
                size: 34,
              ),
              title: Text(
                'FAQ',
                style: TextStyleWidget.titleT3(
                  fontWeight: FontWeightStyle.medium,
                ),
              ),
              subtitle: Text(
                'Pertanyaan yang telah kami sediakan',
                style: TextStyleWidget.bodyB3(
                  fontWeight: FontWeightStyle.medium,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => const FaqScreen(),
              //   ),
              // );
            },
            child: ListTile(
              leading: const Icon(
                Icons.live_help_rounded,
                color: ColorThemeStyle.black100,
                size: 34,
              ),
              title: Text(
                'Virtual Asistent',
                style: TextStyleWidget.titleT3(
                  fontWeight: FontWeightStyle.medium,
                ),
              ),
              subtitle: Text(
                'Bertanyalah kepada Chatbot kami',
                style: TextStyleWidget.bodyB3(
                  fontWeight: FontWeightStyle.medium,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
