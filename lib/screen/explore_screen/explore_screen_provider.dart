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

  List<String> _listAllKota = [];
  List<String> get listAllKota => _listAllKota;

  List<String> _listSearchedKota = [];
  List<String> get listSearchedKota => _listSearchedKota;

  String _selectedKota = "Semua Lokasi";
  String get selectedKota => _selectedKota;

  int _kotaIndex = 0;
  int get kotaIndex => _kotaIndex;

  bool _isGetKotaSuccess = true;
  bool get isGetKotaSuccess => _isGetKotaSuccess;

  bool _showSearchPage = false;
  bool get showSearchPage => _showSearchPage;

  List<String> _historySearch = ["Alam", "Pantai Kuta", "Museum", "test", "test test"];
  List<String> get historySearch => _historySearch;

  void onBottomSheetOpened(){
    _listSearchedKota = _listAllKota;
    _kotaIndex = _listSearchedKota.indexWhere((element) => element == selectedKota);
  }

  void selectKota(int index){
    _kotaIndex = index;
    notifyListeners();
  }

  void toggleButtonCategory({required int index}) {
    _currentPage = 1;
    _listWisata = [];
    String key = _wisataCategory.keys.elementAt(index);
    _wisataCategory.update(key, (value) => !value);
    notifyListeners();
  }

  void onSubmitKota() {
    _currentPage = 1;
    _listWisata = [];
    _selectedKota = _listSearchedKota[_kotaIndex];
    notifyListeners();
  }

  void searchKota({required String query}) {
    _listSearchedKota = [];
    _kotaIndex = -1;
    notifyListeners();

    for(int i = 0; i<_listAllKota.length;i++){
      if(_listAllKota[i].toLowerCase().contains(query.toLowerCase())){
        _listSearchedKota.add(_listAllKota[i]);
      }
    }

    for(int i = 0; i<_listSearchedKota.length;i++){
      if(_listSearchedKota[i].contains("Semua Lokasi") && query != ""){
        _listSearchedKota.remove(_listSearchedKota[i]);
      }
    }

    notifyListeners();
  }

  void onSearchWisata() {
    _currentPage = 1;
    _listWisata = [];
    notifyListeners();
  }

  void onSearchTap(){
    _showSearchPage = true;
    notifyListeners();
  }

  void onClearTap(){
    _showSearchPage = false;
    notifyListeners();
  }

  void getWisataInit({required String token}) async {
    _currentPage = 1;
    _listWisata = [];
    _selectedKota = "Semua Lokasi";
    _wisataCategory = {
      "Wisata Alam" : false,
      "Wisata Lifestyle" : false,
      "Wisata Air" : false,
      "Wisata Sejarah" : false,
    };
    _showSearchPage = false;
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

  void getWisataDataByFilter({required String token}) async {
    _isLoadingWisata = true;
    notifyListeners();

    List<String> selectedCategory = [];

    for(int i = 0; i < _wisataCategory.length; i++){
      if(_wisataCategory.values.elementAt(i) == true){
        selectedCategory.add(_wisataCategory.keys.elementAt(i));
      }
    }

    try {
      if(selectedCategory.isEmpty && _selectedKota == "Semua Lokasi"){
        _listWisata = await WisataApi().getAllWisata(page: _currentPage, token: token, listWisata: _listWisata);
      } else {
        _listWisata = await WisataApi().getWisataByFilter(
          page: _currentPage,
          token: token,
          listWisata: _listWisata,
          category: selectedCategory,
          kota: _selectedKota == "Semua Lokasi" ? "" : _selectedKota,
        );
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

  void getWisataDataBySearch({required String token, required String searchQuery}) async {
    _isLoadingWisata = true;
    notifyListeners();

    List<String> selectedCategory = [];

    for(int i = 0; i < _wisataCategory.length; i++){
      if(_wisataCategory.values.elementAt(i) == true){
        selectedCategory.add(_wisataCategory.keys.elementAt(i));
      }
    }

    try {
      _listWisata = await WisataApi().getWisataBySearch(
        page: _currentPage,
        token: token,
        listWisata: _listWisata,
        title: searchQuery
      );

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
      _listAllKota = await CitiesApi().getAllKota(token: token);
      _listAllKota.insert(0,"Semua Lokasi");
      _listSearchedKota = _listAllKota;

      _isGetKotaSuccess = true;
      notifyListeners();
    } catch (e) {
      _isGetKotaSuccess = false;
      notifyListeners();
      throw Exception(e);
    }
  }
}
