import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/constants/routes.dart';
import 'package:sustain_tour_mobile/models/booking_models/booking_request_body_models.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/components/booking_result_screen/booking_result_provider.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/components/booking_result_screen/components/failed_booking_screen.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/components/booking_result_screen/components/success_booking_screen.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/profile_emission_component/component/detail_emission_screen_component/component/travel_history_component/travel_history_provider.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
import 'package:sustain_tour_mobile/widget/bottom_navbar_widget/bottom_navbar_widget_provider.dart';

class BookingResultScreen extends StatelessWidget {
  const BookingResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final requestBody = (ModalRoute.of(context)?.settings.arguments) as BookingRequestBodyModel;

    BookingResultProvider bookingResultProvider = Provider.of<BookingResultProvider>(context, listen: false);
    TravelHistoryProvider travelHistoryProvider = Provider.of<TravelHistoryProvider>(context, listen: false);
    BottomNavigationBarProvider bottomNavigationBarProvider = Provider.of<BottomNavigationBarProvider>(context, listen: false);

    bookingResultProvider.bookingResultProviderReset();
    bookingResultProvider.bookingRequest(requestBody: requestBody);

    return Consumer<BookingResultProvider>(
      builder: (context, bookingResultProvider, child) {
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
            leading: bookingResultProvider.isPostBookingSuccess
              ? IconButton(
                  onPressed:(){
                    travelHistoryProvider.getBookingHistory();
                    bottomNavigationBarProvider.onChangeIndex(0);
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routes.mainScreen,
                      (route) => false,
                    );
                  },
                  icon: const Icon(Icons.arrow_back)
                )
              : IconButton(
                  onPressed:(){
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back)
                )
          ),
          body: bookingResultProvider.isLoading
            ? const Center(child: CircularProgressIndicator())
            : bookingResultProvider.isPostBookingSuccess
              ? const SuccessBookingScreen()
              : const FailedBookingScreen()
        );
      }
    );
  }
}