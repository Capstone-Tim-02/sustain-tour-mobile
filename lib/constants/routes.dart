import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/screen/ai_screen/ai_screen.dart';
import 'package:sustain_tour_mobile/screen/home_screen/components/desti_point_screen/desti_point_screen.dart';
import 'package:sustain_tour_mobile/screen/pusat_bantuan_screen/pusat_bantuan_screen.dart';
import 'package:sustain_tour_mobile/screen/register_screen/register_screen.dart';
import 'package:sustain_tour_mobile/screen/login_screen/login_screen.dart';
import 'package:sustain_tour_mobile/screen/login_screen/matchmaking_question/matchmaking_2.dart';
import 'package:sustain_tour_mobile/screen/login_screen/matchmaking_question/matchmaking_3.dart';
import 'package:sustain_tour_mobile/screen/main_screen/main_screen.dart';
import 'package:sustain_tour_mobile/screen/onboarding_screen/onboarding_screen.dart';
import 'package:sustain_tour_mobile/screen/onboarding_screen/splash_screen/splash_screen.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/account_screen_component/account_screen_component.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/account_screen_component/component/edit_account_screen_component/edit_account_screen_component.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/profile_emission_component/component/detail_emission_screen_component/detail_emission_screen_component.dart';

class Routes {
  static const String splashScreen = '/';
  static const String onboardingScreen = '/onboarding';
  static const String loginScreen = '/loginscreen';
  static const String aiScreen = '/aiscreen';
  static const String registerScreen = '/registerscreen';
  static const String matchmaking2Screen = '/loginscreen/matchmaking2';
  static const String matchmaking3Screen = '/loginscreen/matchmaking3';

  static const String mainScreen = '/main';
  static const String accountScreen = '/main/profile/account';
  static const String detailEmissionScreen = '/main/profile/detail-emission';
  static const String editAccountScreen = 'main/profile/account/edit';
  static const String pusatBantuan = 'main/profile/pusatBantuan';

  static const String destiPointScreen = 'main/home/destiPoint';

  static Map<String, WidgetBuilder> routeMap = {
    splashScreen: (context) => const SplashScreen(),
    onboardingScreen: (context) => const OnboardingScreen(),
    loginScreen: (context) => const LoginScreen(),
    aiScreen: (context) => const AiScreen(),
    registerScreen: (context) => const RegisterScreen(),
    matchmaking2Screen: (context) => const Matchmaking2(),
    matchmaking3Screen: (context) => const Matchmaking3(),
    mainScreen: (context) => const MainScreen(),
    accountScreen: (context) => const AccountScreenComponent(),
    detailEmissionScreen: (context) => const DetailEmissionScreenComponent(),
    editAccountScreen: (context) => const EditAccountScreenComponent(),
    destiPointScreen: (context) => const DestiPointScreen(),
    pusatBantuan: (context) => const PusatBantuanScreen(),
  };
}
