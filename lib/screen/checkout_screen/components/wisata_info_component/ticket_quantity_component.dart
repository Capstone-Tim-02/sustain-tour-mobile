import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/constants/currency_format_const.dart';
import 'package:sustain_tour_mobile/models/detail_wisata_byid_models/detail_wisata_byid_models.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/checkout_provider.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class TicketQuantityComponent extends StatelessWidget {
  final WisataDetail selectedWisata;

  const TicketQuantityComponent({super.key, required this.selectedWisata});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.65,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Consumer<CheckoutProvider>(
          builder: (context, checkoutProvider, child) {
            return Row(
              children: [
                InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () {
                    checkoutProvider.decrementQuantity();
                  },
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: checkoutProvider.quantity == 1
                            ? ColorThemeStyle.grey100
                            : ColorThemeStyle.blue100),
                    child: const Icon(Icons.remove,
                        size: 20, color: ColorThemeStyle.white100),
                  ),
                ),
                SizedBox(
                    width: 50,
                    child: Text(
                      checkoutProvider.quantity.toString(),
                      style: TextStyleWidget.bodyB3(
                          color: ColorThemeStyle.black100,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    )),
                InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () {
                    checkoutProvider.incrementQuantity();
                  },
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: ColorThemeStyle.blue100),
                    child: const Icon(Icons.add,
                        size: 19, color: ColorThemeStyle.white100),
                  ),
                ),
              ],
            );
          },
        ),
        Text(
          CurrencyFormatConst.convertToIdr(selectedWisata.price.toDouble(), 0),
          style: TextStyleWidget.titleT2(
              color: ColorThemeStyle.black100, fontWeight: FontWeight.w600),
        )
      ]),
    );
  }
}
