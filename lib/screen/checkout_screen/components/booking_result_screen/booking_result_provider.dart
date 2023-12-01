import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/models/api/booking_api.dart';
import 'package:sustain_tour_mobile/models/booking_models/booking_history_model.dart';
import 'package:sustain_tour_mobile/models/booking_models/booking_request_body_models.dart';
import 'package:sustain_tour_mobile/models/booking_models/booking_response_models.dart';

class BookingResultProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isPostBookingSuccess = false;
  bool get isPostBookingSuccess => _isPostBookingSuccess;

  BookingResponseModel? _responseModel;
  BookingResponseModel? get responseModel => _responseModel;

  BookingHistoryModel? _bookingModel;
  BookingHistoryModel? get bookingModel => _bookingModel;

  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  void bookingRequest({
    required BookingRequestBodyModel requestBody,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      _responseModel = await BookingApi.postBookingRequest(requestBody: requestBody);

      _isLoading = false;
      _isPostBookingSuccess = true;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString().replaceAll("{code: 400, message: ","").replaceAll("}", "");
      _isLoading = false;
      _isPostBookingSuccess = false;
      notifyListeners();
      throw Exception(e);
    }
  }

  Future<void> getBookingDetail() async {
    _isLoading = true;
    notifyListeners();
    _bookingModel = await BookingApi.getBookingByInvoice(invoiceNumber: _responseModel?.data.invoiceNumber ?? "");
    _isLoading = false;
    notifyListeners();
  }

  void bookingResultProviderReset(){
    _isLoading = false;
    _isPostBookingSuccess = false;
    _responseModel = null;
    _bookingModel = null;
    _errorMessage = "";
  }
}