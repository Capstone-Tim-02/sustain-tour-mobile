import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/screen/about_us_sscreen/about_us_screen.dart';
import 'package:sustain_tour_mobile/screen/ai_screen/ai_screen.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/checkout_screen.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/booking_result_screen/booking_result_screen.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/use_promo_screen/use_promo_screen.dart';
import 'package:sustain_tour_mobile/screen/home_screen/components/desti_point_screen/desti_point_screen.dart';
import 'package:sustain_tour_mobile/screen/home_screen/components/notification_screen/notification_screen.dart';

import 'package:sustain_tour_mobile/screen/home_screen/home_screen.dart';
import 'package:sustain_tour_mobile/screen/login_screen/matchmaking_question/matchmaking_1.dart';
import 'package:sustain_tour_mobile/screen/pusat_bantuan_screen/pusat_bantuan_screen.dart';
import 'package:sustain_tour_mobile/screen/onboarding_screen/splash_screen/splash_screen.dart';
import 'package:sustain_tour_mobile/screen/register_screen/register_screen.dart';
import 'package:sustain_tour_mobile/screen/login_screen/login_screen.dart';
import 'package:sustain_tour_mobile/screen/login_screen/matchmaking_question/matchmaking_2.dart';
import 'package:sustain_tour_mobile/screen/login_screen/matchmaking_question/matchmaking_3.dart';
import 'package:sustain_tour_mobile/screen/main_screen/main_screen.dart';
import 'package:sustain_tour_mobile/screen/onboarding_screen/onboarding_screen.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/account_screen_component/account_screen_component.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/account_screen_component/component/edit_account_screen_component/edit_account_screen_component.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/profile_emission_component/component/detail_emission_screen_component/detail_emission_screen_component.dart';
import 'package:sustain_tour_mobile/screen/term_condition_screen/terms_confition_screen.dart';
import 'package:sustain_tour_mobile/screen/tiket_screen/component/invoice_screen_component/component/detail_transaksi_screen_component/detail_transaksi_screen_component.dart';
import 'package:sustain_tour_mobile/screen/tiket_screen/component/invoice_screen_component/invoice_screen_component.dart';

class Routes {
  static const String splashScreen = '/';
  static const String onboardingScreen = '/onboarding';
  static const String loginScreen = '/loginscreen';
  static const String registerScreen = '/registerscreen';
  static const String matchmaking1Screen = '/loginscreen/matchmaking1';
  static const String matchmaking2Screen = '/loginscreen/matchmaking2';
  static const String matchmaking3Screen = '/loginscreen/matchmaking3';

  static const String mainScreen = '/main';
  static const String homeScreen = '/home';
  static const String notifikasiScreen = '/home/notifikasi';
  static const String accountScreen = '/main/profile/account';
  static const String detailEmissionScreen = '/main/profile/detail-emission';
  static const String editAccountScreen = 'main/profile/account/edit';
  static const String pusatBantuan = 'main/profile/pusatBantuan';
  static const String aiScreen = 'main/profile/aiScreen';
  static const String tnc = 'main/profile/termsAndCondition';
  static const String aboutUs = 'main/profile/aboutUs';

  static const String destiPointScreen = 'main/home/destiPoint';

  static const String checkoutScreen = 'main/checkout';
  static const String usePromoScreen = 'main/checkout/usePromo';
  static const String bookingResultScreen = 'main/checkout/result';

  static const String invoiceScreen = '/main/tiket/invoice-screen';
  static const String detailTransaksiScreen =
      '/main/tiket/invoice-screen/detail-transksi';

  static Map<String, WidgetBuilder> routeMap = {
    splashScreen: (context) => const SplashScreen(),
    onboardingScreen: (context) => const OnboardingScreen(),
    loginScreen: (context) => const LoginScreen(),
    aiScreen: (context) => const AiScreen(),
    registerScreen: (context) => const RegisterScreen(),
    matchmaking1Screen: (context) => const Matchmaking1(),
    matchmaking2Screen: (context) => const Matchmaking2(),
    matchmaking3Screen: (context) => const Matchmaking3(),
    mainScreen: (context) => const MainScreen(),
    homeScreen: (context) => const HomeScreen(),
    accountScreen: (context) => const AccountScreenComponent(),
    detailEmissionScreen: (context) => const DetailEmissionScreenComponent(),
    editAccountScreen: (context) => const EditAccountScreenComponent(),
    invoiceScreen: (context) => const InvoiceScreenComponent(),
    detailTransaksiScreen: (context) => const DetailTransaksiScreenComponent(),
    destiPointScreen: (context) => const DestiPointScreen(),
    pusatBantuan: (context) => const PusatBantuanScreen(),
    checkoutScreen: (context) => const CheckoutScreen(),
    usePromoScreen: (context) => const UsePromoScreen(),
    bookingResultScreen: (context) => const BookingResultScreen(),
    tnc: (context) => const TermsConditionScreen(),
    aboutUs: (context) => const AboutUsScreen(),
    notifikasiScreen: (context) => const NotificationScreen(),
  };
}
