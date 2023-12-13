import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/constants/custom_icons.dart';
import 'package:sustain_tour_mobile/screen/explore_screen/components/bottom_sheet_search_kota.dart';
import 'package:sustain_tour_mobile/screen/explore_screen/explore_screen_provider.dart';
import 'package:sustain_tour_mobile/screen/login_screen/login_provider.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
import 'package:sustain_tour_mobile/widget/search_widget.dart';

class SearchWisata extends StatelessWidget {
  const SearchWisata({super.key});

  @override
  Widget build(BuildContext context) {
    ExploreScreenProvider exploreScreenProvider = Provider.of<ExploreScreenProvider>(context, listen: false);
    LoginProvider loginProvider = Provider.of<LoginProvider>(context, listen: false);
    FocusNode focusNode = FocusNode();
    return Padding(
      padding: const EdgeInsets.only(bottom: 16,left: 16,right: 16,top:3),
      child: SearchWidget(
        style: TextStyleWidget.titleT2(
          color: ColorThemeStyle.grey100
        ),
        focusNode: focusNode,
        onSubmit: (value){
          exploreScreenProvider.onSearchWisataSubmit();
          exploreScreenProvider.addSearchHistory(
            userId: loginProvider.userId?.toInt() ?? 0,
            query: exploreScreenProvider.searchWisataController.text
          );
          exploreScreenProvider.getWisataDataBySearch(
            searchQuery: exploreScreenProvider.searchWisataController.text
          );
          focusNode.unfocus();
        },
        onTap: (){
          exploreScreenProvider.onSearchWisataTap();
        },
        label: "Search",
        controller: exploreScreenProvider.searchWisataController,
        prefixIcon: const Padding(
          padding: EdgeInsets.only(left: 8),
          child: Icon(
            CustomIcons.search,
            size: 24,
          ),
        ),
        suffixIcon: Consumer<ExploreScreenProvider>(
          builder: (context, exploreScreenProvider, child) {
            return exploreScreenProvider.showSearchPage
            ? Padding(
                padding: const EdgeInsets.all(16),
                child: InkWell(
                  onTap: (){
                    exploreScreenProvider.onSearchWisataClear();
                    exploreScreenProvider.searchWisataController.clear();
                    exploreScreenProvider.getWisataInit();
                    focusNode.unfocus();
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
                    bottomSheetSearchKota(context);
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
    );
  }
}