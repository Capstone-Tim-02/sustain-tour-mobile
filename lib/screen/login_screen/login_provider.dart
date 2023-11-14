import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sustain_tour_mobile/models/api/login_api.dart';
import 'package:sustain_tour_mobile/models/login_models/login_models.dart';

class LoginProvider with ChangeNotifier {
  final LoginApi _apiProvider = LoginApi();
  String? _token;
  String? _userId;
  String? _message;

  String get message => _message ?? '-';
  String? get token => _token;
  String? get userId => _userId;

  LoginProvider() {
    loadToken();
    loadUserId();
  }
  // Future<void> loginDenganGogle() async {
  //   Uri url =
  //       Uri.parse('https://destimate.uc.r.appspot.com/auth/google/initiate');

  //   try {
  //     if (await canLaunchUrl(url)) {
  //       await launchUrl(url);
  //     } else {
  //       throw Exception('Could not launch $url');
  //     }
  //   } catch (e) {
  //   }
  // }

  Future<void> loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('token');
    notifyListeners();
  }

  Future<void> loadUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _userId = prefs.getString('id');
    notifyListeners();
  }

  Future<bool> loginUser(String username, String password) async {
    try {
      LoginModels response = await _apiProvider.login(username, password);

      if (response.code == 200) {
        _message = response.message;
        _token = response.token;
        _userId = response.id.toString();
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', _token!);
        await prefs.setString('id', _userId!);
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
