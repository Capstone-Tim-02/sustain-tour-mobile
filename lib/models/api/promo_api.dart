import 'package:dio/dio.dart';
import 'package:sustain_tour_mobile/constants/api_base_url.dart';
import 'package:sustain_tour_mobile/constants/shared_preference_manager.dart';
import 'package:sustain_tour_mobile/models/promo_models/promo_models.dart';

class PromoApi {
  Future<List<Promo>> getUserPromo(
      {required int page, required List<Promo> listPromo}) async {
    String token = await SharedPreferenceManager.getToken() ?? '';

    final response = await Dio().get(
      '$baseUrl/promo/',
      options: Options(headers: {"authorization": "Bearer $token"}),
      queryParameters: {
        'page': page,
      },
    );

    if (response.statusCode == 200) {
      PromoModel responseModel = PromoModel.fromJson(response.data);
      for (var element in responseModel.promos) {
        listPromo.add(element);
      }
      return listPromo;
    } else {
      return listPromo = [];
    }
  }
}
