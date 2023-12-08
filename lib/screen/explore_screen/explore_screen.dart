import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/screen/explore_screen/components/category_wisata.dart';
import 'package:sustain_tour_mobile/screen/explore_screen/components/loading_wisata.dart';
import 'package:sustain_tour_mobile/screen/explore_screen/components/search_wisata.dart';
import 'package:sustain_tour_mobile/screen/explore_screen/components/wisata_components/wisata_screen.dart';
import 'package:sustain_tour_mobile/screen/explore_screen/explore_screen_provider.dart';
import 'package:sustain_tour_mobile/screen/login_screen/login_provider.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    ExploreScreenProvider exploreScreenProvider = Provider.of<ExploreScreenProvider>(context, listen: false);
    LoginProvider loginProvider = Provider.of<LoginProvider>(context, listen: false);

    void onScroll(){
      double maxScroll = scrollController.position.maxScrollExtent;
      double currentScroll = scrollController.position.pixels;

      if(currentScroll >= maxScroll && exploreScreenProvider.hasMoreWisata){
        if(exploreScreenProvider.showSearchPage){
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
    }

    exploreScreenProvider.getWisataInit(
      token: loginProvider.token.toString());
    exploreScreenProvider.getAllKota(
      token: loginProvider.token.toString());
    exploreScreenProvider.getAllCategories(
      token: loginProvider.token.toString());
    exploreScreenProvider.getSearchHistory(
      userId: loginProvider.userId?.toInt() ?? 0);
    scrollController.addListener(onScroll);

    return RefreshIndicator(
      onRefresh: () async{
        ExploreScreenProvider exploreScreenProvider = Provider.of<ExploreScreenProvider>(context, listen: false);
        LoginProvider loginProvider = Provider.of<LoginProvider>(context, listen: false);
          exploreScreenProvider.getWisataInit(
            token: loginProvider.token.toString());
          exploreScreenProvider.getAllKota(
            token: loginProvider.token.toString());
          exploreScreenProvider.getAllCategories(
            token: loginProvider.token.toString());
          exploreScreenProvider.getSearchHistory(
            userId: loginProvider.userId?.toInt() ?? 0);
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        controller: scrollController,
        child: const Center(
          child: Column(
            children: [
              SearchWisata(),
              CategoryWisata(),
              ShowWisataScreen(),
              LoadingWisata()
            ],
          ),
        ),
      ),
    );
  }
}
