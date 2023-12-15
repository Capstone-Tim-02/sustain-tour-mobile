import 'package:dio/dio.dart';
import 'package:sustain_tour_mobile/constants/shared_preference_manager.dart';
import 'package:sustain_tour_mobile/models/promo_models/promo_models.dart';

class PromoApi {
  Future<List<Promo>> getUserPromo() async {
    String token = await SharedPreferenceManager.getToken() ?? '';
    List<Promo> listPromo = [];

    final response = await Dio().get(
      'https://destimate.uc.r.appspot.com/user/promo/',
      options: Options(headers: {"authorization": "Bearer $token"}),
    );

    if (response.statusCode == 200) {
      PromoModel responseModel = PromoModel.fromJson(response.data);
      for (var element in responseModel.promos) {
        listPromo.add(element);
      }
    } else {
      return listPromo = [];
    }

    return listPromo;
  }
}
