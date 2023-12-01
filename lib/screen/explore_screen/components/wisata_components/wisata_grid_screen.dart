import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/constants/routes.dart';
import 'package:sustain_tour_mobile/screen/explore_screen/explore_screen_provider.dart';
import 'package:sustain_tour_mobile/widget/card_widget.dart';

class WisataGridScreen extends StatelessWidget {
  const WisataGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ExploreScreenProvider>(
      builder: (context, exploreScreenProvider, child) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8
          ),
          shrinkWrap: true,
          padding: const EdgeInsets.only(
              top: 15, left: 10, right: 10),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: exploreScreenProvider.listWisata.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              //TODO Ingat ganti gesture detector nya ketika detail screen sudah jadi
              onTap: (){
                Navigator.pushNamed(
                  context,
                  Routes.checkoutScreen,
                  arguments: exploreScreenProvider.listWisata[index],
                );
              },
              child: CardWidget.small(
                  imageUrl: exploreScreenProvider.listWisata[index].photoWisata1,
                  title:
                      exploreScreenProvider.listWisata[index].title,
                  location:
                      exploreScreenProvider.listWisata[index].kota,
                  price:
                      exploreScreenProvider.listWisata[index].price),
            );
          },
        );
      }
    );
  }
}