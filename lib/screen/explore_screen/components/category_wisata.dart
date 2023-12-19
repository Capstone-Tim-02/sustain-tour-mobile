import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/screen/explore_screen/explore_screen_provider.dart';
import 'package:sustain_tour_mobile/widget/badge_widget.dart';

class CategoryWisata extends StatelessWidget {
  const CategoryWisata({super.key});

  @override
  Widget build(BuildContext context) {
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
                            child: exploreScreenProvider.wisataCategory.values
                                        .elementAt(index) ==
                                    true
                                ? Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: BadgeWidget.containerWithIcon(
                                        icon: const Icon(Icons.clear, size: 18),
                                        label: exploreScreenProvider
                                            .wisataCategory.keys
                                            .elementAt(index),
                                        onPressed: () async {
                                          await exploreScreenProvider
                                              .toggleButtonCategory(
                                                  index: index);
                                          if (exploreScreenProvider
                                                  .showSearchPage ==
                                              true) {
                                            await exploreScreenProvider
                                                .getWisataDataBySearch(
                                                    searchQuery:
                                                        exploreScreenProvider
                                                            .searchWisataController
                                                            .text);
                                          } else {
                                            await exploreScreenProvider
                                                .getWisataDataByFilter();
                                          }
                                        }),
                                  )
                                : BadgeWidget.outline(
                                    label: exploreScreenProvider
                                        .wisataCategory.keys
                                        .elementAt(index),
                                    onPressed: () async {
                                      await exploreScreenProvider
                                          .toggleButtonCategory(index: index);
                                      if (exploreScreenProvider
                                              .showSearchPage ==
                                          true) {
                                        await exploreScreenProvider
                                            .getWisataDataBySearch(
                                                searchQuery:
                                                    exploreScreenProvider
                                                        .searchWisataController
                                                        .text);
                                      } else {
                                        await exploreScreenProvider
                                            .getWisataDataByFilter();
                                      }
                                    }));
                      },
                    ),
                  )
                : const SizedBox();
      },
    );
  }
}
