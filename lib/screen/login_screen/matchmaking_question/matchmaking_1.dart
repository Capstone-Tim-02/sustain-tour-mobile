import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/constants/routes.dart';
import 'package:sustain_tour_mobile/screen/home_screen/components/notification_screen/notification_provider.dart';
import 'package:sustain_tour_mobile/screen/home_screen/home_screen_provider.dart';
import 'package:sustain_tour_mobile/screen/login_screen/login_provider.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/profile_emission_component/component/detail_emission_screen_component/component/travel_history_component/travel_history_provider.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/profile_emission_component/profile_emission_provider.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/profile_provider.dart';
import 'package:sustain_tour_mobile/screen/promo_screen/promo_provider.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
import 'package:sustain_tour_mobile/widget/button_widget.dart';

class Matchmaking1 extends StatelessWidget {
  const Matchmaking1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            children: [
              const SizedBox(
                height: 106,
              ),
              SizedBox(
                  height: 280,
                  width: 380,
                  child: Image.asset(Assets.assetsImagesMatchmaking)),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                  child: Column(
                children: [
                  Text(
                    'Mulai Petualangan Kamu dengan Kami!',
                    style: TextStyleWidget.headlineH2(
                        fontWeight: FontWeightStyle.medium),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Selamat datang! Kami ingin memberikan pengalaman wisata yang paling cocok dengan preferensi Kamu nih. Yuk kita mulai dengan beberapa pertanyaan singkat.',
                    style: TextStyleWidget.bodyB1(
                      fontWeight: FontWeightStyle.light,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              )),
            ],
          ),
          Column(
            children: [
              SizedBox(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonWidget.smallOutline(
                        text: 'Lewati',
                        onPressed: () {
                          LoginProvider loginProvider =
                              Provider.of<LoginProvider>(context,
                                  listen: false);
                          HomeScreenProvider homeScreenProvider =
                              Provider.of<HomeScreenProvider>(context,
                                  listen: false);
                          ProfileProvider profileProvider =
                              Provider.of<ProfileProvider>(context,
                                  listen: false);
                          PromoProvider promoProvider =
                              Provider.of<PromoProvider>(context,
                                  listen: false);
                          TravelHistoryProvider travelHistoryProvider =
                              Provider.of<TravelHistoryProvider>(context, listen: false);
                          NotificationProvider notificationProvider =
                              Provider.of<NotificationProvider>(context, listen: false);
                          ProfileEmissionProvider profileEmissionProvider =
                              Provider.of<ProfileEmissionProvider>(context,
                                listen: false);

                          homeScreenProvider.getRekomendasiWisata();
                          promoProvider.getUserPromo();
                          homeScreenProvider.getPromo();
                          profileProvider.getUserData(
                              userId: loginProvider.userId ?? 0);

                          travelHistoryProvider.getBookingHistory();
                          notificationProvider.getNotifications();

                          profileEmissionProvider.getUserEmission(
                            userId: loginProvider.userId ?? 0,
                          );
                          Navigator.pushNamedAndRemoveUntil(
                              context, Routes.mainScreen, (route) => false);
                        }),
                    const SizedBox(
                      width: 16,
                    ),
                    ButtonWidget.smallContainer(
                        text: 'Isi preferensi',
                        onPressed: () {
                          Navigator.pushNamed(
                              context, Routes.matchmaking2Screen);
                        })
                  ],
                ),
              )),
            ],
          ),
        ],
      ),
    ));
  }
}
