import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/profile_emission_component/component/detail_emission_screen_component/component/travel_history_component/travel_history_provider.dart';
import 'package:sustain_tour_mobile/screen/tiket_screen/component/dipesan_component/dipesan_component.dart';
import 'package:sustain_tour_mobile/screen/tiket_screen/component/riwayat_component/riwayat_component.dart';
import 'package:sustain_tour_mobile/screen/tiket_screen/tiket_provider.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class TiketScreen extends StatelessWidget {
  const TiketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TravelHistoryProvider>(
        builder: (context, travelProvider, child) {
      if (travelProvider.isLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (!travelProvider.isLoading) {
        if (travelProvider.bookingHistoryModel.ticketData == null) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Assets.assetsImagesNotFoundWisata),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Upss maaf, anda tidak memiliki transaksi untuk saat ini',
                    textAlign: TextAlign.center,
                    style: TextStyleWidget.bodyB2(
                      color: ColorThemeStyle.grey100,
                      fontWeight: FontWeightStyle.medium,
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return DefaultTabController(
            initialIndex:
                Provider.of<TiketProvider>(context, listen: false).tabIndex,
            length: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Column(
                children: [
                  TabBar(
                    onTap: (index) {
                      Provider.of<TiketProvider>(context, listen: false)
                          .setTabIndex(index: index);
                    },
                    unselectedLabelColor: Colors.black,
                    labelStyle: TextStyleWidget.titleT2(
                      fontWeight: FontWeightStyle.semiBold,
                    ),
                    labelColor: ColorThemeStyle.blue100,
                    tabs: const [
                      Tab(
                        text: 'Dipesan',
                      ),
                      Tab(
                        text: 'Riwayat',
                      ),
                    ],
                  ),
                  Consumer<TiketProvider>(
                      builder: (context, tiketProvider, child) {
                    if (tiketProvider.tabIndex == 0) {
                      return const DipesanComponent();
                    } else if (tiketProvider.tabIndex == 1) {
                      return const RiwayatComponent();
                    } else {
                      return const SizedBox();
                    }
                  })
                ],
              ),
            ),
          );
        }
      } else {
        return const SizedBox();
      }
    });
  }
}
