import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/models/api/detail_promo_api.dart';
import 'package:sustain_tour_mobile/models/detail_promo_model/detail_promo_model.dart';

class DetailPromoProvider extends ChangeNotifier {
  bool _isLoadingDetailPromo = false;
  bool get isLoadingDetailPromo => _isLoadingDetailPromo;

  DetailPromoModel? _detailPromoData;
  DetailPromoModel? get detailPromoData => _detailPromoData;

  void getDetailPromo(int promoId) async {
    _isLoadingDetailPromo = true;
    notifyListeners();

    _detailPromoData =
        await DetailPromoApi().getDetailPromoFromAPI(promoId: promoId);

    _isLoadingDetailPromo = false;
    notifyListeners();
  }
}
