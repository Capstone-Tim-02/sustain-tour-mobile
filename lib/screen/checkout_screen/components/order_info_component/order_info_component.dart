import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/models/wisata_models/wisata_models.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/components/order_info_component/poin_discount_component.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/components/order_info_component/promo_discount_component.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/components/order_info_component/subtotal_component.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/components/order_info_component/total_price_component.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/profile_provider.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class OrderInfoComponent extends StatelessWidget {
  final Wisata selectedWisata;

  const OrderInfoComponent({
    super.key,
    required this.selectedWisata
  });

  @override
  Widget build(BuildContext context) {
    ProfileProvider profileProvider = Provider.of<ProfileProvider>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Order Info",
          style: TextStyleWidget.titleT2(
            color: ColorThemeStyle.black100,
            fontWeight: FontWeight.w600
          ),
        ),
        const SizedBox(height: 16),
        SubtotalComponent(price: selectedWisata.price),
        PromoDiscountComponent(price: selectedWisata.price),
        PoinDiscountComponent(userPoint: profileProvider.user.points),
        TotalPriceComponent(
          price: selectedWisata.price,
          userPoint: profileProvider.user.points,
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}