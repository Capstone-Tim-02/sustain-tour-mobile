import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/models/api/booking_history_api.dart';
import 'package:sustain_tour_mobile/models/booking_models/booking_history_model.dart';

class TravelHistoryProvider extends ChangeNotifier {
  late BookingHistoryModel _bookingHistoryModel;
  BookingHistoryModel get bookingHistoryModel => _bookingHistoryModel;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  String _messageErrorBatalkanPesanan = '';
  String get messageErrorBatalkanPesanan => _messageErrorBatalkanPesanan;

  void clearErrorMessage() {
    _messageErrorBatalkanPesanan = '';
  }

  Future<void> getBookingHistory() async {
    _isLoading = true;
    notifyListeners();
    _bookingHistoryModel = await BookingHistoryApi.getBookingHistory();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> batalkanPesanan({required String invoiceNumber}) async {
    bool isDoneBatalkanPesanan = false;
    try {
      isDoneBatalkanPesanan =
          await BookingHistoryApi.batalkanPesanan(invoiceNumber: invoiceNumber);

      if (isDoneBatalkanPesanan) {
        await getBookingHistory();
      }
    } catch (e) {
      _messageErrorBatalkanPesanan = e.toString();
    }
  }
}
