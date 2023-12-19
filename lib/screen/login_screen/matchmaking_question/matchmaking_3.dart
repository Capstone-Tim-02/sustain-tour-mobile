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

class Matchmaking3 extends StatelessWidget {
  const Matchmaking3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            children: [
              const SizedBox(
                height: 77,
              ),
              Image.asset(Assets.assetsImagesSelamatDatang),
              const SizedBox(
                height: 33,
              ),
              Text(
                'Selamat Bergabung\nbersama Kami!',
                style: TextStyleWidget.headlineH3(
                  fontWeight: FontWeightStyle.medium,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Ayo mulai petualangan Kamu! Temukan destinasi yang menakjubkan dan rencanakan liburan impian Anda bersama kami.',
                style: TextStyleWidget.bodyB1(
                  fontWeight: FontWeightStyle.light,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: ButtonWidget.defaultContainer(
                text: 'Mulai',
                onPressed: () {
                  LoginProvider loginProvider =
                      Provider.of<LoginProvider>(context, listen: false);

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
          )
        ],
      ),
    );
  }
}
