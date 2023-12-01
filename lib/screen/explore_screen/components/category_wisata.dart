import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/screen/explore_screen/explore_screen_provider.dart';
import 'package:sustain_tour_mobile/screen/login_screen/login_provider.dart';
import 'package:sustain_tour_mobile/widget/badge_widget.dart';

class CategoryWisata extends StatelessWidget {
  const CategoryWisata({super.key});

  @override
  Widget build(BuildContext context) {
    LoginProvider loginProvider = Provider.of<LoginProvider>(context, listen: false);
    return Consumer<ExploreScreenProvider>(
      builder: (context, exploreScreenProvider, child) {
        return exploreScreenProvider.showSearchHistory
        ? const SizedBox()
        : exploreScreenProvider.isGetWisataSuccess
          ? SizedBox(
              height: 40,
              child: ListView.builder(
                itemCount: exploreScreenProvider.wisataCategory.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: exploreScreenProvider.wisataCategory.values.elementAt(index) == true ?
                      BadgeWidget.containerWithIcon(
                        icon: const Icon(Icons.clear),
                        label: exploreScreenProvider.wisataCategory.keys.elementAt(index),
                        onPressed: (){
                          exploreScreenProvider.toggleButtonCategory(index: index);
                          if (exploreScreenProvider.showSearchPage == true) {
                            exploreScreenProvider.getWisataDataBySearch(
                              token: loginProvider.token.toString(),
                              searchQuery: exploreScreenProvider.searchWisataController.text
                            );
                          } else {
                            exploreScreenProvider.getWisataDataByFilter(
                              token: loginProvider.token.toString(),
                            );
                          }
                        }
                      ) :
                      BadgeWidget.outline(
                        label: exploreScreenProvider.wisataCategory.keys.elementAt(index),
                        onPressed: (){
                          exploreScreenProvider.toggleButtonCategory(index: index);
                          if (exploreScreenProvider.showSearchPage == true) {
                            exploreScreenProvider.getWisataDataBySearch(
                              token: loginProvider.token.toString(),
                              searchQuery: exploreScreenProvider.searchWisataController.text
                            );
                          } else {
                            exploreScreenProvider.getWisataDataByFilter(
                              token: loginProvider.token.toString(),
                            );
                          }
                        }
                      )
                    );
                },
              ),
            )
          : const SizedBox();
      },
    );
  }
}