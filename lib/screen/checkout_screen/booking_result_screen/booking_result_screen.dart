import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/constants/routes.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/booking_result_screen/booking_result_provider.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/booking_result_screen/components/failed_booking_screen.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/booking_result_screen/components/success_booking_screen.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/profile_emission_component/component/detail_emission_screen_component/component/travel_history_component/travel_history_provider.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
import 'package:sustain_tour_mobile/widget/bottom_navbar_widget/bottom_navbar_widget_provider.dart';

class BookingResultScreen extends StatelessWidget {
  const BookingResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TravelHistoryProvider travelHistoryProvider = Provider.of<TravelHistoryProvider>(context, listen: false);
    BottomNavigationBarProvider bottomNavigationBarProvider = Provider.of<BottomNavigationBarProvider>(context, listen: false);

    return Consumer<BookingResultProvider>(
      builder: (context, bookingResultProvider, child) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
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
                      bottomNavigationBarProvider.onChangeIndex(0);
                      travelHistoryProvider.getBookingHistory();
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
            backgroundColor: Colors.white,
            body: bookingResultProvider.isLoading
              ? const Center(child: CircularProgressIndicator())
              : bookingResultProvider.isPostBookingSuccess
                ? const SuccessBookingScreen()
                : const FailedBookingScreen()
          ),
        );
      }
    );
  }
}