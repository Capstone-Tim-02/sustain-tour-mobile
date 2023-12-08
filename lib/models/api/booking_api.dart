import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sustain_tour_mobile/constants/api_base_url.dart';
import 'package:sustain_tour_mobile/constants/shared_preference_manager.dart';
import 'package:sustain_tour_mobile/models/booking_models/booking_history_model.dart';
import 'package:sustain_tour_mobile/models/booking_models/booking_request_body_models.dart';
import 'package:sustain_tour_mobile/models/booking_models/booking_response_models.dart';

class BookingApi {
  static Future<BookingHistoryModel> getBookingHistory() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');

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

  static Future<bool> batalkanPesanan({required String invoiceNumber}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');

    try {
      await Dio().delete(
        '$baseUrl/user/ticket/$invoiceNumber',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      return true;
    } on DioException catch (e) {
      throw e.response?.data['message'] ?? 'Terjadi Kesalahan';
    }
  }

  static Future<BookingHistoryModel> getBookingByInvoice(
      {required String invoiceNumber}) async {
    String? token = await SharedPreferenceManager.getToken() ?? "";
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

  static Future<BookingResponseModel> postBookingRequest(
      {required BookingRequestBodyModel requestBody}) async {
    String? token = await SharedPreferenceManager.getToken();
    BookingResponseModel? bookingResponseModel;

    try {
      final response = await Dio().post('$baseUrl/user/buy',
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ),
          data: requestBody.toRawJson());

      if (response.statusCode == 200) {
        bookingResponseModel = BookingResponseModel.fromJson(response.data);
        print(response.data);
        return bookingResponseModel;
      } else {
        throw DioException(
          response: response,
          error: 'Failed to post booking data',
          requestOptions: response.requestOptions,
        );
      }
    } on DioException catch (e) {
      throw e.response?.data;
    }
  }
}
