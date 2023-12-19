import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/models/api/promo_api.dart';
import 'package:sustain_tour_mobile/models/api/wisata_api.dart';
import 'package:sustain_tour_mobile/models/promo_models/promo_models.dart';
import 'package:sustain_tour_mobile/models/wisata_models/wisata_models.dart';

class HomeScreenProvider with ChangeNotifier {
  bool _isLoadingWisata = true;
  bool get isLoadingWisata => _isLoadingWisata;

  bool _isLoadingPromo = true;
  bool get isLoadingPromo => _isLoadingPromo;

  List<Wisata> _listWisata = [];
  List<Wisata> get listWisata => _listWisata;

  List<Promo> _listPromo = [];
  List<Promo> get listPromo => _listPromo;

  bool _isGetWisataSuccess = false;
  bool get isGetWisataSuccess => _isGetWisataSuccess;

  bool _isGetPromoSuccess = false;
  bool get isGetPromoSuccess => _isGetPromoSuccess;

  void getRekomendasiWisata() async {
    _isLoadingWisata = true;
    notifyListeners();

    try {
      _listWisata = await WisataApi().getWisataByUserPrederences();
      _isGetWisataSuccess = true;
      _isLoadingWisata = false;
      notifyListeners();
    } catch (e) {
      _isLoadingWisata = false;
      _isGetWisataSuccess = false;
      notifyListeners();
      throw Exception(e);
    }
  }

  void getPromo() async {
    _isLoadingPromo = true;
    notifyListeners();

    try {
      _listPromo = await PromoApi().getUserPromo(page: 1, listPromo: []);

      _isGetPromoSuccess = true;
      _isLoadingPromo = false;
      notifyListeners();
    } catch (e) {
      _isLoadingPromo = false;
      _isGetPromoSuccess = false;
      notifyListeners();
      throw Exception(e);
    }
  }
}
