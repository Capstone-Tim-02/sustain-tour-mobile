import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sustain_tour_mobile/constants/api_base_url.dart';
import 'package:sustain_tour_mobile/models/booking_history_model/booking_history_model.dart';

class BookingHistoryApi {
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
}
