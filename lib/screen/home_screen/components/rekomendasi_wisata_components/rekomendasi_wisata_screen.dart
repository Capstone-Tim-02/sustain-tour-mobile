import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/screen/home_screen/components/rekomendasi_wisata_components/rekomendasi_wisata_error_screen.dart';
import 'package:sustain_tour_mobile/screen/home_screen/components/rekomendasi_wisata_components/rekomendasi_wisata_grid_screen.dart';
import 'package:sustain_tour_mobile/screen/home_screen/home_screen_provider.dart';

class RekomendasiWisataScreen extends StatelessWidget {
  const RekomendasiWisataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
      builder: (context, homeScreenProvider, child) {
        return homeScreenProvider.isLoadingWisata
            ? const Padding(
                padding: EdgeInsets.all(40),
                child: Center(child: CircularProgressIndicator()),
              )
            : homeScreenProvider.isGetWisataSuccess
                ? const RekomendasiWisataGridScreen()
                : const RekomendasiWisataErrorScreen();
      },
    );
  }
}