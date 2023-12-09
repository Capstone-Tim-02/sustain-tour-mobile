import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/constants/routes.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/booking_result_screen/booking_result_provider.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/checkout_provider.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
import 'package:sustain_tour_mobile/widget/button_widget.dart';

class BookingButtonComponent extends StatelessWidget {
  final int wisataId;
  final DateTime checkinBooking;

  const BookingButtonComponent({
    super.key,
    required this.wisataId,
    required this.checkinBooking
  });

  @override
  Widget build(BuildContext context) {
    CheckoutProvider checkoutProvider = Provider.of<CheckoutProvider>(context, listen: false);
    BookingResultProvider bookingResultProvider = Provider.of<BookingResultProvider>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ButtonWidget.defaultContainer(
          text: "Booking Sekarang",
          textstyle: TextStyleWidget.headlineH3(
            color: ColorThemeStyle.white100,
            fontWeight: FontWeight.w600
          ),
          onPressed: (){
            checkoutProvider.onBooking(
              wisataId: wisataId,
              checkinBooking: checkinBooking
            );
            bookingResultProvider.bookingResultProviderReset();
            bookingResultProvider.bookingRequest(requestBody: checkoutProvider.requestBodyModel!);
            Navigator.pushNamed(
              context,
              Routes.bookingResultScreen,
            );
          }
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}