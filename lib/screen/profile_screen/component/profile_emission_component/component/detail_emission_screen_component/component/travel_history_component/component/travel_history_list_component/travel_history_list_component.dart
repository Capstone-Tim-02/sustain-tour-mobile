import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/models/booking_history_model/booking_history_model.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/profile_emission_component/component/detail_emission_screen_component/component/travel_history_component/travel_history_provider.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class TravelHistoryListComponent extends StatelessWidget {
  const TravelHistoryListComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TravelHistoryProvider>(
        builder: (context, bookingHistoryProvider, child) {
      List<TicketData> ticketDataList =
          bookingHistoryProvider.bookingHistoryModel.ticketData;
      if (bookingHistoryProvider.isLoading) {
        return const Expanded(
            child: Center(
          child: CircularProgressIndicator(),
        ));
      }

      return Expanded(
        child: ListView.builder(
            itemCount: ticketDataList.length,
            itemBuilder: (context, index) {
              final TicketData ticket = ticketDataList[index];

              if (ticket.statusOrder == 'success') {
                return Container(
                  height: 81,
                  width: double.infinity,
                  margin: const EdgeInsets.only(
                    bottom: 16,
                    right: 16,
                    left: 16,
                  ),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.1),
                        )
                      ]),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 82,
                            height: 65,
                            decoration: const BoxDecoration(
                                color: ColorThemeStyle.lightPurple,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              child: Image.network(
                                ticket.photoWisata1,
                                fit: BoxFit.fill,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.network(
                                    ticket.photoWisata2,
                                    fit: BoxFit.fill,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Image.network(
                                        ticket.photoWisata3,
                                        fit: BoxFit.fill,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                const Center(
                                                    child: Icon(
                                          Icons.image_not_supported_outlined,
                                          // size: 50,
                                        )),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 21,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FittedBox(
                                  child: Text(
                                    ticket.wisataName,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyleWidget.titleT2(
                                      fontWeight: FontWeightStyle.semiBold,
                                    ),
                                  ),
                                ),
                                Text(
                                  ticket.kotaWisata,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyleWidget.bodyB3(
                                    color: ColorThemeStyle.grey100,
                                    fontWeight: FontWeightStyle.medium,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            ticket.carboonFootprint.toStringAsFixed(0),
                            style: TextStyleWidget.headlineH3(
                              fontWeight: FontWeightStyle.semiBold,
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 6.0),
                            child: Text(
                              'CO2',
                              style: TextStyleWidget.bodyB2(
                                fontWeight: FontWeightStyle.semiBold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              } else {
                return const SizedBox();
              }
            }),
      );
    });
  }
}
