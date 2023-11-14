import 'package:dio/dio.dart';
import 'package:sustain_tour_mobile/models/wisata_models/wisata_models.dart';

class WisataApi {
  Future<List<Wisata>> getAllWisata({required int page, required String token, required List<Wisata> listWisata}) async {
    // TODO Masih perlu fix
    final response = await Dio().get(
      'https://destimate.uc.r.appspot.com/wisata?limit=2&page=$page',
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
      'https://destimate.uc.r.appspot.com/user/preferences/',
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