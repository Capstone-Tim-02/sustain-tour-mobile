import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/models/checkout_models/checkout_argument_models.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/components/booking_button_component.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/components/order_info_component/order_info_component.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/components/poin_info_component.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/components/promo_info_component.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/components/wisata_info_component/wisata_info_component.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/components/selected_date_component.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments =
        (ModalRoute.of(context)?.settings.arguments) as CheckoutArgumentModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: TextStyleWidget.titleT2(
            fontWeight: FontWeightStyle.semiBold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectedDateComponent(selectedDate: arguments.checkinDate),
              WisataInfoComponent(selectedWisata: arguments.wisata),
              const PromoInfoComponent(),
              const PoinInfoComponent(),
              OrderInfoComponent(selectedWisata: arguments.wisata),
              BookingButtonComponent(
                  wisataId: arguments.wisata.id,
                  checkinBooking: arguments.checkinDate)
            ],
          ),
        ),
      ),
    );
  }
}
