import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/constants/routes.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/profile_emission_component/profile_emission_provider.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/profile_provider.dart';
import 'package:sustain_tour_mobile/screen/home_screen/home_screen_provider.dart';
import 'package:sustain_tour_mobile/screen/login_screen/login_provider.dart';
import 'package:sustain_tour_mobile/screen/login_screen/validator/from_password_screns.dart';
import 'package:sustain_tour_mobile/screen/login_screen/validator/from_username_screens.dart';
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
      ChangeNotifierProvider<ProfileProvider>(
          create: (context) => ProfileProvider()),
      ChangeNotifierProvider<ProfileEmissionProvider>(
          create: (context) => ProfileEmissionProvider()),
      ChangeNotifierProvider<HomeScreenProvider>(
          create: (context) => HomeScreenProvider()),
      ChangeNotifierProvider<LoginProvider>(
          create: (context) => LoginProvider()),
      ChangeNotifierProvider<FromUsernameProvider>(
          create: (context) => FromUsernameProvider()),
      ChangeNotifierProvider<FormPasswordProvider>(
          create: (context) => FormPasswordProvider()),
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
      initialRoute: Routes.splashScreen,
      routes: Routes.routeMap,
    );
  }
}
