import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/checkout_provider.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
import 'package:sustain_tour_mobile/widget/badge_widget.dart';

class PromoErrorScreen extends StatelessWidget {
  const PromoErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutProvider checkoutProvider = Provider.of<CheckoutProvider>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        Text(
          "Terjadi kesalahan!",
          style: TextStyleWidget.titleT2(
              fontWeight: FontWeight.w700,
              color: ColorThemeStyle.red),
        ),
        const SizedBox(height: 16),
        BadgeWidget.container(
          onPressed: () {
            checkoutProvider.getUserPromo();
          },
          label: "Muat ulang")
      ],
    );
  }
}