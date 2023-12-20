import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sustain_tour_mobile/constants/api_base_url.dart';
import 'package:sustain_tour_mobile/constants/shared_preference_manager.dart';
import 'package:sustain_tour_mobile/models/user_data_models/user_data_models.dart';
import 'package:http_parser/http_parser.dart';

class UserDataApi {
  Future<User> getUserData({required int userId}) async {
    String token = await SharedPreferenceManager.getToken() ?? '';
    User userData = User(
        id: userId,
        name: "",
        username: "",
        email: "",
        phoneNumber: "",
        photoProfil: "photoProfil",
        points: 0,
        isVerified: false,
        categoryKesukaan: "",
        categoryId: 0,
        statusCategory: false,
        createdAt: DateTime.now());

    final response = await Dio().get(
      '$baseUrl/user/$userId',
      options: Options(headers: {"authorization": "Bearer $token"}),
    );

    if (response.statusCode == 200) {
      UserDataModel responseModel = UserDataModel.fromJson(response.data);
      userData = responseModel.user;
    }

    return userData;
  }

  Future<bool> updateName(
      {required int userId, required String newName}) async {
    try {
      String token = await SharedPreferenceManager.getToken() ?? '';
      await Dio().put('$baseUrl/user/$userId',
          options: Options(
            headers: {
              "authorization": "Bearer $token",
              'Content-Type': 'multipart/form-data',
            },
          ),
          data: FormData.fromMap({
            'name': newName,
          }));

      return true;
    } on DioException catch (e) {
      throw '${e.response?.data['message']}';
    }
  }

  Future<String> updateUsername(
      {required int userId, required String newUsername}) async {
    try {
      String token = await SharedPreferenceManager.getToken() ?? '';
      final response = await Dio().put('$baseUrl/user/$userId',
          options: Options(
            headers: {
              "authorization": "Bearer $token",
              'Content-Type': 'multipart/form-data',
            },
          ),
          data: FormData.fromMap({
            'username': newUsername,
          }));

      String newToken = response.data['token'];

      return newToken;
    } on DioException catch (e) {
      throw '${e.response?.data['message']}';
    }
  }

  Future<bool> updateNoHandphone(
      {required int userId, required String newNoHp}) async {
    try {
      String token = await SharedPreferenceManager.getToken() ?? '';
      await Dio().put('$baseUrl/user/$userId',
          options: Options(
            headers: {
              "authorization": "Bearer $token",
              'Content-Type': 'multipart/form-data',
            },
          ),
          data: FormData.fromMap({
            'phone_number': newNoHp,
          }));

      return true;
    } on DioException catch (e) {
      throw '${e.response?.data['message']}';
    }
  }

  Future<bool> updateEmail(
      {required int userId, required String newEmail}) async {
    try {
      String token = await SharedPreferenceManager.getToken() ?? '';
      await Dio().put('$baseUrl/user/$userId',
          options: Options(
            headers: {
              "authorization": "Bearer $token",
              'Content-Type': 'multipart/form-data',
            },
          ),
          data: FormData.fromMap({
            'email': newEmail,
          }));

      return true;
    } on DioException catch (e) {
      throw '${e.response?.data['message']}';
    }
  }

  Future<bool> uploadProfileImage({
    required int userId,
    required File image,
  }) async {
    try {
      String token = await SharedPreferenceManager.getToken() ?? '';
      String fileName = image.path.split('/').last;
      await Dio().put('$baseUrl/user/$userId',
          options: Options(
            headers: {
              "authorization": "Bearer $token",
              'Content-Type': 'multipart/form-data',
            },
          ),
          data: FormData.fromMap({
            'profile_image': await MultipartFile.fromFile(
              image.path,
              filename: fileName,
              contentType: MediaType('image', 'png'),
            ),
          }));

      return true;
    } on DioException catch (e) {
      throw '${e.response?.data['message']}';
    }
  }

  Future<bool> updatePassword({
    required int userId,
    required String currentPassword,
    required String newPassword,
    required String confirmNewPassword,
  }) async {
    try {
      String token = await SharedPreferenceManager.getToken() ?? '';
      await Dio().put('$baseUrl/user/change-password/$userId',
          options: Options(
            headers: {
              "authorization": "Bearer $token",
            },
          ),
          data: {
            "currentPassword": currentPassword,
            "newPassword": newPassword,
            "confirmPassword": confirmNewPassword,
          });

      return true;
    } on DioException catch (e) {
      throw '${e.response?.data['message']}';
    }
  }

  Future<bool> deleteProfileImage({
    required int userId,
  }) async {
    try {
      String token = await SharedPreferenceManager.getToken() ?? '';
      await Dio().delete(
        '$baseUrl/user/photo/$userId',
        options: Options(
          headers: {
            "authorization": "Bearer $token",
          },
        ),
      );

      return true;
    } on DioException catch (e) {
      throw '${e.response?.data['message']}';
    }
  }

  Future<bool> updateLokasiUser(
      {required double lat, required double long}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final int? userId = pref.getInt('id');
    final String? token = pref.getString('token');

    try {
      await Dio().put('$baseUrl/userlocation/$userId',
          options: Options(
            headers: {
              "authorization": "Bearer $token",
            },
          ),
          data: {"Lat": lat, "Long": long});
      return true;
    } on DioException catch (e) {
      throw '${e.response?.data['message']}';
    }
  }
}
