import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/screen/home_screen/home_screen_provider.dart';
import 'package:sustain_tour_mobile/screen/login_screen/login_provider.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/profile_provider.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
import 'package:sustain_tour_mobile/widget/badge_widget.dart';

class RekomendasiWisataErrorScreen extends StatelessWidget {
  const RekomendasiWisataErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginProvider loginProvider = Provider.of<LoginProvider>(context, listen: false);
    ProfileProvider profileProvider = Provider.of<ProfileProvider>(context, listen: false);
    return Column(
      children: [
        const SizedBox(height: 20),
        Text(
          "Terjadi kesalahan!",
          style: TextStyleWidget.titleT2(
              fontWeight: FontWeight.w700,
              color: ColorThemeStyle.red),
        ),
        const SizedBox(height: 16),
        Consumer<HomeScreenProvider>(
          builder : (context, homeScreenProvider, child) {
            return BadgeWidget.container(
              onPressed: () {
                profileProvider.getUserData(
                    userId: loginProvider.userId ?? 0,
                    token: loginProvider.token.toString());
                homeScreenProvider.getRekomendasiWisata(
                    token: loginProvider.token.toString());
                homeScreenProvider.getPromo(
                    token: loginProvider.token.toString());
              },
              label: "Muat ulang");
          }
        )
      ],
    );
  }
}