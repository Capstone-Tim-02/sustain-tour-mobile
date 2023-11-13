import 'package:dio/dio.dart';
import 'package:sustain_tour_mobile/constants/api_base_url.dart';
import 'package:sustain_tour_mobile/models/profile_model/profile_model.dart';

class ProfileApi {
  static Future<ProfileModel> getProfile() async {
    final response = await Dio().get(
      '$baseUrl/user/34',
      options: Options(headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImdhYnJpZWwxMjM0NSIsImV4cCI6MTY5OTg4MDY3OSwiaWF0IjoxNjk5Nzk0Mjc5fQ.3tHWHydE2zdrSNzHRhgcYrx87LLKSeiikNj8FYDv-JA'
      }),
    );

    final ProfileModel profileModel = ProfileModel.fromJson(response.data);

    return profileModel;
  }
}
