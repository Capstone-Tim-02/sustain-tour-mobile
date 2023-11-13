import 'package:dio/dio.dart';
import 'package:sustain_tour_mobile/constants/api_base_url.dart';
import 'package:sustain_tour_mobile/models/emission_model/emission_model.dart';

class EmissionApi {
  static Future<EmissionModel> getUserEmission() async {
    final response = await Dio().get(
      '$baseUrl/carbonfootprint/34',
      options: Options(headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImdhYnJpZWwxMjM0NSIsImV4cCI6MTY5OTc1NjkxNiwiaWF0IjoxNjk5NjcwNTE2fQ.QdURDLEfJZypxeef6ClgEmuwyLgvwZhWH6DS-0jJt9E'
      }),
    );

    EmissionModel emissionModel = EmissionModel.fromJson(response.data);

    return emissionModel;
  }
}
