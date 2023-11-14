import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/models/api/wisata_api.dart';
import 'package:sustain_tour_mobile/models/wisata_models/wisata_models.dart';

class ExploreScreenProvider with ChangeNotifier {
  bool _isLoadingWisata = true;
  bool get isLoadingWisata => _isLoadingWisata;

  List<Wisata> _listWisata = [];
  List<Wisata> get listWisata => _listWisata;

  bool _isGetWisataSuccess = true;
  bool get isGetWisataSuccess => _isGetWisataSuccess;

  int _currentPage = 0;
  int get currentPage => _currentPage;

  final Map<String, bool> _wisataCategory = {
    "Gunung" : false,
    "Pantai" : false,
    "Gua" : false,
    "Air terjun" : false,
    "Candi" : false,
  };
  Map<String, bool> get wisataCategory => _wisataCategory;

  List<String> listKota = [
    "Bandung",
    "Malang",
    "Jakarta",
    "Surabaya",
    "Nusa Tenggara Barat",
    "Nusa Tenggara Timur",
    "Banyuwangi"
  ];

  void getAllWisataByPageInitPage({required String token}) async {
    _currentPage = 0;
    _listWisata = [];
    _isLoadingWisata = true;
    notifyListeners();

    try {
      _listWisata = await WisataApi().getAllWisata(page: currentPage +1, token: token, listWisata: listWisata);
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

  void getAllWisataByPage({required String token}) async {
    _isLoadingWisata = true;
    notifyListeners();

    try {
      _listWisata = await WisataApi().getAllWisata(page: currentPage+1, token: token, listWisata: listWisata);
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

  void toggleButton({required int index}) {
    String key = _wisataCategory.keys.elementAt(index);
    _wisataCategory.update(key, (value) => !value);
  }

  //TODO Logika Search
}
