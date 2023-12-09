import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/constants/date_format_const.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class SelectedDateComponent extends StatelessWidget {
  final DateTime selectedDate;

  const SelectedDateComponent({
    super.key,
    required this.selectedDate
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            "Tanggal kunjungan",
            style: TextStyleWidget.titleT2(
              color: ColorThemeStyle.grey100,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
        Text(
          DateFormatConst.dateToTanggalBulanTahunFormat.format(selectedDate).toString(),
          style: TextStyleWidget.headlineH3(
            color: ColorThemeStyle.black100,
            fontWeight: FontWeight.w600
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}