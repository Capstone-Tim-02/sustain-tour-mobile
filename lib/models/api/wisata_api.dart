import 'package:dio/dio.dart';
import 'package:sustain_tour_mobile/constants/api_base_url.dart';
import 'package:sustain_tour_mobile/models/wisata_models/wisata_models.dart';

class WisataApi {
  Future<List<Wisata>> getAllWisata({required int page, required String token, required List<Wisata> listWisata}) async {
    // TODO Masih perlu fix
    final response = await Dio().get(
      '$baseUrl/wisata',
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

  Future<List<Wisata>> getWisataByUserPrederences({required String token}) async {
    List<Wisata> listWisata = [];

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

  Future<List<Wisata>> getWisataByCitiesCategory({
    required String token,
    String? category,
    String? kota,
    required int page,
    required List<Wisata> listWisata
  }) async {
    final response = await Dio().get(
      '$baseUrl/wisata',
      queryParameters: {
        'limit' : 6,
        'page' : page,
        'category_name' : category,
        'kota' : kota
      },
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