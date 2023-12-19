import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/checkout_provider.dart';

class MorePromoUse extends StatelessWidget {
  const MorePromoUse({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CheckoutProvider>(
      builder: (context, checkoutProvider, child) {
        return checkoutProvider.hasMorePromo
          ? checkoutProvider.isLoadingPromo
            ? const Padding(
                padding: EdgeInsets.all(30),
                child: Center(child: CircularProgressIndicator()),
              )
            : const SizedBox(height: 40)
          : const SizedBox(height: 40);
      }
    );
  }
}