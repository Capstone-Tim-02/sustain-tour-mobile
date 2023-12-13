import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/constants/routes.dart';
import 'package:sustain_tour_mobile/screen/login_screen/login_provider.dart';
import 'package:sustain_tour_mobile/screen/login_screen/matchmaking_question/matchmaking_kesukaan_provider.dart';
import 'package:sustain_tour_mobile/screen/login_screen/matchmaking_question/matchmaking_provider.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
import 'package:sustain_tour_mobile/widget/button_widget.dart';

class Matchmaking2 extends StatefulWidget {
  const Matchmaking2({super.key});

  @override
  State<Matchmaking2> createState() => _Matchmaking2State();
}

class _Matchmaking2State extends State<Matchmaking2> {
  String? selectedCategory;
  late int? userId;
  late String? userToken;

  @override
  void initState() {
    super.initState();
    LoginProvider loginProvider =
        Provider.of<LoginProvider>(context, listen: false);
    Provider.of<CategoryProvider>(context, listen: false)
        .getCategories(token: loginProvider.token);
    userId = loginProvider.userId;
    userToken = loginProvider.token;
    selectedCategory = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              children: [
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
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              'Pilih preferensi wisatamu terlebih dahulu yuk',
                              style: TextStyleWidget.headlineH3(
                                fontWeight: FontWeightStyle.semiBold,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Kamu lebih suka yang mana nih?',
                              style: TextStyleWidget.titleT2(
                                fontWeight: FontWeightStyle.light,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      SizedBox(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                buildCategoryWisataAlam(),
                                buildCategoryWisataHiburan()
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                buildCategoryWisataAir(),
                                buildCategoryWisataSejarah(),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ButtonWidget.defaultContainer(
              text: 'Selesai',
              onPressed: () async {
                if (selectedCategory != null) {
                  await Provider.of<CategoryKesukaanProvider>(context,
                          listen: false)
                      .updateCategoryKesukaan(
                          userId ?? 0, userToken ?? '', selectedCategory ?? '');

                  Navigator.pushReplacementNamed(
                    context,
                    Routes.matchmaking3Screen,
                  );
                } else {
                  // Handle case where no category is selected
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCategoryWisataAlam() {
    return Consumer<CategoryProvider>(
      builder: (context, categoryProvider, child) {
        if (categoryProvider.categories.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          String categoryName = categoryProvider.categories[3].categoryName;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCategory = categoryName;
              });
            },
            child: Container(
              width: 175,
              height: 230,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 1.0,
                ),
                color: selectedCategory == categoryName
                    ? ColorThemeStyle.blue10
                    : Colors.transparent,
              ),
              child: Column(
                children: [
                  Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 22, horizontal: 6),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                          width: 40,
                          child: Image.asset(
                            Assets.assetsImagesWisataAlam,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          categoryName,
                          style: TextStyleWidget.bodyB1(
                            fontWeight: FontWeightStyle.medium,
                            color: ColorThemeStyle.black100,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          'Temukan ketenangan di antara alam. Jelajahi gunung indah, pantai memesona, dan taman eksotis',
                          style: TextStyleWidget.labelL2(
                            fontWeight: FontWeightStyle.regular,
                            color: ColorThemeStyle.grey100,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  Widget buildCategoryWisataHiburan() {
    return Consumer<CategoryProvider>(
      builder: (context, categoryProvider, child) {
        if (categoryProvider.categories.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          String categoryName = categoryProvider.categories[1].categoryName;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCategory = categoryName;
              });
            },
            child: Container(
              width: 175,
              height: 230,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 1.0,
                ),
                color: selectedCategory == categoryName
                    ? ColorThemeStyle.blue10
                    : Colors.transparent,
              ),
              child: Column(
                children: [
                  Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 22, horizontal: 6),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                          width: 40,
                          child: Image.asset(
                            Assets.assetsImagesWisataBudaya,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          categoryName,
                          style: TextStyleWidget.bodyB1(
                            fontWeight: FontWeightStyle.medium,
                            color: ColorThemeStyle.black100,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          'Menyatu dengan perbedaan budaya. Rasakan keunikan seni, tradisi, dan cita rasa kuliner yang khas',
                          style: TextStyleWidget.labelL2(
                            fontWeight: FontWeightStyle.regular,
                            color: ColorThemeStyle.grey100,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  Widget buildCategoryWisataSejarah() {
    return Consumer<CategoryProvider>(
      builder: (context, categoryProvider, child) {
        if (categoryProvider.categories.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          String categoryName = categoryProvider.categories[2].categoryName;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCategory = categoryName;
              });
            },
            child: Container(
              width: 175,
              height: 230,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 1.0,
                ),
                color: selectedCategory == categoryName
                    ? ColorThemeStyle.blue10
                    : Colors.transparent,
              ),
              child: Column(
                children: [
                  Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 22, horizontal: 6),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                          width: 40,
                          child: Image.asset(
                            Assets.assetsImagesWisataHiburan,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          categoryName,
                          style: TextStyleWidget.bodyB1(
                            fontWeight: FontWeightStyle.medium,
                            color: ColorThemeStyle.black100,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          'Nikmati liburanmu dengan sensasi taman rekreasi, pertunjukan menarik, dan kegiatan seru yang tak terlupakan',
                          style: TextStyleWidget.labelL2(
                            fontWeight: FontWeightStyle.regular,
                            color: ColorThemeStyle.grey100,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  Widget buildCategoryWisataAir() {
    return Consumer<CategoryProvider>(
      builder: (context, categoryProvider, child) {
        if (categoryProvider.categories.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          String categoryName = categoryProvider.categories[0].categoryName;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCategory = categoryName;
              });
            },
            child: Container(
              width: 175,
              height: 230,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 1.0,
                ),
                color: selectedCategory == categoryName
                    ? ColorThemeStyle.blue10
                    : Colors.transparent,
              ),
              child: Column(
                children: [
                  Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 22, horizontal: 6),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                          width: 40,
                          child: Image.asset(
                            Assets.assetsImagesWisataSejarah,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          categoryName,
                          style: TextStyleWidget.bodyB1(
                            fontWeight: FontWeightStyle.medium,
                            color: ColorThemeStyle.black100,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          'Jejak masa lalu yang masih tersimpan. Cari tau kisah menarik di balik situs purbakala dan bangunan bersejarah',
                          style: TextStyleWidget.labelL2(
                            fontWeight: FontWeightStyle.regular,
                            color: ColorThemeStyle.grey100,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
