import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/models/profile_model/profile_api/profile_api.dart';
import 'package:sustain_tour_mobile/models/profile_model/profile_model.dart';

class ProfileProvider extends ChangeNotifier {
  late ProfileModel _profileModel;
  ProfileModel get profileModel => _profileModel;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  Future<void> getProfile() async {
    _isLoading = true;
    notifyListeners();
    _profileModel = await ProfileApi.getProfile();
    _isLoading = false;
    notifyListeners();
  }
}
