import 'package:dio/dio.dart';
import 'package:sustain_tour_mobile/models/register_models/register_models.dart';

class RegisterApi {
  final Dio _dio = Dio();
  static const String baseUrl = 'https://destimate.uc.r.appspot.com';

  Future<RegisterModels> register(
    String name, String username, String password, String confirmPassword, String email, String phone) async {
    try {
      final response = await _dio.post(
        '$baseUrl/signup',
        data: {
          'name' : name,
          'username' : username,
          'password' : password,
          'confirm_password' : confirmPassword,
          'email' : email,
          'phone_number' : phone
        },
        options: Options(headers: {
          'Content-Type': 'application/json',
        }),
      );

      return RegisterModels.fromJson(response.data);
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

  Future<RegisterModels> initiateGoogleAuth() async {
    try {
      final response = await _dio.get('$baseUrl/auth/google/initiate');

      if (response.statusCode == 200) {
        return RegisterModels.fromJson(response.data);
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
