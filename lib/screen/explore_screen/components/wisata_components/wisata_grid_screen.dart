import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/screen/explore_screen/explore_screen_provider.dart';
import 'package:sustain_tour_mobile/screen/home_screen/components/detail_wisata_screen/carbon_footprint_byid_provider.dart';
import 'package:sustain_tour_mobile/screen/home_screen/components/detail_wisata_screen/detail_wisata_provider.dart';
import 'package:sustain_tour_mobile/screen/home_screen/components/detail_wisata_screen/detail_wisata_screen.dart';
import 'package:sustain_tour_mobile/widget/card_widget.dart';

class WisataGridScreen extends StatelessWidget {
  const WisataGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ExploreScreenProvider>(
        builder: (context, exploreScreenProvider, child) {
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: exploreScreenProvider.listWisata.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Provider.of<CarbonEmissionProvider>(context, listen: false)
                  .getCarbonEmissionById(
                      exploreScreenProvider.listWisata[index].id);
              final detailProvider =
                  Provider.of<DetailWisataProvider>(context, listen: false);
              detailProvider.getDetailWisataById(
                  exploreScreenProvider.listWisata[index].id);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailWisataScreen(),
                ),
              );
            },
            child: CardWidget.small(
                imageUrl: exploreScreenProvider.listWisata[index].photoWisata1,
                title: exploreScreenProvider.listWisata[index].title,
                location: exploreScreenProvider.listWisata[index].kota,
                price: exploreScreenProvider.listWisata[index].price),
          );
        },
      );
    });
  }
}
