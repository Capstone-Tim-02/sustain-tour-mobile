import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/screen/ai_screen/ai_screen.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/profile_option_component/component/list_tile_widget.dart';
import 'package:sustain_tour_mobile/screen/pusat_bantuan_screen/faq/faq_screen.dart';
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
      body: SingleChildScrollView(
        child: Column(
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
                            fontWeight: FontWeightStyle.medium,
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
                            fontWeight: FontWeightStyle.regular,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
              child: ListTileWidget(
                isUsingShadow: true,
                title: 'FAQ',
                subtitle: 'Pertanyaan yang telah kami sediakan',
                iconSvgString: Assets.assetsIconsHelp,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                trailing: const Icon(Icons.navigate_next),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FaqScreen(),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
              child: ListTileWidget(
                isUsingShadow: true,
                title: 'Virtual Asistant',
                subtitle: 'Bertanyalah kepada Chatbot kami',
                iconSvgString: Assets.assetsIconsAccountCircleFill,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                trailing: const Icon(Icons.navigate_next),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AiScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
