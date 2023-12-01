import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/constants/routes.dart';

import 'package:sustain_tour_mobile/models/booking_models/booking_history_model.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/profile_emission_component/component/detail_emission_screen_component/component/travel_history_component/travel_history_provider.dart';
import 'package:sustain_tour_mobile/screen/tiket_screen/component/tiket_card_component_widget/tiket_card_component_widget.dart';

class DipesanComponent extends StatelessWidget {
  const DipesanComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.only(top: 16),
            sliver: Consumer<TravelHistoryProvider>(
                builder: (context, travelProvider, child) {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    TicketData tiket = travelProvider
                            .bookingHistoryModel.ticketData![
                        travelProvider.bookingHistoryModel.ticketData!.length -
                            1 -
                            index];

                    if (tiket.statusOrder == 'pending') {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: TiketCardComponentWidget(
                          invoiceNumber: tiket.invoiceNumber,
                          photoWisataUrl: tiket.photoWisata1,
                          namaWisata: tiket.wisataName,
                          tanggalBooking: tiket.checkinBooking,
                          totalCost: tiket.totalCost,
                          pointsEarned: tiket.pointsEarned,
                          status: 'Dipesan',
                          onTapCard: () {
                            Navigator.pushNamed(context, Routes.invoiceScreen,
                                arguments: tiket);
                          },
                        ),
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                  childCount:
                      travelProvider.bookingHistoryModel.ticketData!.length,
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
