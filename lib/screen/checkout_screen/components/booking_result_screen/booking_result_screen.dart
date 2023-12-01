import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/models/booking_models/booking_request_body_models.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/components/booking_result_screen/booking_result_provider.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/components/booking_result_screen/components/failed_booking_screen.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/components/booking_result_screen/components/success_booking_screen.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class BookingResultScreen extends StatelessWidget {
  const BookingResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final requestBody = (ModalRoute.of(context)?.settings.arguments) as BookingRequestBodyModel;
    BookingResultProvider bookingResultProvider = Provider.of(context, listen: false);
    bookingResultProvider.bookingResultProviderReset();
    bookingResultProvider.bookingRequest(requestBody: requestBody);
    return Scaffold(
      appBar:  AppBar(
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
      body: Consumer<BookingResultProvider>(
        builder: (context, bookingResultProvider, child) {
          return bookingResultProvider.isLoading
            ? const Center(child: CircularProgressIndicator())
            : bookingResultProvider.isPostBookingSuccess
              ? const SuccessBookingScreen()
              : const FailedBookingScreen();
        }
      )
    );
  }
}