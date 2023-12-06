import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/profile_emission_component/component/detail_emission_screen_component/component/travel_history_component/component/travel_history_list_component/travel_history_list_component.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class TravelHistoryComponent extends StatelessWidget {
  const TravelHistoryComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Riwayat Kunjungan',
              style: TextStyleWidget.titleT2(
                fontWeight: FontWeightStyle.semiBold,
              ),
            ),
          ),
          const TravelHistoryListComponent(),
        ],
      ),
    );
  }
}
