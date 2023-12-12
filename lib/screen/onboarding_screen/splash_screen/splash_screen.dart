import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/screen/home_screen/components/notification_screen/notification_provider.dart';
import 'package:sustain_tour_mobile/screen/home_screen/home_screen_provider.dart';
import 'package:sustain_tour_mobile/screen/main_screen/main_screen.dart';
import 'package:sustain_tour_mobile/screen/onboarding_screen/onboarding_screen.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/profile_emission_component/component/detail_emission_screen_component/component/travel_history_component/travel_history_provider.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/profile_emission_component/profile_emission_provider.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/profile_provider.dart';
import 'package:sustain_tour_mobile/utils/geolocator_helper.dart';

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
    Future.delayed(const Duration(seconds: 0), () async {
      // minta izin lokasi
      bool isLocationPermissionGranted =
          await GeolocatorHelper.handleLocationPermission();
      if (!mounted) return;

      // jika izin diberikan maka tembak api update lokasi user
      if (isLocationPermissionGranted) {
        Provider.of<ProfileProvider>(context, listen: false)
            .updateUserLocation();
      }

      SplashScreenProvider splashScreenProvider =
          Provider.of<SplashScreenProvider>(context, listen: false);

      splashScreenProvider.loadDataSplashScreen(context).then((_) async {
        String token = splashScreenProvider.hasToken;
        int id = splashScreenProvider.hasId;

        if (token.isNotEmpty && id != 0) {
          Provider.of<ProfileProvider>(context, listen: false)
              .getUserData(userId: id, token: token);

          Provider.of<ProfileEmissionProvider>(context, listen: false)
              .getUserEmission(userId: id, token: token);

          Provider.of<HomeScreenProvider>(context, listen: false)
              .getRekomendasiWisata(token: token);

          Provider.of<HomeScreenProvider>(context, listen: false)
              .getPromo(token: token);

          Provider.of<TravelHistoryProvider>(context, listen: false)
              .getBookingHistory();

          Provider.of<NotificationProvider>(context, listen: false)
              .getNotifications();

          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const MainScreen()),
          );
        } else {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const OnboardingScreen()),
          );
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
