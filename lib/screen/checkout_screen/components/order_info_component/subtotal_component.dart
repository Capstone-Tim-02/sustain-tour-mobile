import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/constants/currency_format_const.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/checkout_provider.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class SubtotalComponent extends StatelessWidget {
  final int price;

  const SubtotalComponent({
    super.key,
    required this.price
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CheckoutProvider>(
      builder:(context, checkoutProvider, child) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Sub total",
                style: TextStyleWidget.bodyB3(
                  color: ColorThemeStyle.black100,
                  fontWeight: FontWeight.w500
                ),
              ),
              Text(
                CurrencyFormatConst.convertToIdr((checkoutProvider.quantity * price),0),
                style: TextStyleWidget.bodyB3(
                  color: ColorThemeStyle.black100,
                  fontWeight: FontWeight.w500
                ),
              )
            ],
          ),
        );
      }
    );
  }
}