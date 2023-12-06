import 'package:flutter/material.dart';

import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/screen/home_screen/components/desti_point_screen/component/user_point_info.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class DestiPointScreen extends StatelessWidget {
  const DestiPointScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Rewards',
          style: TextStyleWidget.titleT2(
            fontWeight: FontWeightStyle.semiBold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const UserPointInfo(),
              const SizedBox(height: 24),
              Text(
                'Riwayat',
                style: TextStyleWidget.titleT1(
                  color: ColorThemeStyle.black100,
                  fontWeight: FontWeightStyle.semiBold,
                ),
              ),
              Column(
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 90, vertical: 8),
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
              ),
              // Container(
              //   height: 300,
              //   width: double.infinity,
              //   child: ListView.builder(
              //     itemCount: 50,
              //     itemBuilder: (context, index) {
              //       return Column(
              //         children: [
              //           Text(
              //             'data ',
              //             style: TextStyleWidget.titleT1(
              //               color: ColorThemeStyle.black100,
              //               fontWeight: FontWeightStyle.semiBold,
              //             ),
              //           ),
              //           Text(
              //             'data berkurang',
              //             style: TextStyleWidget.titleT1(
              //               color: ColorThemeStyle.black100,
              //               fontWeight: FontWeightStyle.semiBold,
              //             ),
              //           ),
              //         ],
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
