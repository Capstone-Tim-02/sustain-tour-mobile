import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/constants/currency_format_const.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/checkout_provider.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class PoinDiscountComponent extends StatelessWidget {
  final int userPoint;

  const PoinDiscountComponent({
    super.key,
    required this.userPoint
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CheckoutProvider>(
      builder:(context, checkoutProvider, child) {
        return checkoutProvider.isPointUsed
        ? Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Desti Point",
                  style: TextStyleWidget.bodyB3(
                    color: ColorThemeStyle.black100,
                    fontWeight: FontWeight.w500
                  ),
                ),
                Text(
                  "- ${CurrencyFormatConst.convertToIdr((userPoint * 1000),0)}",
                  style: TextStyleWidget.bodyB3(
                    color: ColorThemeStyle.black100,
                    fontWeight: FontWeight.w500
                  ),
                )
              ],
            ),
        )
        : const SizedBox();
      }
    );
  }
}