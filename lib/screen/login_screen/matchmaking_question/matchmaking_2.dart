import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/constants/routes.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
import 'package:sustain_tour_mobile/widget/button_widget.dart';

class Matchmaking2 extends StatelessWidget {
  const Matchmaking2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const SizedBox(
          height: 60,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1/2',
                    style: TextStyleWidget.headlineH3(
                        fontWeight: FontWeightStyle.regular,
                        color: ColorThemeStyle.grey80),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Pilih preferensi wisatamu terlebih dahulu yuk',
                    style: TextStyleWidget.headlineH3(
                      fontWeight: FontWeightStyle.semiBold,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Kamu lebih suka yang mana nih?',
                    style: TextStyleWidget.titleT2(
                      fontWeight: FontWeightStyle.light,
                    ),
                  )
                ],
              )),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 182,
                          height: 216,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 22, horizontal: 6),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                          height: 40,
                                          width: 40,
                                          child: Image.asset(
                                              Assets.assetsImagesWisataAlam)),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Text(
                                        'Wisata Alam',
                                        style: TextStyleWidget.bodyB1(
                                            fontWeight: FontWeightStyle.medium,
                                            color: ColorThemeStyle.black100),
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Text(
                                        'Temukan ketenangan di antara alam. Jelajahi gunung indah, pantai memesona, dan taman eksotis',
                                        style: TextStyleWidget.labelL2(
                                            fontWeight: FontWeightStyle.regular,
                                            color: ColorThemeStyle.grey100),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 182,
                          height: 216,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 22, horizontal: 6),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                          height: 40,
                                          width: 40,
                                          child: Image.asset(
                                              Assets.assetsImagesWisataBudaya)),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Text(
                                        'Wisata Budaya',
                                        style: TextStyleWidget.bodyB1(
                                            fontWeight: FontWeightStyle.medium,
                                            color: ColorThemeStyle.black100),
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Text(
                                        'Menyatu dengan perbedaan budaya. Rasakan keunikan seni, tradisi, dan cita rasa kuliner yang khas',
                                        style: TextStyleWidget.labelL2(
                                            fontWeight: FontWeightStyle.regular,
                                            color: ColorThemeStyle.grey100),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 182,
                          height: 216,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 22, horizontal: 6),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                          height: 40,
                                          width: 40,
                                          child: Image.asset(Assets
                                              .assetsImagesWisataSejarah)),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Text(
                                        'Wisata Sejarah',
                                        style: TextStyleWidget.bodyB1(
                                            fontWeight: FontWeightStyle.medium,
                                            color: ColorThemeStyle.black100),
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Text(
                                        'Jejak masa lalu yang masih tersimpan. Cari tau kisah menarik di balik situs purbakala dan bangunan bersejarah',
                                        style: TextStyleWidget.labelL2(
                                            fontWeight: FontWeightStyle.regular,
                                            color: ColorThemeStyle.grey100),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 182,
                          height: 216,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 22, horizontal: 6),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                          height: 40,
                                          width: 40,
                                          child: Image.asset(Assets
                                              .assetsImagesWisataHiburan)),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Text(
                                        'Wisata Hiburan',
                                        style: TextStyleWidget.bodyB1(
                                            fontWeight: FontWeightStyle.medium,
                                            color: ColorThemeStyle.black100),
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Text(
                                        'Nikmati liburanmu dengan sensasi taman rekreasi, pertunjukan menarik, dan kegiatan seru yang tak terlupakan',
                                        style: TextStyleWidget.labelL2(
                                            fontWeight: FontWeightStyle.regular,
                                            color: ColorThemeStyle.grey100),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 91,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonWidget.smallOutline(
                      text: 'Kembali',
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  ButtonWidget.smallContainer(
                      text: 'Selanjutnya',
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.matchmaking3Screen);
                      }),
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }
}
