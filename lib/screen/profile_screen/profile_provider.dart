import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/models/api/user_data_api.dart';
import 'package:sustain_tour_mobile/models/user_data_models/user_data_models.dart';

class ProfileProvider extends ChangeNotifier {
  late User _user;
  User get user => _user;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  Future<void> getUserData({required int userId, required String token}) async {
    _isLoading = true;
    notifyListeners();
    _user = await UserDataApi().getUserData(userId: userId, token: token);
    _isLoading = false;
    notifyListeners();
  }
}
