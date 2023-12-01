import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/models/api/booking_api.dart';
import 'package:sustain_tour_mobile/models/booking_models/booking_request_body_models.dart';
import 'package:sustain_tour_mobile/models/booking_models/booking_response_models.dart';

class BookingResultProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isPostBookingSuccess = false;
  bool get isPostBookingSuccess => _isPostBookingSuccess;

  BookingResponseModel? _responseModel;
  BookingResponseModel? get responseModel => _responseModel;

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
      _isLoading = false;
      _isPostBookingSuccess = false;
      notifyListeners();
      throw Exception(e);
    }
  }

  void bookingResultProviderReset(){
    _isLoading = false;
    _isPostBookingSuccess = false;
  }
}