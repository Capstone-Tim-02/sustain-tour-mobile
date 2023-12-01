import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/models/api/booking_api.dart';
import 'package:sustain_tour_mobile/models/booking_models/booking_history_model.dart';

class TravelHistoryProvider extends ChangeNotifier {
  late BookingHistoryModel _bookingHistoryModel;
  BookingHistoryModel get bookingHistoryModel => _bookingHistoryModel;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  Future<void> getBookingHistory({required String token}) async {
    _isLoading = true;
    notifyListeners();
    _bookingHistoryModel =
        await BookingApi.getBookingHistory(token: token);
    _isLoading = false;
    notifyListeners();
  }
}
