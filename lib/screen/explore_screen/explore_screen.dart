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
  void dispose() {
    searchWisataController.dispose();
    searchKotaController.dispose();
    super.dispose();
  }

  TextEditingController searchWisataController = TextEditingController();
  TextEditingController searchKotaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ExploreScreenProvider exploreScreenProvider = Provider.of<ExploreScreenProvider>(context, listen: false);
    LoginProvider loginProvider = Provider.of<LoginProvider>(context, listen: false);
    return RefreshIndicator(
      onRefresh: () async{
        exploreScreenProvider.getWisataDataByFilter(
          token: loginProvider.token.toString());
        exploreScreenProvider.getAllKota(
          token: loginProvider.token.toString());
      },
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Text(
                  "Explore",
                  style: TextStyleWidget.titleT2(
                    color: ColorThemeStyle.black100,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: SearchWidget(
                  style: TextStyleWidget.titleT2(
                    color: ColorThemeStyle.grey100
                  ),
                  onSubmit: (value){
                    exploreScreenProvider.onSearchWisata();
                    exploreScreenProvider.getWisataDataBySearch(
                      token: loginProvider.token.toString(),
                      searchQuery: searchWisataController.text
                    );
                  },
                  onTap: (){
                    exploreScreenProvider.onSearchTap();
                  },
                  label: "Search",
                  controller: searchWisataController,
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 24,
                  ),
                  suffixIcon: Consumer<ExploreScreenProvider>(
                    builder: (context, exploreScreenProvider, child) {
                      return exploreScreenProvider.showSearchPage == true
                      ? Padding(
                          padding: const EdgeInsets.all(16),
                          child: InkWell(
                            onTap: (){
                              exploreScreenProvider.onClearTap();
                              searchWisataController.clear();
                            },
                            child: const Icon(
                              Icons.clear,
                              size: 24
                            ),
                          )
                        )
                      : Container(
                          margin: const EdgeInsets.symmetric(vertical: 11, horizontal: 13),
                          decoration: BoxDecoration(
                            color: ColorThemeStyle.blue100,
                            borderRadius: BorderRadiusDirectional.circular(20)
                          ),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(20),
                            onTap: (){
                              exploreScreenProvider.onBottomSheetOpened();
                              showModalBottomSheet(
                                context: context,
                                backgroundColor: ColorThemeStyle.white100,
                                builder: (context) {
                                  return Column(
                                    children: [
                                      const SizedBox(height: 3),
                                      const Divider(
                                        color: ColorThemeStyle.grey80,
                                        indent: 130,
                                        endIndent: 130,
                                        thickness: 5,
                                      ),
                                        Padding(
                                        padding: const EdgeInsets.only(top: 35, bottom: 18, left: 20, right: 20),
                                        child: SearchWidget(
                                          style: TextStyleWidget.titleT2(
                                            color: ColorThemeStyle.grey100
                                          ),
                                          onSubmit : (value){
                                            exploreScreenProvider.searchKota(query: searchKotaController.text);
                                          },
                                          controller: searchKotaController,
                                          prefixIcon: const Icon(
                                            Icons.search,
                                            size: 24,
                                          ),
                                          label: "Search",
                                        ),
                                      ),
                                      Expanded(
                                        child: Consumer<ExploreScreenProvider>(
                                          builder: (context, exploreScreenProvider, child) {
                                            return Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 18),
                                              child: SingleChildScrollView(
                                                child: Wrap(
                                                  spacing: 8,
                                                  runSpacing: 16,
                                                  children: [
                                                    for(int i = 0; i < exploreScreenProvider.listSearchedKota.length;i++)
                                                    i == exploreScreenProvider.kotaIndex
                                                    ? BadgeWidget.containerWithIcon(
                                                        icon: const Icon(Icons.clear),
                                                        onPressed: (){
                                                          exploreScreenProvider.selectKota(-1);
                                                        },
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
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 14),
                                        child: Consumer<ExploreScreenProvider>(
                                          builder: (context, exploreScreenProvider, child) {
                                            return Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(8),
                                                      side: const BorderSide(
                                                        color: ColorThemeStyle.red,
                                                        width: 1
                                                      ),
                                                    )
                                                  ),
                                                  onPressed: (){
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    "Batal",
                                                    style: TextStyleWidget.titleT2(
                                                      color: ColorThemeStyle.red,
                                                      fontWeight: FontWeight.w500
                                                    ),
                                                  )
                                                ),
                                                const SizedBox(width: 16),
                                                ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(8),
                                                    ),
                                                    disabledForegroundColor: ColorThemeStyle.blue100.withOpacity(0.6),
                                                    disabledBackgroundColor: ColorThemeStyle.blue100.withOpacity(0.6),
                                                    backgroundColor: ColorThemeStyle.blue100
                                                  ),
                                                  onPressed: exploreScreenProvider.kotaIndex != -1
                                                    ? (){
                                                      exploreScreenProvider.onSubmitKota();
                                                      exploreScreenProvider.getWisataDataByFilter(
                                                        token: loginProvider.token.toString(),
                                                      );
                                                      Navigator.pop(context);
                                                    } : null,
                                                  child: Text(
                                                    "Simpan",
                                                    style: TextStyleWidget.titleT2(
                                                      color: ColorThemeStyle.white100,
                                                      fontWeight: FontWeight.w500
                                                    ),
                                                  )
                                                )
                                              ]
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  );
                                }
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.location_on_rounded,
                                    color: ColorThemeStyle.white100,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    exploreScreenProvider.selectedKota,
                                    style: TextStyleWidget.labelL2(
                                      color: ColorThemeStyle.white100,
                                      fontWeight: FontWeight.w600
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                    }
                  )
                )
              ),
              Consumer<ExploreScreenProvider>(
                builder: (context, exploreScreenProvider, child) {
                  return exploreScreenProvider.showSearchPage
                  ? const SizedBox()
                  : SizedBox(
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
                                  exploreScreenProvider.getWisataDataByFilter(
                                    token: loginProvider.token.toString(),
                                  );
                                }
                              ) :
                              BadgeWidget.outline(
                                label: exploreScreenProvider.wisataCategory.keys.elementAt(index),
                                onPressed: (){
                                  exploreScreenProvider.toggleButtonCategory(index: index);
                                  exploreScreenProvider.getWisataDataByFilter(
                                    token: loginProvider.token.toString(),
                                  );
                                }
                              )
                            );
                        },
                      ),
                    );
                },
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
                                exploreScreenProvider.getWisataDataByFilter(
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
              //TODO Ganti dengan pagination menggunakan scroll controller
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
                child: ButtonWidget.defaultContainer(
                  text: "Load more",
                  onPressed: (){
                    //TODO masukin ternary kalo misal halaman search
                    exploreScreenProvider.showSearchPage
                    ? exploreScreenProvider.getWisataDataBySearch(
                        token: loginProvider.token.toString(),
                        searchQuery: searchWisataController.text
                      )
                    : exploreScreenProvider.getWisataDataByFilter(
                        token: loginProvider.token.toString(),
                      );
                  }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
