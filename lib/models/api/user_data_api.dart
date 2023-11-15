import 'package:dio/dio.dart';
import 'package:sustain_tour_mobile/constants/api_base_url.dart';
import 'package:sustain_tour_mobile/models/user_data_models/user_data_models.dart';

class UserDataApi {
  Future<User> getUserData({required int userId, required String token}) async {
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
        createdAt: DateTime.now());

    final response = await Dio().get(
      'https://destimate.uc.r.appspot.com/user/$userId',
      options: Options(headers: {"authorization": "Bearer $token"}),
    );

    if (response.statusCode == 200) {
      UserDataModel responseModel = UserDataModel.fromJson(response.data);
      userData = responseModel.user;
    }

    return userData;
  }

  Future<bool> updateName(
      {required int userId,
      required String token,
      required String newName}) async {
    try {
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
      print(e);
      return false;
    }
  }

  Future<bool> updateUsername(
      {required int userId,
      required String token,
      required String newUsername}) async {
    try {
      await Dio().put('$baseUrl/user/$userId',
          options: Options(
            headers: {
              "authorization": "Bearer $token",
              'Content-Type': 'multipart/form-data',
            },
          ),
          data: FormData.fromMap({
            'username': newUsername,
          }));

      return true;
    } on DioException catch (e) {
      print(e);
      return false;
    }
  }
}
