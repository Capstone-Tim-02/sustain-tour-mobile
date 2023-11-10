import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/screen/pusat_bantuan_screen/faq/faq_screen.dart';
import 'package:sustain_tour_mobile/screen/pusat_bantuan_screen/faq/faq_screen_provider.dart';
import 'package:sustain_tour_mobile/screen/pusat_bantuan_screen/pusat_bantuan_screen.dart';
import 'package:sustain_tour_mobile/widget/bottom_navbar_widget/bottom_navbar_widget_provider.dart';

import 'screen/onboarding_screen/onboarding_provider.dart';
import 'screen/onboarding_screen/splash_screen/splash_screen_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<BottomNavigationBarProvider>(
          create: (context) => BottomNavigationBarProvider()),
      ChangeNotifierProvider<SplashScreenProvider>(
          create: (context) => SplashScreenProvider()),
      ChangeNotifierProvider<OnboardingProvider>(
          create: (context) => OnboardingProvider()),
      ChangeNotifierProvider<FaqScreenProvider>(
          create: (context) => FaqScreenProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sustain Tour',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFfffbf5)),
        useMaterial3: true,
      ),
      home: const PusatBantuanScreen(),
    );
  }
}
