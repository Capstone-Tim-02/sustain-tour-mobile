import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/screen/home_screen/home_screen_provider.dart';
import 'package:sustain_tour_mobile/screen/login_screen/login_provider.dart';
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
    LoginProvider loginProvider = Provider.of<LoginProvider>(context, listen: false);
    ProfileProvider profileProvider = Provider.of<ProfileProvider>(context, listen: false);
    return SizedBox(
        height: 130,
        child: Consumer<HomeScreenProvider>(
          builder: (context, homeScreenProvider, child) {
            return homeScreenProvider.isLoadingPromo
                ? const Center(child: CircularProgressIndicator())
                : homeScreenProvider.isGetPromoSuccess
                    ? ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: homeScreenProvider.listPromo.length,
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
                                    userId: loginProvider.userId ?? 0,
                                    token: loginProvider.token.toString());
                                homeScreenProvider.getRekomendasiWisata(
                                    token: loginProvider.token.toString());
                                homeScreenProvider.getPromo(
                                    token: loginProvider.token.toString());
                              },
                              label: "Muat ulang")
                        ],
                      );
          },
        ));
  }
}
