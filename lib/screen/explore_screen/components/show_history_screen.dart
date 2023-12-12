import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/screen/explore_screen/explore_screen_provider.dart';
import 'package:sustain_tour_mobile/screen/login_screen/login_provider.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class ShowHistoryScreen extends StatelessWidget {
  const ShowHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginProvider loginProvider = Provider.of<LoginProvider>(context, listen: false);
    return Consumer<ExploreScreenProvider>(
      builder: (context, exploreScreenProvider, child) {
        return ListView.builder(
          reverse: true,
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
          itemCount: exploreScreenProvider.searchHistoryList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                exploreScreenProvider.onSearchWisataSubmit();
                exploreScreenProvider.searchWisataController.text = exploreScreenProvider.searchHistoryList[index].query;
                exploreScreenProvider.getWisataDataBySearch(
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
        );
      }
    );
  }
}