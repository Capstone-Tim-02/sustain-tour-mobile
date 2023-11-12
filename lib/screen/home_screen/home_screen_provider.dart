import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/api/promo_api.dart';
import 'package:sustain_tour_mobile/api/user_data_api.dart';
import 'package:sustain_tour_mobile/api/wisata_api.dart';
import 'package:sustain_tour_mobile/models/promo_models/promo_models.dart';
import 'package:sustain_tour_mobile/models/user_data_models/user_data_models.dart';
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

  User? _userData;
  User? get userData => _userData;

  bool _isGetWisataSuccess = true;
  bool get isGetWisataSuccess => _isGetWisataSuccess;

  bool _isGetPromoSuccess = true;
  bool get isGetPromoSuccess => _isGetPromoSuccess;

  bool _isGetUserDataSuccess = true;
  bool get isGetUserDataSuccess => _isGetUserDataSuccess;

  void getUserData({required int id, required String token}) async{
    notifyListeners();

    try {
      _userData = await UserDataApi().getUserData(id: id, token: token);
      _isGetUserDataSuccess = true;
      notifyListeners();
    } catch (e) {
      _isGetUserDataSuccess = false;
      throw Exception(e);
    }
  }

  void getRekomendasiWisata({required String token}) async{
    _isLoadingWisata = true;
    notifyListeners();

    try {
      _listWisata = await WisataApi().getWisataByUserPrederences(token : token);
      _isGetWisataSuccess = true;
      _isLoadingWisata = false;
      notifyListeners();
    } catch (e) {
      _isGetWisataSuccess = false;
      _isLoadingWisata = false;
      throw Exception(e);
    }
  }

  void getPromo({required String token}) async{
    _isLoadingPromo = true;
    notifyListeners();

    try {
      _listPromo = await PromoApi().getUserPromo(token : token);
      _isGetPromoSuccess = true;
      _isLoadingPromo = false;
      notifyListeners();
    } catch (e) {
      _isGetPromoSuccess = false;
      _isLoadingPromo = false;
      throw Exception(e);
    }
  }
}
