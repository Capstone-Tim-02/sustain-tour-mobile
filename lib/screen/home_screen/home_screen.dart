import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/screen/home_screen/components/home_background.dart';
import 'package:sustain_tour_mobile/screen/home_screen/components/home_header.dart';
import 'package:sustain_tour_mobile/screen/home_screen/components/point_indicator.dart';
import 'package:sustain_tour_mobile/screen/home_screen/components/promo_header.dart';
import 'package:sustain_tour_mobile/screen/home_screen/components/promo_list_screen.dart';
import 'package:sustain_tour_mobile/screen/home_screen/components/rekomendasi_wisata_components/rekomendasi_wisata_screen.dart';
import 'package:sustain_tour_mobile/screen/home_screen/components/rekomendasi_wisata_components/rekomendasi_wisata_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              HomeBackground(),
              HomeHeader(),
              PointIndicator()
            ],
          ),
          PromoHeader(),
          PromoListScreen(),
          SizedBox(height: 32),
          RekomendasiWisataHeader(),
          RekomendasiWisataScreen(),
          SizedBox(height: 40)
        ],
      ),
    );
  }
}
