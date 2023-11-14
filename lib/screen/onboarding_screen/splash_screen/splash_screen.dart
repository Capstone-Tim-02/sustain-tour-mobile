import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/screen/onboarding_screen/onboarding_screen.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/profile_emission_component/profile_emission_provider.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/profile_provider.dart';

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
      Provider.of<ProfileProvider>(context, listen: false).getUserData(
        userId: 34,
        token:
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImdhYnJpZWwxMjM0NSIsImV4cCI6MTY5OTkzNjcwOSwiaWF0IjoxNjk5ODUwMzA5fQ.KGnIylxm3qVeAL8Q2oIpV1C0QQDGu4-9M6_I0SsT4a0',
      );
      Provider.of<ProfileEmissionProvider>(context, listen: false).getUserEmission(
          userId: 34,
          token:
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImdhYnJpZWwxMjM0NSIsImV4cCI6MTY5OTkzNjcwOSwiaWF0IjoxNjk5ODUwMzA5fQ.KGnIylxm3qVeAL8Q2oIpV1C0QQDGu4-9M6_I0SsT4a0');
      Provider.of<SplashScreenProvider>(context, listen: false)
          .loadDataSplashScreen(context)
          .then((_) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const OnboardingScreen()));
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
