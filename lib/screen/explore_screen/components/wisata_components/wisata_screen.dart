import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/screen/explore_screen/components/show_history_screen.dart';
import 'package:sustain_tour_mobile/screen/explore_screen/components/wisata_components/wisata_error_screen.dart';
import 'package:sustain_tour_mobile/screen/explore_screen/components/wisata_components/wisata_grid_screen.dart';
import 'package:sustain_tour_mobile/screen/explore_screen/components/wisata_components/wisata_not_found_screen.dart';
import 'package:sustain_tour_mobile/screen/explore_screen/explore_screen_provider.dart';

class ShowWisataScreen extends StatelessWidget {
  const ShowWisataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ExploreScreenProvider>(
      builder: (context, exploreScreenProvider, child) {
        return exploreScreenProvider.showSearchHistory
        ? const ShowHistoryScreen()
        : exploreScreenProvider.isGetWisataSuccess
          ? Column(
            children: [
              const SizedBox(height: 10),
              exploreScreenProvider.isGetWisataSuccess && exploreScreenProvider.listWisata.isEmpty && exploreScreenProvider.hasMoreWisata == false
              ? const WisataNotFoundScreen()
              : const WisataGridScreen()
            ],
          )
          : const WisataErrorScreen();
        }
    );
  }
}