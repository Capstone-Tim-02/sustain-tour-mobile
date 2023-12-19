import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/models/api/category_api.dart';
import 'package:sustain_tour_mobile/models/api/cities_api.dart';
import 'package:sustain_tour_mobile/models/api/wisata_api.dart';
import 'package:sustain_tour_mobile/models/matchmaking_models/category_models.dart';
import 'package:sustain_tour_mobile/models/search_history_models/search_history_models.dart';
import 'package:sustain_tour_mobile/models/wisata_models/wisata_models.dart';
import 'package:sustain_tour_mobile/utils/database_helper.dart';

class ExploreScreenProvider with ChangeNotifier {
  List<Wisata> _listWisata = [];
  List<Wisata> get listWisata => _listWisata;

  bool _hasMoreWisata = false;
  bool get hasMoreWisata => _hasMoreWisata;

  bool _isGetWisataSuccess = true;
  bool get isGetWisataSuccess => _isGetWisataSuccess;

  int _currentPage = 1;
  int get currentPage => _currentPage;

  Map<String, bool> _wisataCategory = {};
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

  bool _showSearchHistory = false;
  bool get showSearchHistory => _showSearchHistory;

  List<SearchHistoryModel> _searchHistoryList = [];
  List<SearchHistoryModel> get searchHistoryList => _searchHistoryList;

  final TextEditingController _searchWisataController = TextEditingController();
  TextEditingController get searchWisataController => _searchWisataController;

  final TextEditingController _searchKotaController = TextEditingController();
  TextEditingController get searchKotaController => _searchKotaController;

  late DatabaseHelper dbHelper = DatabaseHelper();

  void onBottomSheetOpened(){
    _listSearchedKota = _listAllKota;
    _searchKotaController.clear();
    _kotaIndex = _listSearchedKota.indexWhere((element) => element == selectedKota);
  }

  void selectKota(int index){
    _kotaIndex = index;
    notifyListeners();
  }

  Future<void> toggleButtonCategory({required int index}) async {
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

  void getSearchHistory({required int userId}) async{
    _searchHistoryList = await dbHelper.getHistory(userId: userId);
    notifyListeners();
  }

  void addSearchHistory({required int userId, required String query}) async{
    int highestId = await dbHelper.getHighestId();

    await dbHelper.addHistory(
      searchHistoryModel: SearchHistoryModel(
        id: highestId + 1,
        userId: userId,
        query: query
      )
    );

    _searchHistoryList = await dbHelper.getHistory(userId: userId);
    notifyListeners();
  }

  void deleteSearchHistory({required int id, required int userId}) async{
    await dbHelper.deleteHistory(id: id);

    _searchHistoryList = await dbHelper.getHistory(userId: userId);
    notifyListeners();
  }

  void onSearchWisataSubmit() {
    _currentPage = 1;
    _listWisata = [];
    _showSearchHistory = false;
    notifyListeners();
  }

  void onSearchWisataTap(){
    _showSearchHistory = true;
    _showSearchPage = true;
    _hasMoreWisata = false;
    notifyListeners();
  }

  void onSearchWisataClear(){
    for (var i = 0; i < _wisataCategory.length; i++) {
      _wisataCategory.update(_wisataCategory.keys.elementAt(i), (value) => false);
    }
    notifyListeners();
  }

  void getWisataInit() async {
    _currentPage = 1;
    _listWisata = [];
    _selectedKota = "Semua Lokasi";
    _showSearchPage = false;
    _showSearchHistory = false;
    _kotaIndex = 0;
    _hasMoreWisata = true;
    _searchWisataController.clear();
    _searchKotaController.clear();

    try {
      _listWisata = await WisataApi().getAllWisata(page: currentPage, listWisata: listWisata);
      _isGetWisataSuccess = true;

      if(_listWisata.length < _currentPage * 6){
        _hasMoreWisata = false;
      } else {
        _hasMoreWisata = true;
      }

      _currentPage +=1;

      notifyListeners();
    } catch (e) {
      _isGetWisataSuccess = false;
      _hasMoreWisata = false;
      notifyListeners();
      throw Exception(e);
    }
  }

  Future<void> getWisataDataByFilter() async {
    _hasMoreWisata = true;
    notifyListeners();

    List<String> selectedCategory = [];

    for(int i = 0; i < _wisataCategory.length; i++){
      if(_wisataCategory.values.elementAt(i) == true){
        selectedCategory.add(_wisataCategory.keys.elementAt(i));
      }
    }

    try {
      if(selectedCategory.isEmpty && _selectedKota == "Semua Lokasi"){
        _listWisata = await WisataApi().getAllWisata(page: _currentPage, listWisata: _listWisata);
      } else {
        _listWisata = await WisataApi().getWisataByFilter(
          page: _currentPage,
          listWisata: _listWisata,
          category: selectedCategory,
          kota: _selectedKota == "Semua Lokasi" ? "" : _selectedKota,
        );
      }
      _isGetWisataSuccess = true;

      if(_listWisata.length < _currentPage * 6){
        _hasMoreWisata = false;
      } else {
        _hasMoreWisata = true;
      }

      _currentPage +=1;

      notifyListeners();
    } catch (e) {
      _isGetWisataSuccess = false;
      _hasMoreWisata = false;
      notifyListeners();
      throw Exception(e);
    }
  }

  Future<void> getWisataDataBySearch({required String searchQuery}) async {
    _hasMoreWisata = true;
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
        listWisata: _listWisata,
        title: searchQuery,
        category: selectedCategory,
      );
      _isGetWisataSuccess = true;

      if(_listWisata.length < _currentPage * 6){
        _hasMoreWisata = false;
      } else {
        _hasMoreWisata = true;
      }

      _currentPage +=1;

      notifyListeners();
    } catch (e) {
      _isGetWisataSuccess = false;
      _hasMoreWisata = false;
      notifyListeners();
      throw Exception(e);
    }
  }

  void getAllKota() async {
    try {
      _listAllKota = await CitiesApi().getAllKota();
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

  void getAllCategories() async {
    try {
      CategoryModels categoryModel = await CategoryApi().getCategoriesApi();
      for (var element in categoryModel.categories) {
        _wisataCategory[element.categoryName] = false;
      }
      notifyListeners();
    } catch (e) {
      _wisataCategory = {};
      notifyListeners();
      throw Exception(e);
    }
  }

  @override
  void dispose() {
    _searchWisataController.dispose();
    _searchKotaController.dispose();
    super.dispose();
  }
}
