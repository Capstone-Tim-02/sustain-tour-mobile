import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/screen/explore_screen/explore_screen_provider.dart';
import 'package:sustain_tour_mobile/screen/home_screen/home_screen_provider.dart';
import 'package:sustain_tour_mobile/screen/main_screen/main_screen.dart';
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
      ChangeNotifierProvider<ExploreScreenProvider>(
          create: (context) => ExploreScreenProvider()),
      ChangeNotifierProvider<HomeScreenProvider>(
          create: (context) => HomeScreenProvider()),
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
      home: const MainScreen(),
    );
  }
}
