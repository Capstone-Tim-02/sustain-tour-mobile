import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/components/booking_result_screen/booking_result_provider.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class FailedBookingScreen extends StatelessWidget {
  const FailedBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BookingResultProvider bookingResultProvider = Provider.of(context, listen: false);
    return Column(
      children: [
        const SizedBox(height: 75),
        const Icon(
          Icons.dangerous, size: 100,
          color: ColorThemeStyle.red,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            "Booking Gagal!",
            style: TextStyleWidget.headlineH3(
              color: ColorThemeStyle.black100,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Pesanan tiket gagal, harap mengulangi langkah sebelumnya",
            style: TextStyleWidget.titleT2(
              color: ColorThemeStyle.grey100,
              fontWeight: FontWeight.w400
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            bookingResultProvider.errorMessage,
            style: TextStyleWidget.titleT2(
              color: ColorThemeStyle.red,
              fontWeight: FontWeight.w400
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}