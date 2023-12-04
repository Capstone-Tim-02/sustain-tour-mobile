import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class StatusPesananComponent extends StatelessWidget {
  final String statusOrder;
  const StatusPesananComponent({super.key, required this.statusOrder});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Detail Pesanan',
          style: TextStyleWidget.titleT2(
            fontWeight: FontWeightStyle.semiBold,
          ),
        ),
        (statusOrder == 'pending')
            ? Row(
                children: [
                  Text(
                    'Dipesan',
                    style: TextStyleWidget.titleT3(
                      fontWeight: FontWeightStyle.medium,
                      color: ColorThemeStyle.blue100,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Icon(
                    Icons.access_time,
                    color: ColorThemeStyle.blue100,
                    size: 18,
                  )
                ],
              )
            : (statusOrder == 'success')
                ? Row(
                    children: [
                      Text(
                        'Selesai digunakan',
                        style: TextStyleWidget.titleT3(
                          fontWeight: FontWeightStyle.medium,
                          color: ColorThemeStyle.green100,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Icon(
                        Icons.check,
                        color: ColorThemeStyle.green100,
                        size: 18,
                      )
                    ],
                  )
                : Row(
                    children: [
                      Text(
                        'Dibatalkan',
                        style: TextStyleWidget.titleT3(
                          fontWeight: FontWeightStyle.medium,
                          color: ColorThemeStyle.red,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Icon(
                        Icons.close,
                        color: ColorThemeStyle.red,
                        size: 18,
                      )
                    ],
                  ),
      ],
    );
  }
}
