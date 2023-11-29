import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/constants/currency_format_const.dart';
import 'package:sustain_tour_mobile/screen/tiket_screen/component/invoice_screen_component/component/step_payment_bottom_sheet_component/step_payment_bottom_sheet_component.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
import 'package:sustain_tour_mobile/widget/badge_widget.dart';

class TotalCostComponent extends StatelessWidget {
  final String statusOrder;
  final int totalCost;
  const TotalCostComponent(
      {super.key, required this.statusOrder, required this.totalCost});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 32),
          decoration: BoxDecoration(
            color: statusOrder == 'dibatalkan'
                ? ColorThemeStyle.grey100
                : ColorThemeStyle.blue100,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                'Total Pembayaran',
                style: TextStyleWidget.titleT2(
                  fontWeight: FontWeightStyle.semiBold,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: (statusOrder == 'pending') ? 16 : 8,
              ),
              Text(
                CurrencyFormatConst.convertToIdr(totalCost, 0),
                style: TextStyleWidget.headlineH3(
                  fontWeight: FontWeightStyle.semiBold,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: statusOrder != 'pending' ? 24 : 20,
              ),
              (statusOrder != 'pending')
                  ? BadgeWidget.outline(
                      label: 'Pesan Ulang',
                      fontWeight: FontWeightStyle.semiBold,
                      borderColor: Colors.white,
                      onPressedBorderColor: ColorThemeStyle.blue40,
                      width: double.infinity,
                      backgroundColor: Colors.white,
                      onPressed: () {},
                    )
                  : const SizedBox(),
              SizedBox(
                height: statusOrder != 'pending' ? 24 : 0,
              ),
            ],
          ),
        ),
        if (statusOrder == 'pending')
          Padding(
            padding: const EdgeInsets.only(
              top: 16,
              bottom: 34,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Bagaimana cara membayar? ',
                  style: TextStyleWidget.bodyB3(
                    fontWeight: FontWeightStyle.medium,
                  ),
                ),
                GestureDetector(
                  onTap: () =>
                      StepPaymentBottomSheetComponent.buildBottomSheetSteps(
                          context),
                  child: Text(
                    'Klik disini',
                    style: TextStyleWidget.bodyB3(
                      fontWeight: FontWeightStyle.semiBold,
                      color: ColorThemeStyle.blue100,
                    ),
                  ),
                ),
              ],
            ),
          )
      ],
    );
  }
}
