import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/screen/home_screen/home_screen_provider.dart';
import 'package:sustain_tour_mobile/widget/card_widget.dart';

class RekomendasiWisataGridScreen extends StatelessWidget {
  const RekomendasiWisataGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
      builder: (context, homeScreenProvider, child) {
        return GridView.builder(
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8),
          shrinkWrap: true,
          padding: const EdgeInsets.only(
              top: 15, left: 10, right: 10),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: homeScreenProvider.listWisata.length,
          itemBuilder: (BuildContext context, int index) {
            return CardWidget.small(
                imageUrl: homeScreenProvider
                    .listWisata[index].photoWisata1,
                title:
                    homeScreenProvider.listWisata[index].title,
                location:
                    homeScreenProvider.listWisata[index].kota,
                price:
                    homeScreenProvider.listWisata[index].price);
          },
        );
      }
    );
  }
}