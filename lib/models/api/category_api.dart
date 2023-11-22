import 'package:dio/dio.dart';
import 'package:sustain_tour_mobile/constants/api_base_url.dart';

import 'package:sustain_tour_mobile/models/matchmaking_models/category_models.dart';

class CategoryApi {
  final Dio _dio = Dio();

  Future<CategoryModels> getCategoriesApi({required token}) async {
    try {
      final response = await _dio.get(
        '$baseUrl/categories',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200) {
        return CategoryModels.fromJson(response.data);
      } else {
        throw DioException(
          response: response,
          error: 'Failed to load categories',
          requestOptions: response.requestOptions,
        );
      }
    } catch (error) {
      rethrow;
    }
  }
}
