import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/checkout_provider.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/use_promo_screen/components/available_promo_component.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/use_promo_screen/components/promo_components/available_promo_screen.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/use_promo_screen/components/promo_components/more_promo_use.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/use_promo_screen/components/use_promo_textfield_component.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class UsePromoScreen extends StatelessWidget {
  const UsePromoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutProvider checkoutProvider = Provider.of<CheckoutProvider>(context, listen: false);
    final ScrollController scrollController = ScrollController();

    void onScroll() async {
      double maxScroll = scrollController.position.maxScrollExtent;
      double currentScroll = scrollController.position.pixels;

      if(currentScroll >= maxScroll && checkoutProvider.hasMorePromo && (checkoutProvider.isLoadingPromo == false)){
        await checkoutProvider.getUserPromo();
      }
    }
    scrollController.addListener(onScroll);

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
      body: Consumer<CheckoutProvider>(
        builder: (context,checkoutProvider, child) {
          return SingleChildScrollView(
            controller: scrollController,
            child: const Padding(
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
                  MorePromoUse(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}