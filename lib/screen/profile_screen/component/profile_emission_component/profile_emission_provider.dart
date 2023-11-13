import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/models/emission_model/emission_api/emission_api.dart';
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

  Future<void> getUserEmission() async {
    try {
      _emissionModel = await EmissionApi.getUserEmission();
    } on DioException catch (e) {
      print(e);
      _emissionModel = EmissionModel(
        code: 0,
        equivalentPoweringHouseInHours: 0,
        error: true,
        roundedTotalCarbonFootprint: 90,
      );
    }
    _isLoading = false;
    notifyListeners();
  }
}
