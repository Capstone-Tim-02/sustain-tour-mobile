import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sustain_tour_mobile/api/login_api/login_api.dart';
import 'package:sustain_tour_mobile/models/login_models/login_models.dart';

class LoginProvider with ChangeNotifier {
  final LoginApi _apiProvider = LoginApi();
  String? _token;
  String? _message;

  String get message => _message ?? '-';
  String? get token => _token;

  LoginProvider() {
    loadToken();
  }

  Future<void> loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('token');
    notifyListeners();
  }

  Future<bool> loginUser(String username, String password) async {
    try {
      LoginModels response = await _apiProvider.login(username, password);

      if (response.code == 200) {
        _message = response.message;
        _token = response.token;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', _token!);
        notifyListeners();
        return true;
      } else if (response.code == 401) {
        _message = response.message;
        notifyListeners();
        return false;
      } else {
        _message = 'Error Server';
        notifyListeners();
        return false;
      }
    } on DioException catch (error) {
      if (error.response!.statusCode == 401) {
        _message = 'Invalid Username or Password';
      }
      notifyListeners();
      return false;
    }
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    _token = null;
    notifyListeners();
  }
}
