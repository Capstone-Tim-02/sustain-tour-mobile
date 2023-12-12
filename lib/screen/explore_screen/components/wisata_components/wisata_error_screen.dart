import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/screen/explore_screen/explore_screen_provider.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
import 'package:sustain_tour_mobile/widget/badge_widget.dart';

class WisataErrorScreen extends StatelessWidget {
  const WisataErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ExploreScreenProvider exploreScreenProvider = Provider.of<ExploreScreenProvider>(context, listen: false);
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
        BadgeWidget.container(
          onPressed: () {
            exploreScreenProvider.getAllKota();
            exploreScreenProvider.getAllCategories();
            if (exploreScreenProvider.showSearchPage == true) {
              exploreScreenProvider.getWisataDataBySearch(
                searchQuery: exploreScreenProvider.searchWisataController.text
              );
            } else {
              exploreScreenProvider.getWisataDataByFilter();
            }
          },
          label: "Muat ulang")
      ],
    );
  }
}