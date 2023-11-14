import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/screen/explore_screen/explore_screen_provider.dart';
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
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => setState(
        () {
          //TODO Gabungin sama auth
          final exploreProvider =
              Provider.of<ExploreScreenProvider>(context, listen: false);
          exploreProvider.getAllWisataByPageInitPage(
            token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InN0ZXZlbiIsImV4cCI6MTcwMTE1ODEzOCwiaWF0IjoxNjk5OTQ4NTM4fQ.t3tDVgqfxmo8WXeb0dkdgCt1_higOytf0CLmbWpx310"
            );
        },
      ),
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
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
            //TODO : Menunggu Search Local Component
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 16),
              child: SearchWidget(
                controller: searchController,
                label: "Test",
                onSubmit: (value){
                  //TODO isi dengan Logika search provider
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
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 17, right: 22, top: 50, bottom: 24),
                          child: SearchWidget(
                            label: "Search",
                            onSubmit: (value){
                              //TODO Logic search kota
                            },
                            controller: TextEditingController()
                          ),
                        ),
                        Expanded(
                          child: Consumer<ExploreScreenProvider>(
                            builder: (context, exploreScreenProvider, child) {
                              return GridView.builder(
                                itemCount: exploreScreenProvider.listKota.length,
                                padding: const EdgeInsets.symmetric(horizontal: 18),
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 16,
                                  childAspectRatio: 10/4
                                ),
                                itemBuilder: (context, index) {
                                  return BadgeWidget.outline(
                                    onPressed: (){
                                      //TODO Logic Toggle kota
                                    },
                                    label: exploreScreenProvider.listKota[index]
                                  );
                                },
                              );
                            },
                          )
                        ),
                        const SizedBox(height: 20)
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
                                print('Button Pressed disable!');
                                setState(() {
                                  exploreScreenProvider.toggleButton(index: index);
                                });
                              }
                            ) :
                            BadgeWidget.outline(
                              label: exploreScreenProvider.wisataCategory.keys.elementAt(index),
                              onPressed: (){
                                print('Button Pressed enable!');
                                setState(() {
                                  exploreScreenProvider.toggleButton(index: index);
                                });
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
                            didChangeDependencies();
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
                Provider.of<ExploreScreenProvider>(context, listen: false).getAllWisataByPage(token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InN0ZXZlbiIsImV4cCI6MTcwMTE1ODEzOCwiaWF0IjoxNjk5OTQ4NTM4fQ.t3tDVgqfxmo8WXeb0dkdgCt1_higOytf0CLmbWpx310");
              }
            )
          ],
        ),
      ),
    );
  }
}
