import 'package:dio/dio.dart';
import 'package:sustain_tour_mobile/constants/api_base_url.dart';
import 'package:sustain_tour_mobile/constants/shared_preference_manager.dart';
import 'package:sustain_tour_mobile/models/wisata_models/wisata_models.dart';

class WisataApi {
  Future<List<Wisata>> getAllWisata({required int page, required List<Wisata> listWisata}) async {
    String token = await SharedPreferenceManager.getToken() ?? '';

    final response = await Dio().get(
      '$baseUrl/wisata/mobile',
      queryParameters: {
        'limit' : 6,
        'page' : page
      },
      options: Options(
        headers: {
          "authorization": "Bearer $token"
        }
      )
    );

    if(response.statusCode == 200){
      WisataModel responseModel = WisataModel.fromJson(response.data);
      for (var element in responseModel.wisatas) {
        listWisata.add(element);
      }
    }

    return listWisata;
  }

  Future<List<Wisata>> getWisataByUserPrederences() async {
    List<Wisata> listWisata = [];
    String token = await SharedPreferenceManager.getToken() ?? '';

    final response = await Dio().get(
      '$baseUrl/user/preferences/',
      options: Options(
        headers: {
          "authorization": "Bearer $token"
        }
      ),
    );

    if(response.statusCode == 200){
      WisataModel responseModel = WisataModel.fromJson(response.data);
      for (var element in responseModel.wisatas) {
        listWisata.add(element);
      }
    }

    return listWisata;
  }

  Future<List<Wisata>> getWisataByFilter({
    required List<String> category,
    required String kota,
    required int page,
    required List<Wisata> listWisata
  }) async {
    String token = await SharedPreferenceManager.getToken() ?? '';
    Map<String, dynamic> queryParameters = {
      'limit' : 6,
      'page' : page,
      'kota' : kota,
    };

    if(category.isNotEmpty){
      queryParameters.addAll({'category_name' : category});
    }

    final response = await Dio().get(
      '$baseUrl/wisata/mobile',
      queryParameters: queryParameters,
      options: Options(
        headers: {
          "authorization": "Bearer $token"
        }
      ),
    );

    if(response.statusCode == 200){
      WisataModel responseModel = WisataModel.fromJson(response.data);
      for (var element in responseModel.wisatas) {
        listWisata.add(element);
      }
    }

    return listWisata;
  }

  Future<List<Wisata>> getWisataBySearch({
    required String title,
    required int page,
    required List<Wisata> listWisata,
    required List<String> category,
  }) async {
    String token = await SharedPreferenceManager.getToken() ?? "";
    Map<String, dynamic> queryParameters = {
      'limit' : 6,
      'page' : page,
      'title' : title,
    };

    if(category.isNotEmpty){
      queryParameters.addAll({'category_name' : category});
    }

    final response = await Dio().get(
      '$baseUrl/wisata/mobile',
      queryParameters: queryParameters,
      options: Options(
        headers: {
          "authorization": "Bearer $token"
        }
      ),
    );

    if(response.statusCode == 200){
      WisataModel responseModel = WisataModel.fromJson(response.data);
      for (var element in responseModel.wisatas) {
        listWisata.add(element);
      }
    }

    return listWisata;
  }
}