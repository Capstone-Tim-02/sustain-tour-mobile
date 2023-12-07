import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/models/api/emission_api.dart';
import 'package:sustain_tour_mobile/models/emission_model/emission_model.dart';

class ProfileEmissionProvider extends ChangeNotifier {
  EmissionModel _emissionModel = EmissionModel(
      code: 0,
      equivalentPoweringHouseInHours: 0,
      error: true,
      roundedTotalCarbonFootprint: 0);
  EmissionModel get emissionModel => _emissionModel;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  Future<void> getUserEmission(
      {required int userId, required String token}) async {
    try {
      _emissionModel =
          await EmissionApi.getUserEmission(userId: userId, token: token);
    } on DioException catch (e) {
      print('emission bad request token invalid : $e');
      _emissionModel = EmissionModel(
        code: 0,
        equivalentPoweringHouseInHours: 0,
        error: true,
        roundedTotalCarbonFootprint: 0,
      );
    }
    _isLoading = false;
    notifyListeners();
  }
}
