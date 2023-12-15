import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/screen/home_screen/components/home_background.dart';
import 'package:sustain_tour_mobile/screen/home_screen/components/home_header.dart';
import 'package:sustain_tour_mobile/screen/home_screen/components/notification_screen/notification_provider.dart';
import 'package:sustain_tour_mobile/screen/home_screen/components/point_indicator.dart';
import 'package:sustain_tour_mobile/screen/home_screen/components/promo_header.dart';
import 'package:sustain_tour_mobile/screen/home_screen/components/promo_list_screen.dart';
import 'package:sustain_tour_mobile/screen/home_screen/components/rekomendasi_wisata_components/rekomendasi_wisata_screen.dart';
import 'package:sustain_tour_mobile/screen/home_screen/components/rekomendasi_wisata_components/rekomendasi_wisata_header.dart';
import 'package:sustain_tour_mobile/screen/home_screen/home_screen_provider.dart';
import 'package:sustain_tour_mobile/screen/login_screen/login_provider.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/profile_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () async {
          ProfileProvider poinDimiliki =
              Provider.of<ProfileProvider>(context, listen: false);

          LoginProvider loginProvider =
              Provider.of<LoginProvider>(context, listen: false);
          poinDimiliki.getUserData(userId: loginProvider.userId?.toInt() ?? 0);
          HomeScreenProvider homeScreenProvider =
              Provider.of<HomeScreenProvider>(context, listen: false);
          NotificationProvider notification =
              Provider.of<NotificationProvider>(context, listen: false);

          homeScreenProvider.getPromo();
          homeScreenProvider.getRekomendasiWisata();
          notification.getNotifications();
        },
        child: const SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [HomeBackground(), HomeHeader(), PointIndicator()],
              ),
              PromoHeader(),
              PromoListScreen(),
              SizedBox(height: 32),
              RekomendasiWisataHeader(),
              RekomendasiWisataScreen(),
              SizedBox(height: 40)
            ],
          ),
        ));
  }
}
