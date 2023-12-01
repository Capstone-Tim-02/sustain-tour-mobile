import 'package:dio/dio.dart';
import 'package:sustain_tour_mobile/constants/api_base_url.dart';
import 'package:sustain_tour_mobile/constants/shared_preference_manager.dart';
import 'package:sustain_tour_mobile/models/detail_promo_model/detail_promo_model.dart';

class DetailPromoApi {
  Future<DetailPromoModel> getDetailPromoFromAPI({required int promoId}) async {
    String? token = await SharedPreferenceManager.getToken();

    final response = await Dio().get(
      '$baseUrl/user/promo/$promoId',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    if (response.statusCode == 200) {
      return DetailPromoModel.fromJson(response.data);
    } else {
      throw Exception("Promo Tidak Ditemukan");
    }
  }
}
