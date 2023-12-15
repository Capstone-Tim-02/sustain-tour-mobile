import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/constants/routes.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/booking_result_screen/booking_result_provider.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/checkout_provider.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
import 'package:sustain_tour_mobile/utils/geolocator_helper.dart';
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
    return Consumer<CheckoutProvider>(
      builder: (context, value, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            checkoutProvider.isLoadingBooking
            ?  const Center(child: CircularProgressIndicator())
            : ButtonWidget.defaultContainer(
              text: "Booking Sekarang",
              textstyle: TextStyleWidget.headlineH3(
                color: ColorThemeStyle.white100,
                fontWeight: FontWeight.w600
              ),
              onPressed: () async {
                // minta izin lokasi
                bool isLocationPermissionGranted = await GeolocatorHelper.handleLocationPermission(isOpenAppSettingIfDeniedForever: true, context : context);

                // jika izin diberikan maka tembak api update lokasi user
                if (isLocationPermissionGranted) {
                  if (!context.mounted) return;
                  await checkoutProvider.onBooking(
                    wisataId: wisataId,
                    checkinBooking: checkinBooking,
                    context: context
                  );

                  if (!context.mounted) return;
                  bookingResultProvider.bookingResultProviderReset();
                  bookingResultProvider.bookingRequest(requestBody: checkoutProvider.requestBodyModel!);

                  Navigator.pushNamed(
                    context,
                    Routes.bookingResultScreen,
                  );
                }
              }
            ),
            const SizedBox(height: 50),
          ],
        );
      },
    );
  }
}