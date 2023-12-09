import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/use_promo_screen/components/available_promo_component.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/use_promo_screen/components/promo_components/available_promo_screen.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/use_promo_screen/components/use_promo_textfield_component.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class UsePromoScreen extends StatelessWidget {
  const UsePromoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text(
          'Pilih Promo',
          style: TextStyleWidget.titleT2(
            fontWeight: FontWeightStyle.semiBold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 28),
              UsePromoTextfieldComponent(),
              SizedBox(height: 32),
              AvailablePromoHeaderComponent(),
              SizedBox(height: 8),
              AvailablePromoScreen(),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}