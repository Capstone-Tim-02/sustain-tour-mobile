import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/models/api/detail_promo_api.dart';
import 'package:sustain_tour_mobile/models/detail_promo_model/detail_promo_model.dart';

class DetailPromoProvider extends ChangeNotifier {
  bool _isLoadingDetailPromo = false;
  bool get isLoadingDetailPromo => _isLoadingDetailPromo;

  bool _isErrorDetailPromo = false;
  bool get isErrorDetailPromo => _isErrorDetailPromo;

  DetailPromoModel? _detailPromoData;
  DetailPromoModel? get detailPromoData => _detailPromoData;

  void getDetailPromo(int promoId) async {
    _isLoadingDetailPromo = true;
    notifyListeners();

    try {
      _detailPromoData =
          await DetailPromoApi().getDetailPromoFromAPI(promoId: promoId);

      _isErrorDetailPromo = false;
    } on DioException catch (e) {
      print(e);
      _isErrorDetailPromo = true;
    } finally {
      _isLoadingDetailPromo = false;
      notifyListeners();
    }
  }
}
