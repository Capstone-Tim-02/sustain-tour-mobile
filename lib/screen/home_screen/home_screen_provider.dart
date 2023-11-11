import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/api/promo_api.dart';
import 'package:sustain_tour_mobile/api/wisata_api.dart';
import 'package:sustain_tour_mobile/models/promo_models/promo_models.dart';
import 'package:sustain_tour_mobile/models/wisata_models/wisata_models.dart';

class HomeScreenProvider with ChangeNotifier {
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  List<Wisata> _listWisata = [];
  List<Wisata> get listWisata => _listWisata;

  List<Promo> _listPromo = [];
  List<Promo> get listPromo => _listPromo;

  void getRekomendasiWisata({required String token}) async{
    _isLoading = true;
    notifyListeners();

    _listWisata = await WisataApi().getWisataByUserPrederences(token : token);
    _isLoading = false;
    notifyListeners();
  }

    void getPromo({required String token}) async{
    _isLoading = true;
    notifyListeners();

    _listPromo = await PromoApi().getUserPromo(token : token);
    _isLoading = false;
    notifyListeners();
  }
}
