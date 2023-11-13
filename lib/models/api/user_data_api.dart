import 'package:dio/dio.dart';
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
}
