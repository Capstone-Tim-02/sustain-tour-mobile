import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/models/api/cities_api.dart';
import 'package:sustain_tour_mobile/models/api/wisata_api.dart';
import 'package:sustain_tour_mobile/models/wisata_models/wisata_models.dart';

class ExploreScreenProvider with ChangeNotifier {
  bool _isLoadingWisata = true;
  bool get isLoadingWisata => _isLoadingWisata;

  List<Wisata> _listWisata = [];
  List<Wisata> get listWisata => _listWisata;

  bool _isGetWisataSuccess = true;
  bool get isGetWisataSuccess => _isGetWisataSuccess;

  int _currentPage = 1;
  int get currentPage => _currentPage;

  Map<String, bool> _wisataCategory = {
    "Wisata Alam" : false,
    "Wisata Lifestyle" : false,
    "Wisata Air" : false,
    "Wisata Sejarah" : false,
  };
  Map<String, bool> get wisataCategory => _wisataCategory;

  List<String> _listKota = [];
  List<String> get listKota => _listKota;

  int _kotaIndex = 0;
  int get kotaIndex => _kotaIndex;

  bool _isGetKotaSuccess = true;
  bool get isGetKotaSuccess => _isGetKotaSuccess;

  void setPage(int page){
    _currentPage = page;
  }

  void setListWisataToEmpty(){
    _listWisata = [];
  }

  void setKotaIndex(int index){
    _kotaIndex = index;
    notifyListeners();
  }

  void getWisataInit({required String token}) async {
    _currentPage = 1;
    _listWisata = [];
    _wisataCategory = {
      "Wisata Alam" : false,
      "Wisata Lifestyle" : false,
      "Wisata Air" : false,
      "Wisata Sejarah" : false,
    };
    _kotaIndex = 0;
    _isLoadingWisata = true;
    notifyListeners();

    try {
      _listWisata = await WisataApi().getAllWisata(page: currentPage, token: token, listWisata: listWisata);
      _currentPage +=1;

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

  void getWisataByPage({required String token}) async {
    _isLoadingWisata = true;
    notifyListeners();

    List<String> selectedCategory = [];

    for(int i = 0; i < _wisataCategory.length; i++){
      if(_wisataCategory.values.elementAt(i) == true){
        selectedCategory.add(_wisataCategory.keys.elementAt(i));
      }
    }

    try {
      if(selectedCategory.isEmpty){
        _listWisata = await WisataApi().getAllWisata(page: currentPage, token: token, listWisata: listWisata);
      } else {
        for(int i = 0; i<selectedCategory.length;i++){
          _listWisata = await WisataApi().getWisataByCitiesCategory(page: currentPage, token: token, listWisata: _listWisata, category: selectedCategory[i]);
        }
      }

      _currentPage +=1;

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

  void getAllKota({required String token}) async {
    try {
      _listKota = await CitiesApi().getAllKota(token: token);
      _listKota.insert(0,"Semua Lokasi");

      //REMINDER HAPUS INI PAS SELESAI NYOBA
      _listKota.add("test");
      _listKota.add("test");
      _listKota.add("test");
      _listKota.add("test");
      _listKota.add("test");
      _listKota.add("test");
      _listKota.add("test");
      _listKota.add("test");
      _listKota.add("test");
      _listKota.add("test");
      _isGetKotaSuccess = true;
      notifyListeners();
    } catch (e) {
      _isGetKotaSuccess = false;
      notifyListeners();
      throw Exception(e);
    }
  }

  void toggleButtonCategory({required int index}) {
    String key = _wisataCategory.keys.elementAt(index);
    _wisataCategory.update(key, (value) => !value);
    notifyListeners();
  }
}
