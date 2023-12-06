import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/screen/explore_screen/components/category_wisata.dart';
import 'package:sustain_tour_mobile/screen/explore_screen/components/loading_wisata.dart';
import 'package:sustain_tour_mobile/screen/explore_screen/components/search_wisata.dart';
import 'package:sustain_tour_mobile/screen/explore_screen/components/wisata_components/wisata_screen.dart';
import 'package:sustain_tour_mobile/screen/explore_screen/explore_screen_provider.dart';
import 'package:sustain_tour_mobile/screen/login_screen/login_provider.dart';

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
          searchQuery: exploreScreenProvider.searchWisataController.text
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
    _scrollController.dispose();
    super.dispose();
  }

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
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
    );
  }
}
