import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sustain_tour_mobile/models/api/register_api.dart';
import 'package:sustain_tour_mobile/models/register_models/register_models.dart';

class RegisterProvider with ChangeNotifier {
  final RegisterApi _apiProvider = RegisterApi();
  String? _token;
  int? _userId;
  String? _message;

  String get message => _message ?? '-';
  String? get token => _token;
  int? get userId => _userId;

  registerProvider() {
    loadData();
  }

  Future<void> loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('token');
    _userId = prefs.getInt('id');
    notifyListeners();
  }

  Future<bool> registerUser(
    String name, String username, String password, String confirmPassword, String email, String phone) async {
    try {
      RegisterModels response = await _apiProvider.register(name, username, password, confirmPassword, email, phone);

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
