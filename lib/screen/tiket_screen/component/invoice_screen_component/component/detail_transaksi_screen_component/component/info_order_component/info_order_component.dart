import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/constants/currency_format_const.dart';
import 'package:sustain_tour_mobile/screen/tiket_screen/component/invoice_screen_component/component/detail_transaksi_screen_component/component/info_order_component/component/total_cost_component/total_cost_component.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class InfoOrderComponent extends StatelessWidget {
  final int subTotal;
  final int potonganPromo;
  final int potonganPoint;
  final int pointsEarned;
  final int totalCost;
  final String statusOrder;
  const InfoOrderComponent(
      {super.key,
      required this.subTotal,
      required this.potonganPromo,
      required this.potonganPoint,
      required this.pointsEarned,
      required this.totalCost,
      required this.statusOrder});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Order info',
          style: TextStyleWidget.titleT2(
            fontWeight: FontWeightStyle.semiBold,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Sub total',
              style: TextStyleWidget.bodyB3(
                fontWeight: FontWeightStyle.medium,
              ),
            ),
            Text(
              CurrencyFormatConst.convertToIdr(subTotal, 0),
              style: TextStyleWidget.bodyB3(
                fontWeight: FontWeightStyle.medium,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Promo',
              style: TextStyleWidget.bodyB3(
                fontWeight: FontWeightStyle.medium,
              ),
            ),
            Text(
              '- ${CurrencyFormatConst.convertToIdr(potonganPromo, 0)}',
              style: TextStyleWidget.bodyB3(
                fontWeight: FontWeightStyle.medium,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Desti Point',
              style: TextStyleWidget.bodyB3(
                fontWeight: FontWeightStyle.medium,
              ),
            ),
            Text(
              '- ${CurrencyFormatConst.convertToIdr(potonganPoint, 0)}',
              style: TextStyleWidget.bodyB3(
                fontWeight: FontWeightStyle.medium,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Point didapatkan',
              style: TextStyleWidget.bodyB3(
                fontWeight: FontWeightStyle.medium,
              ),
            ),
            Text(
              '$pointsEarned',
              style: TextStyleWidget.bodyB3(
                  fontWeight: FontWeightStyle.medium,
                  color: ColorThemeStyle.grey100),
            ),
          ],
        ),
        const SizedBox(
          height: 32,
        ),
        TotalCostComponent(statusOrder: statusOrder, totalCost: totalCost),
      ],
    );
  }
}
