import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/checkout_provider.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
import 'package:sustain_tour_mobile/widget/snack_bar_widget.dart';

class AvailablePromoHeaderComponent extends StatelessWidget {
  const AvailablePromoHeaderComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CheckoutProvider>(
      builder:(context, checkoutProvider, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              checkoutProvider.isPromoUsed ? "Promo bisa dipakai" : "Promo tersedia",
              style: TextStyleWidget.titleT2(
                color: ColorThemeStyle.black100,
                fontWeight: FontWeight.w600
              ),
            ),
            checkoutProvider.isPromoUsed
            ? GestureDetector(
                onTap: (){
                  checkoutProvider.onCancelPromo();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBarWidget.snackBarWidget(
                      message: "Kode promo batal digunakan",
                      backgroundColor: ColorThemeStyle.red,
                      duration: const Duration(seconds: 2)
                    )
                  );
                },
                child: Text(
                  "Batalkan promo",
                  style: TextStyleWidget.titleT3(
                    color: ColorThemeStyle.red,
                    fontWeight: FontWeight.w500
                  ),
                )
              )
            : const SizedBox()
          ],
        );
      }
    );
  }
}