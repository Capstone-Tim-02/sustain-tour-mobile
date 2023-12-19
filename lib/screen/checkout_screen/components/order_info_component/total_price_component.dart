import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/constants/currency_format_const.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/checkout_provider.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class TotalPriceComponent extends StatelessWidget {
  final int price;
  final int userPoint;


  const TotalPriceComponent({
    super.key,
    required this.price,
    required this.userPoint
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CheckoutProvider>(
      builder: (context, checkoutProvider, child) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: TextStyleWidget.bodyB3(
                  color: ColorThemeStyle.black100,
                  fontWeight: FontWeight.w500
                ),
              ),
              Text(
                CurrencyFormatConst.convertToIdr(
                  max((
                    (checkoutProvider.quantity * price) -
                    ((checkoutProvider.discountPercentage / 100) * price * checkoutProvider.quantity) -
                    (checkoutProvider.isPointUsed ? (userPoint * 1000) : 0)
                  ),0),
                  0
                ),
                style: TextStyleWidget.bodyB1(
                  color: ColorThemeStyle.blue100,
                  fontWeight: FontWeight.w600
                ),
              )
            ],
          ),
        );
      }
    );
  }
}