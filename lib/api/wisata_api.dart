import 'package:dio/dio.dart';
import 'package:sustain_tour_mobile/models/wisata_models/wisata_models.dart';

class WisataApi {
  Future<List<Wisata>> getAllWisata({int? page, int? limit}) async {
    List<Wisata> listWisata = [];

    final response = await Dio().get(
      'https://destimate.uc.r.appspot.com/wisata?limit=$limit&page=$page',
    );

    if(response.statusCode == 200){
      for (var element in response.data) {
        listWisata.add(WisataModel.fromJson(element).wisatas[element]);
      }
    } else {
      return listWisata = [];
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
      print(responseModel);
      for (var element in responseModel.wisatas) {
        listWisata.add(element);
      }
    } else {
      return listWisata = [];
    }

    return listWisata;
  }
}