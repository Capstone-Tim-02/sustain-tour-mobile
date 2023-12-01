import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class FailedBookingScreen extends StatelessWidget {
  const FailedBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 75),
        const Icon(Icons.dangerous, size: 50),
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
            "Pesanan tiket Gagal, harap mengulangi langkah sebelumnya",
            style: TextStyleWidget.titleT2(
              color: ColorThemeStyle.grey100,
              fontWeight: FontWeight.w300
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}