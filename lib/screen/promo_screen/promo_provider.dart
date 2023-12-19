import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/models/api/promo_api.dart';
import 'package:sustain_tour_mobile/models/promo_models/promo_models.dart';

class PromoProvider extends ChangeNotifier {
  int _currentPromoPage = 1;
  int get currentPromoPage => _currentPromoPage;

  bool _hasMorePromo = false;
  bool get hasMorePromo => _hasMorePromo;

  bool _isLoadingPromo = false;
  bool get isLoadingPromo => _isLoadingPromo;

  bool _isGetPromoSuccess = false;
  bool get isGetPromoSuccess => _isGetPromoSuccess;

  List<Promo> _listAllPromo = [];
  List<Promo> get listAllPromo => _listAllPromo;

  void getUserPromo() async {
    try {
      _hasMorePromo = true;
      _isLoadingPromo = true;
      notifyListeners();
      _listAllPromo = await PromoApi().getUserPromo(page: _currentPromoPage, listPromo: _listAllPromo);

      _isGetPromoSuccess = true;

      if(_listAllPromo.length < _currentPromoPage * 10){
        _hasMorePromo = false;
      } else {
        _hasMorePromo = true;
      }
      _currentPromoPage++;
      _isLoadingPromo = false;
      notifyListeners();
    } catch (e) {
      _isGetPromoSuccess = false;
      _isLoadingPromo = false;
      throw Exception(e);
    }
  }
}