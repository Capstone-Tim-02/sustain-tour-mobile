import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/screen/explore_screen/explore_screen_provider.dart';
import 'package:sustain_tour_mobile/screen/login_screen/login_provider.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
import 'package:sustain_tour_mobile/widget/badge_widget.dart';
import 'package:sustain_tour_mobile/widget/button_widget.dart';
import 'package:sustain_tour_mobile/widget/card_widget.dart';
import 'package:sustain_tour_mobile/widget/search_widget.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {

  @override
  void initState() {
    super.initState();
    ExploreScreenProvider exploreScreenProvider = Provider.of<ExploreScreenProvider>(context, listen: false);
    LoginProvider loginProvider = Provider.of<LoginProvider>(context, listen: false);
      exploreScreenProvider.getWisataInit(
        token: loginProvider.token.toString());
      exploreScreenProvider.getAllKota(
        token: loginProvider.token.toString());
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController searchWisataController = TextEditingController();
    TextEditingController searchKotaController = TextEditingController();
    ExploreScreenProvider exploreScreenProvider = Provider.of<ExploreScreenProvider>(context, listen: false);
    LoginProvider loginProvider = Provider.of<LoginProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Text(
                "Explore",
                style: TextStyleWidget.titleT2(
                    color: ColorThemeStyle.black100,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 16),
              child: SearchWidget(
                controller: searchWisataController,
                label: "Test",
                onSubmit: (value){
                  exploreScreenProvider.onSearchWisata();
                  exploreScreenProvider.getWisataData(
                    token: loginProvider.token.toString(),
                    searchQuery: searchWisataController.text
                  );
                },
                key: null,
              ),
            ),
            BadgeWidget.container(
              onPressed: (){
                showModalBottomSheet(
                  context: context,
                  backgroundColor: ColorThemeStyle.white100,
                  builder: (context) {
                    exploreScreenProvider.onBottomSheetOpened();
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 17, right: 22, top: 50, bottom: 24),
                          child: SearchWidget(
                            label: "Search",
                            onSubmit: (value){
                              exploreScreenProvider.searchKota(query: searchKotaController.text);
                            },
                            controller: searchKotaController
                          ),
                        ),
                        Expanded(
                          child: Consumer<ExploreScreenProvider>(
                            builder: (context, exploreScreenProvider, child) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: SingleChildScrollView(
                                  child: Wrap(
                                    spacing: 8,
                                    runSpacing: 16,
                                    children: [
                                      for(int i = 0; i < exploreScreenProvider.listSearchedKota.length;i++)
                                      i == exploreScreenProvider.kotaIndex
                                      ? BadgeWidget.container(
                                          onPressed: (){},
                                          label: exploreScreenProvider.listSearchedKota[i]
                                        )
                                      : BadgeWidget.outline(
                                          onPressed: (){
                                            exploreScreenProvider.selectKota(i);
                                          },
                                          label: exploreScreenProvider.listSearchedKota[i]
                                        )
                                    ],
                                  ),
                                ),
                              );
                            },
                          )
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              child: const Text("Batal")
                            ),
                            Consumer<ExploreScreenProvider>(
                              builder: (context, exploreScreenProvider, child) {
                                return ElevatedButton(
                                  onPressed: exploreScreenProvider.kotaIndex != -1
                                    ? (){
                                      exploreScreenProvider.onSubmitKota();
                                      exploreScreenProvider.getWisataData(
                                        token: loginProvider.token.toString(),
                                        searchQuery: searchWisataController.text
                                      );
                                      Navigator.pop(context);
                                    } : null,
                                  child: const Text("Simpan")
                                );
                              }
                            )
                          ],
                        ),
                        const SizedBox(height: 45)
                      ],
                    );
                  }
                );
              },
              label: "Test bottom sheet filter lokasi"
            ),
            const SizedBox(height: 40),
            SizedBox(
              height: 40,
              child: Consumer<ExploreScreenProvider>(
                  builder: (context, exploreScreenProvider, child) {
                    return ListView.builder(
                      itemCount: exploreScreenProvider.wisataCategory.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: exploreScreenProvider.wisataCategory.values.elementAt(index) == true ?
                            BadgeWidget.container(
                              label: exploreScreenProvider.wisataCategory.keys.elementAt(index),
                              onPressed: (){
                                exploreScreenProvider.toggleButtonCategory(index: index);
                                exploreScreenProvider.getWisataData(
                                  token: loginProvider.token.toString(),
                                  searchQuery: searchWisataController.text
                                );
                              }
                            ) :
                            BadgeWidget.outline(
                              label: exploreScreenProvider.wisataCategory.keys.elementAt(index),
                              onPressed: (){
                                exploreScreenProvider.toggleButtonCategory(index: index);
                                exploreScreenProvider.getWisataData(
                                  token: loginProvider.token.toString(),
                                  searchQuery: searchWisataController.text
                                );
                              }
                            )
                          );
                      },
                    );
                  },
                )
            ),
            const SizedBox(height: 10),
            Consumer<ExploreScreenProvider>(
              builder: (context, exploreScreenProvider, child) {
                return exploreScreenProvider.isGetWisataSuccess
                  ? GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8),
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(
                          top: 15, left: 10, right: 10),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: exploreScreenProvider.listWisata.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CardWidget.small(
                            imageUrl: exploreScreenProvider
                                .listWisata[index].photoWisata1,
                            title:
                                exploreScreenProvider.listWisata[index].title,
                            location:
                                exploreScreenProvider.listWisata[index].kota,
                            price:
                                exploreScreenProvider.listWisata[index].price);
                      },
                    )
                  : Column(
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
                              exploreScreenProvider.getWisataData(
                                token: loginProvider.token.toString()
                              );
                              exploreScreenProvider.getAllKota(
                                token: loginProvider.token.toString()
                              );
                            },
                            label: "Muat ulang")
                      ],
                    );
                }
            ),
            Consumer<ExploreScreenProvider>(
              builder: (context, exploreScreenProvider, child) {
                return exploreScreenProvider.isLoadingWisata
                  ? const Padding(
                      padding: EdgeInsets.all(40),
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : const SizedBox(height: 40);
              }
            ),
            ButtonWidget.defaultContainer(
              text: "Load more",
              onPressed: (){
                exploreScreenProvider.getWisataData(
                  token: loginProvider.token.toString(),
                  searchQuery: searchWisataController.text
                );
              }
            )
          ],
        ),
      ),
    );
  }
}
