import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/screen/promo_screen/promo_provider.dart';

class MorePromoDetail extends StatelessWidget {
  const MorePromoDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PromoProvider>(
      builder: (context, promoProvider, child) {
        return promoProvider.hasMorePromo
          ? promoProvider.isLoadingPromo
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