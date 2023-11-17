import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sustain_tour_mobile/models/api/login_api.dart';
import 'package:sustain_tour_mobile/models/login_models/login_models.dart';

class LoginProvider with ChangeNotifier {
  final LoginApi _apiProvider = LoginApi();
  String? _token;
  int? _userId;
  String? _message;

  String get message => _message ?? '-';
  String? get token => _token;
  int? get userId => _userId;

  LoginProvider() {
    loadData();
  }

  Future<void> loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      _token = prefs.getString('token');
      _userId = prefs.getInt('id');
      notifyListeners();
    } catch (e) {
      e.toString();
    }
  }

  Future<bool> loginUser(String username, String password) async {
    try {
      LoginModels response = await _apiProvider.login(username, password);

      if (response.code == 200) {
        _message = response.message;
        _token = response.token;
        _userId = response.id;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', _token!);
        await prefs.setInt('id', _userId!);
        notifyListeners();
      }
      return true;
    } catch (error) {
      _message = error.toString();
      notifyListeners();
      return false;
    }
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    _token = null;
    _userId = null;
    notifyListeners();
  }
}
