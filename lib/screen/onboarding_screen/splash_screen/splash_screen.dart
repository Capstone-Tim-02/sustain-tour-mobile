import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/screen/main_screen/main_screen.dart';
import 'package:sustain_tour_mobile/screen/onboarding_screen/onboarding_screen.dart';

import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

import 'splash_screen_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Provider.of<SplashScreenProvider>(context, listen: false)
          .loadDataSplashScreen(context)
          .then((_) {
        SplashScreenProvider splashScreenProvider =
            Provider.of<SplashScreenProvider>(context, listen: false);
        if (splashScreenProvider.hasToken) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const MainScreen()));
        } else {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const OnboardingScreen()));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.assetsImagesLogoDestimate,
              height: 116,
              width: 116,
            ),
            const SizedBox(
              height: 28,
            ),
            Text(
              'Destimate',
              style: TextStyleWidget.headlineH1(
                  fontWeight: FontWeightStyle.semiBold),
            )
          ],
        ),
      ),
    );
  }
}
