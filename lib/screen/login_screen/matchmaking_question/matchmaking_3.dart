import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/constants/routes.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
import 'package:sustain_tour_mobile/widget/button_widget.dart';

class Matchmaking3 extends StatelessWidget {
  const Matchmaking3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 77,
          ),
          Image.asset(Assets.assetsImagesSelamatDatang),
          const SizedBox(
            height: 33,
          ),
          Text(
            'Selamat Bergabung\nbersama Kami!',
            style: TextStyleWidget.headlineH3(
              fontWeight: FontWeightStyle.medium,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            'Ayo mulai petualangan Kamu! Temukan destinasi yang menakjubkan dan rencanakan liburan impian Anda bersama kami.',
            style: TextStyleWidget.bodyB1(
              fontWeight: FontWeightStyle.light,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 159,
          ),
          ButtonWidget.defaultContainer(
              text: 'Mulai',
              onPressed: () {
                Navigator.pushNamed(context, Routes.mainScreen);
              })
        ],
      ),
    );
  }
}
