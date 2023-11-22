import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/screen/explore_screen/explore_screen_provider.dart';
import 'package:sustain_tour_mobile/screen/login_screen/login_provider.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
import 'package:sustain_tour_mobile/widget/badge_widget.dart';
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
      exploreScreenProvider.getSearchHistory(
        userId: loginProvider.userId?.toInt() ?? 0);
    _scrollController.addListener(onScroll);
  }

  void onScroll(){
    ExploreScreenProvider exploreScreenProvider = Provider.of<ExploreScreenProvider>(context, listen: false);
    LoginProvider loginProvider = Provider.of<LoginProvider>(context, listen: false);

    double maxScroll = _scrollController.position.maxScrollExtent;
    double currentScroll = _scrollController.position.pixels;

    if(currentScroll >= maxScroll && exploreScreenProvider.hasMoreWisata){
      if(exploreScreenProvider.showSearchPage){
        exploreScreenProvider.getWisataDataBySearch(
          token: loginProvider.token.toString(),
          searchQuery: _searchWisataController.text
        );
      } else {
        exploreScreenProvider.getWisataDataByFilter(
          token: loginProvider.token.toString(),
        );
      }
    }
  }

  @override
  void dispose() {
    _searchWisataController.dispose();
    _searchKotaController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  final TextEditingController _searchWisataController = TextEditingController();
  final TextEditingController _searchKotaController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    ExploreScreenProvider exploreScreenProvider = Provider.of<ExploreScreenProvider>(context, listen: false);
    LoginProvider loginProvider = Provider.of<LoginProvider>(context, listen: false);
    return SingleChildScrollView(
      controller: _scrollController,
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 4),
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
                  exploreScreenProvider.onSearchWisataSubmit();
                  exploreScreenProvider.addSearchHistory(
                    userId: loginProvider.userId?.toInt() ?? 0,
                    query: _searchWisataController.text
                  );
                  exploreScreenProvider.getWisataDataBySearch(
                    token: loginProvider.token.toString(),
                    searchQuery: _searchWisataController.text
                  );
                },
                onTap: (){
                  exploreScreenProvider.onSearchWisataTap();
                },
                label: "Search",
                controller: _searchWisataController,
                prefixIcon: const Icon(
                  Icons.search,
                  size: 24,
                ),
                suffixIcon: Consumer<ExploreScreenProvider>(
                  builder: (context, exploreScreenProvider, child) {
                    return exploreScreenProvider.showSearchPage
                    ? Padding(
                        padding: const EdgeInsets.all(16),
                        child: InkWell(
                          onTap: (){
                            exploreScreenProvider.onSearchWisataClear();
                            _searchWisataController.clear();
                            exploreScreenProvider.getWisataInit(token: loginProvider.token.toString());
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
                                          exploreScreenProvider.searchKota(query: _searchKotaController.text);
                                        },
                                        controller: _searchKotaController,
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
            Consumer<ExploreScreenProvider>(
              builder: (context, exploreScreenProvider, child) {
                return exploreScreenProvider.showSearchHistory
                ? Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: ColorThemeStyle.white100
                    ),
                    child: Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          reverse: true,
                          padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
                          itemCount: exploreScreenProvider.searchHistoryList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: (){
                                exploreScreenProvider.onSearchWisataSubmit();
                                exploreScreenProvider.getWisataDataBySearch(
                                  token: loginProvider.token.toString(),
                                  searchQuery: exploreScreenProvider.searchHistoryList[index].query
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.access_time,
                                          size: 24,
                                          color: ColorThemeStyle.black100
                                        ),
                                        const SizedBox(width: 16),
                                        SizedBox(
                                          width: 280,
                                          child: Text(
                                            exploreScreenProvider.searchHistoryList[index].query,
                                            style: TextStyleWidget.bodyB3(
                                              color: ColorThemeStyle.black100,
                                              fontWeight: FontWeight.w500
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    InkWell(
                                      onTap: (){
                                        exploreScreenProvider.deleteSearchHistory(
                                          id: exploreScreenProvider.searchHistoryList[index].id,
                                          userId: loginProvider.userId ?? 0
                                        );
                                      },
                                      child: const Icon(
                                        Icons.close,
                                        size: 24,
                                        color: ColorThemeStyle.black100
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  )
                : exploreScreenProvider.isGetWisataSuccess
                  ? Column(
                    children: [
                      const SizedBox(height: 10),
                      exploreScreenProvider.isGetWisataSuccess && exploreScreenProvider.listWisata.isEmpty && exploreScreenProvider.hasMoreWisata == false
                      ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 125),
                            Image.asset(Assets.assetsImagesNotFoundWisata),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                "Hmm, yang kamu cari tidak ditemukan",
                                style: TextStyleWidget.titleT2(
                                  color: ColorThemeStyle.black100,
                                  fontWeight: FontWeight.w600
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Text(
                              "Maaf, tidak ada yang sesuai. Tapi tenang,\nkamu bisa coba kata kunci lainnya kok.",
                              style: TextStyleWidget.bodyB3(
                                color: ColorThemeStyle.black100,
                                fontWeight: FontWeight.w400
                              ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        )
                      )
                      : GridView.builder(
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
                        ),
                    ],
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
                return exploreScreenProvider.hasMoreWisata
                  ? const Padding(
                      padding: EdgeInsets.all(30),
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : const SizedBox(height: 40);
              }
            ),
          ],
        ),
      ),
    );
  }
}
