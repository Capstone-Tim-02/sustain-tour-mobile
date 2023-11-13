import 'package:dio/dio.dart';
import 'package:sustain_tour_mobile/constants/api_base_url.dart';
import 'package:sustain_tour_mobile/models/emission_model/emission_model.dart';

class EmissionApi {
  static Future<EmissionModel> getUserEmission(
      {required int userId, required String token}) async {
    final response = await Dio().get(
      '$baseUrl/carbonfootprint/$userId',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    EmissionModel emissionModel = EmissionModel.fromJson(response.data);

    return emissionModel;
  }
}
