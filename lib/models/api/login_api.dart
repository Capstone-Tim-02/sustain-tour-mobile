import 'package:dio/dio.dart';
import 'package:sustain_tour_mobile/models/login_models/login_models.dart';

class LoginApi {
  final Dio _dio = Dio();
  static const String baseUrl = 'https://destimate.uc.r.appspot.com';

  Future<LoginModels> login(String username, String password) async {
    try {
      final response = await _dio.post(
        '$baseUrl/signin',
        data: {
          'username': username,
          'password': password,
        },
        options: Options(headers: {
          'Content-Type': 'application/json',
        }),
      );

      return LoginModels.fromJson(response.data);
    } on DioException catch (error) {
      if (error.response?.statusCode == 401) {
        String errorMessage =
            error.response?.data['message'] ?? 'Invalid username or password';
        throw errorMessage;
      } else {
        throw 'Terjadi kesalahan';
      }
    }
  }

  Future<LoginModels> initiateGoogleAuth() async {
    try {
      final response = await _dio.get('$baseUrl/auth/google/initiate');

      if (response.statusCode == 200) {
        return LoginModels.fromJson(response.data);
      } else {
        throw DioException(
          response: response,
          requestOptions: response.requestOptions,
          error: 'Failed to initiate Google authentication',
        );
      }
    } catch (error) {
      throw DioException(
        requestOptions: RequestOptions(path: '$baseUrl/auth/google/initiate'),
        error: 'Error during HTTP request: $error',
      );
    }
  }
}
