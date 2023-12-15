import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/screen/home_screen/components/notification_screen/notification_provider.dart';
import 'package:sustain_tour_mobile/screen/home_screen/home_screen_provider.dart';
import 'package:sustain_tour_mobile/screen/login_screen/login_provider.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/profile_emission_component/component/detail_emission_screen_component/component/travel_history_component/travel_history_provider.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/profile_emission_component/profile_emission_provider.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/profile_provider.dart';
import 'package:sustain_tour_mobile/screen/promo_screen/component/detail_promo_screen.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
import 'package:sustain_tour_mobile/widget/badge_widget.dart';
import 'package:sustain_tour_mobile/widget/card_widget.dart';

class PromoListScreen extends StatelessWidget {
  const PromoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginProvider loginProvider =
        Provider.of<LoginProvider>(context, listen: false);
    ProfileProvider profileProvider =
        Provider.of<ProfileProvider>(context, listen: false);
    return SizedBox(
        height: 130,
        child: Consumer<HomeScreenProvider>(
          builder: (context, homeScreenProvider, child) {
            return homeScreenProvider.isLoadingPromo
                ? const Center(child: CircularProgressIndicator())
                : homeScreenProvider.isGetPromoSuccess
                    ? ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: min(5, homeScreenProvider.listPromo.length),
                        //item count  : agar jika data kurang dari 5 akan tampil tanpa eror, jika data > 5 akan menampilkan 5 data saja
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => DetailPromoScreen(
                                      promoId: homeScreenProvider
                                          .listPromo[index].id,
                                    ),
                                  ),
                                );
                              },
                              child: CardWidget.medium(
                                  imageUrl: homeScreenProvider
                                      .listPromo[index].imageVoucher,
                                  title: homeScreenProvider
                                      .listPromo[index].title),
                            ),
                          );
                        },
                      )
                    : Column(
                        children: [
                          const SizedBox(height: 20),
                          Text(
                            "Terjadi kesalahan!",
                            style: TextStyleWidget.titleT2(
                                fontWeight: FontWeight.w700,
                                color: ColorThemeStyle.red),
                          ),
                          const SizedBox(height: 16),
                          BadgeWidget.container(
                              onPressed: () {
                                profileProvider.getUserData(
                                    userId: loginProvider.userId ?? 0);
                                homeScreenProvider.getRekomendasiWisata();
                                homeScreenProvider.getPromo();
                                Provider.of<ProfileEmissionProvider>(context,
                                        listen: false)
                                    .getUserEmission(
                                        userId: loginProvider.userId ?? 0);
                                Provider.of<TravelHistoryProvider>(context,
                                        listen: false)
                                    .getBookingHistory();
                                Provider.of<NotificationProvider>(context,
                                        listen: false)
                                    .getNotifications();
                              },
                              label: "Muat ulang")
                        ],
                      );
          },
        ));
  }
}
