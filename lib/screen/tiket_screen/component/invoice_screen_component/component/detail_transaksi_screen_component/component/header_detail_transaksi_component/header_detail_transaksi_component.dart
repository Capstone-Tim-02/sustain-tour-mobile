import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/constants/date_format_const.dart';
import 'package:sustain_tour_mobile/models/booking_models/booking_history_model.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class HeaderDetailTransaksiComponent extends StatelessWidget {
  final TicketData tiketData;
  const HeaderDetailTransaksiComponent({super.key, required this.tiketData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        color: ColorThemeStyle.blue100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Invoice ID kamu',
                style: TextStyleWidget.titleT3(
                  fontWeight: FontWeightStyle.medium,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  tiketData.invoiceNumber,
                  style: TextStyleWidget.headlineH5(
                    fontWeight: FontWeightStyle.semiBold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: 4,
            height: 27,
            // margin: const EdgeInsets.only(left: 16),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Berlaku pada',
                style: TextStyleWidget.titleT3(
                  fontWeight: FontWeightStyle.medium,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  DateFormatConst.dateToTanggalHalfBulanTahunFormatNoKoma
                      .format(tiketData.checkinBooking),
                  style: TextStyleWidget.headlineH4(
                    fontWeight: FontWeightStyle.semiBold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
