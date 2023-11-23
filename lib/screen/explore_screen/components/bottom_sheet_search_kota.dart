import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/screen/explore_screen/explore_screen_provider.dart';
import 'package:sustain_tour_mobile/screen/login_screen/login_provider.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
import 'package:sustain_tour_mobile/widget/badge_widget.dart';
import 'package:sustain_tour_mobile/widget/search_widget.dart';

void bottomSheetSearchKota(BuildContext context){
  ExploreScreenProvider exploreScreenProvider = Provider.of<ExploreScreenProvider>(context, listen: false);
  LoginProvider loginProvider = Provider.of<LoginProvider>(context, listen: false);
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
                exploreScreenProvider.searchKota(query: exploreScreenProvider.searchKotaController.text);
              },
              controller: exploreScreenProvider.searchKotaController,
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
}