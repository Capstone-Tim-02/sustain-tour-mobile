import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/components/booking_result_screen/booking_result_provider.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class SuccessBookingScreen extends StatelessWidget {
  const SuccessBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BookingResultProvider bookingResultProvider = Provider.of(context, listen: false);
    return Column(
      children: [
        const SizedBox(height: 75,),
        Image.asset(Assets.assetsImagesSelesaiPutih),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            "Berhasil!",
            style: TextStyleWidget.headlineH3(
              color: ColorThemeStyle.black100,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Pesanan tiket sukses! Persiapkan diri kamu untuk petualangan yang mengesankan.",
            style: TextStyleWidget.titleT2(
              color: ColorThemeStyle.grey100,
              fontWeight: FontWeight.w300
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 32),
        GestureDetector(
          onTap: (){
            //TODO Navigasi ke halaman detail transaksi
            
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Rincian transaksi",
                style: TextStyleWidget.bodyB2(
                  color: ColorThemeStyle.blue80,
                  fontWeight: FontWeight.w400
                ),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.arrow_forward,
                size: 16,
                color: ColorThemeStyle.blue80,
              ),
            ],
          ),
        ),
      ],
    );
  }
}