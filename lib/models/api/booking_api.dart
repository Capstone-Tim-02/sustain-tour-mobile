import 'package:dio/dio.dart';
import 'package:sustain_tour_mobile/constants/api_base_url.dart';
import 'package:sustain_tour_mobile/constants/shared_preference_manager.dart';
import 'package:sustain_tour_mobile/models/booking_models/booking_history_model.dart';
import 'package:sustain_tour_mobile/models/booking_models/booking_request_body_models.dart';
import 'package:sustain_tour_mobile/models/booking_models/booking_response_models.dart';

class BookingApi {
  static Future<BookingHistoryModel> getBookingHistory(
      {required String token}) async {
    BookingHistoryModel bookingHistoryModel = BookingHistoryModel(
      code: 0,
      error: true,
      message: '',
      ticketData: [],
    );

    try {
      final response = await Dio().get(
        '$baseUrl/user/wisata',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      bookingHistoryModel = BookingHistoryModel.fromJson(response.data);

      return bookingHistoryModel;
    } on DioException catch (e) {
      throw e.response?.statusCode ?? 500;
    }
  }

  static Future<BookingHistoryModel> getBookingByInvoice(
      {required String token, required String invoiceNumber}) async {
    BookingHistoryModel bookingHistoryModel = BookingHistoryModel(
      code: 0,
      error: true,
      message: '',
      ticketData: [],
    );

    try {
      final response = await Dio().get(
        '$baseUrl/user/wisata/$invoiceNumber',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      bookingHistoryModel = BookingHistoryModel.fromJson(response.data);

      return bookingHistoryModel;
    } on DioException catch (e) {
      throw e.response?.statusCode ?? 500;
    }
  }

  static Future<BookingResponseModel> postBookingRequest({
    required BookingRequestBodyModel requestBody
  }) async {

    String? token = await SharedPreferenceManager.getToken();
    BookingResponseModel? bookingResponseModel;

    print(requestBody.toRawJson());

    try {
      final response = await Dio().post(
        '$baseUrl/user/buy',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
        data: requestBody.toRawJson()
      );

      print(response.data);

      if (response.statusCode == 200) {
        return bookingResponseModel = BookingResponseModel.fromJson(response.data);
      } else {
        throw DioException(
          response: response,
          error: 'Failed to post booking data',
          requestOptions: response.requestOptions,
        );
      }
    } on DioException catch (e) {
      throw e.response?.statusCode ?? 500;
    }
  }
}
