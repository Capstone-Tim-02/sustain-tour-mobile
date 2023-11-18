import 'package:dio/dio.dart';
import 'package:sustain_tour_mobile/constants/api_base_url.dart';

class CategoryKesukaanApi {
  final Dio _dio = Dio();

  Future<void> updateCategoryKesukaan(
      int userId, String token, String newCategoryKesukaan) async {
    try {
      FormData formData = FormData.fromMap({
        'category_kesukaan': newCategoryKesukaan,
      });
      final response = await _dio.put(
        '$baseUrl/user/$userId',
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        response.statusMessage;
      } else {
        response.statusMessage;
      }
    } catch (error) {
      error.toString();
    }
  }
}
