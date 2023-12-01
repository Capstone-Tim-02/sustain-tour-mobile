import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/screen/ai_screen/ai_screen_provider.dart';
import 'package:sustain_tour_mobile/screen/login_screen/login_provider.dart';
import 'package:sustain_tour_mobile/constants/routes.dart';
import 'package:sustain_tour_mobile/screen/explore_screen/explore_screen_provider.dart';
import 'package:sustain_tour_mobile/screen/home_screen/components/desti_point_screen/desti_point_provider.dart';
import 'package:sustain_tour_mobile/screen/login_screen/matchmaking_question/matchmaking_kesukaan_provider.dart';
import 'package:sustain_tour_mobile/screen/login_screen/matchmaking_question/matchmaking_provider.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/account_screen_component/component/edit_account_screen_component/edit_account_provider.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/profile_emission_component/component/detail_emission_screen_component/component/travel_history_component/travel_history_provider.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/profile_emission_component/profile_emission_provider.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/profile_provider.dart';
import 'package:sustain_tour_mobile/screen/home_screen/home_screen_provider.dart';
import 'package:sustain_tour_mobile/screen/promo_screen/component/detail_promo_provider.dart';
import 'package:sustain_tour_mobile/screen/pusat_bantuan_screen/faq/faq_screen_provider.dart';
import 'package:sustain_tour_mobile/screen/register_screen/register_provider.dart';
import 'package:sustain_tour_mobile/screen/register_screen/validator/form_confirm_password_screens.dart';
import 'package:sustain_tour_mobile/screen/register_screen/validator/form_email_register_screens.dart';
import 'package:sustain_tour_mobile/screen/register_screen/validator/form_full_name_screens.dart';
import 'package:sustain_tour_mobile/screen/register_screen/validator/form_phone_screens.dart';
import 'package:sustain_tour_mobile/screen/register_screen/validator/form_username_register_screens.dart';
import 'package:sustain_tour_mobile/screen/login_screen/component/from_password_screns.dart';
import 'package:sustain_tour_mobile/screen/login_screen/component/from_username_screens.dart';
import 'package:sustain_tour_mobile/screen/tiket_screen/tiket_provider.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/widget/bottom_navbar_widget/bottom_navbar_widget_provider.dart';
import 'screen/onboarding_screen/onboarding_provider.dart';
import 'screen/onboarding_screen/splash_screen/splash_screen_provider.dart';

void main() async async {
  WidgetsFlutterBinding.ensureInitialized(); // Required by FlutterConfig
  await FlutterConfig.loadEnvVariables();
  await initializeDateFormatting('id_ID', null);

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
      ChangeNotifierProvider<AiScreenProvider>(
          create: (context) => AiScreenProvider()),
      ChangeNotifierProvider<RegisterProvider>(
          create: (context) => RegisterProvider()),
      ChangeNotifierProvider<FormFullNameProvider>(
          create: (context) => FormFullNameProvider()),
      ChangeNotifierProvider<FromUsernameRegisterProvider>(
          create: (context) => FromUsernameRegisterProvider()),
      ChangeNotifierProvider<FromPhoneProvider>(
          create: (context) => FromPhoneProvider()),
      ChangeNotifierProvider<FromEmailRegisterProvider>(
          create: (context) => FromEmailRegisterProvider()),
      ChangeNotifierProvider<FormConfirmPasswordProvider>(
          create: (context) => FormConfirmPasswordProvider()),
      ChangeNotifierProvider<EditAccountProvider>(
          create: (context) => EditAccountProvider()),
      ChangeNotifierProvider<CategoryProvider>(
          create: (context) => CategoryProvider()),
      ChangeNotifierProvider<CategoryKesukaanProvider>(
          create: (context) => CategoryKesukaanProvider()),
      ChangeNotifierProvider<TravelHistoryProvider>(
          create: (context) => TravelHistoryProvider()),
      ChangeNotifierProvider<ExploreScreenProvider>(
          create: (context) => ExploreScreenProvider()),
      ChangeNotifierProvider<TiketProvider>(
          create: (context) => TiketProvider()),
      ChangeNotifierProvider<DestiPointProvider>(
          create: (context) => DestiPointProvider()),
      ChangeNotifierProvider<DetailPromoProvider>(
          create: (context) => DetailPromoProvider()),
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
        colorScheme: ColorScheme.fromSeed(seedColor: ColorThemeStyle.blue100),
        useMaterial3: true,
      ),
      initialRoute: Routes.splashScreen,
      routes: Routes.routeMap,
    );
  }
}
