import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/checkout_provider.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/use_promo_screen/components/promo_components/available_promo_list_screen.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/use_promo_screen/components/promo_components/promo_error_screen.dart';

class AvailablePromoScreen extends StatelessWidget {
  const AvailablePromoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CheckoutProvider>(
      builder: (context, checkoutProvider, child) {
        return checkoutProvider.isLoadingPromo
        ? const Center(child: CircularProgressIndicator())
        : checkoutProvider.isGetPromoSuccess
          ? const AvailablePromoListScreen()
          : const PromoErrorScreen();
      },
    );
  }
}