import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:sustain_tour_mobile/constants/routes.dart';
import 'package:sustain_tour_mobile/screen/login_screen/login_screen.dart';
import 'package:sustain_tour_mobile/screen/onboarding_screen/onboarding_provider.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
import 'package:sustain_tour_mobile/widget/button_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Consumer<OnboardingProvider>(
            builder: (context, provider, child) {
              return Column(
                children: [
                  CarouselSlider.builder(
                    itemCount: provider.carouselItems.length,
                    itemBuilder: (context, index, realIndex) {
                      final item = provider.carouselItems[index];
                      return Container(
                        margin: const EdgeInsets.only(top: 32),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            Center(
                              child: Image.asset(
                                item.imagePath,
                                height: 270,
                                width: 380,
                              ),
                            ),
                            const SizedBox(height: 32),
                            Text(
                              item.title,
                              style: TextStyleWidget.headlineH3(
                                  fontWeight: FontWeightStyle.medium),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 12),
                            SizedBox(
                              height: 80,
                              width: 380,
                              child: Center(
                                child: Text(
                                  item.deskripsi,
                                  style: TextStyleWidget.titleT2(
                                      fontWeight: FontWeightStyle.light),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    options: CarouselOptions(
                      height: 565,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 7),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      aspectRatio: 4 / 3,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          provider.currentIndex = index;
                        });
                      },
                    ),
                  ),
                  DotsIndicator(
                    dotsCount: provider.carouselItems.length,
                    position: provider.currentIndex.toDouble().toInt(),
                    decorator: const DotsDecorator(
                        activeColor: ColorThemeStyle.black100,
                        color: ColorThemeStyle.grey50),
                  ),
                  // const SizedBox(
                  //   height: 120,
                  // ),
                  ButtonWidget.defaultContainer(
                      text: "Masuk",
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                      }),
                  const SizedBox(
                    height: 16,
                  ),
                  ButtonWidget.defaultOutline(
                      text: "Belum Punya Akun? Daftar dulu",
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, Routes.registerScreen);
                      })
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
