import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
import 'package:sustain_tour_mobile/widget/button_widget.dart';

class Matchmaking1 extends StatelessWidget {
  const Matchmaking1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          const SizedBox(
            height: 106,
          ),
          SizedBox(
              height: 280,
              width: 380,
              child: Image.asset(Assets.assetsImagesMatchmaking)),
          const SizedBox(
            height: 32,
          ),
          SizedBox(
              child: Column(
            children: [
              Text(
                'Mulai Petualangan Kamu dengan Kami!',
                style: TextStyleWidget.headlineH2(
                    fontWeight: FontWeightStyle.medium),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Selamat datang! Kami ingin memberikan pengalaman wisata yang paling cocok dengan preferensi Kamu nih. Yuk kita mulai dengan beberapa pertanyaan singkat.',
                style: TextStyleWidget.bodyB1(
                  fontWeight: FontWeightStyle.light,
                ),
                textAlign: TextAlign.center,
              )
            ],
          )),
          SizedBox(
            height: 140,
          ),
          SizedBox(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonWidget.smallOutline(text: 'Lewati', onPressed: () {}),
              SizedBox(
                width: 16,
              ),
              ButtonWidget.smallContainer(
                  text: 'Isi Pertanyaan', onPressed: () {})
            ],
          )),
        ],
      ),
    ));
  }
}
