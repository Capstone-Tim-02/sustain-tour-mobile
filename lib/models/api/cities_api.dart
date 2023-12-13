
import 'package:dio/dio.dart';
import 'package:sustain_tour_mobile/constants/api_base_url.dart';
import 'package:sustain_tour_mobile/constants/shared_preference_manager.dart';
import 'package:sustain_tour_mobile/models/cities_models/cities_models.dart';

class CitiesApi {
  Future<List<String>> getAllKota() async {
    String token = await SharedPreferenceManager.getToken() ?? '';
    List<String> listKota = [];

    final response = await Dio().get(
      '$baseUrl/cities',
      options: Options(
        headers: {
          "authorization": "Bearer $token"
        }
      ),
    );

    if(response.statusCode == 200){
      final responseModel = CitiesModel.fromJson(response.data);
      for (var element in responseModel.cities) {
        listKota.add(element);
      }
    }

    return listKota;
  }

}