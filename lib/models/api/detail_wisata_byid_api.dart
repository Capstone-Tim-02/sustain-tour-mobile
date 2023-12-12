import 'package:dio/dio.dart';
import 'package:sustain_tour_mobile/constants/api_base_url.dart';
import 'package:sustain_tour_mobile/models/detail_wisata_byid_models/detail_wisata_byid_models.dart';

class DetailWisataApi {
  final Dio _dio = Dio();
  Future<DetailWisataByid> getDetailWisataById(int id, String token) async {
    try {
      final response = await _dio.get(
        '$baseUrl/wisata/$id',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      if (response.statusCode == 200) {
        return DetailWisataByid.fromJson(response.data);
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }
    } catch (error) {
      rethrow;
    }
  }
}
