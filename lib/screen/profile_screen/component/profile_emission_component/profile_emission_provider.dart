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
      {required int userId}) async {
    try {
      _emissionModel =
          await EmissionApi.getUserEmission(userId: userId);
    } on DioException catch (e) {
      _emissionModel = EmissionModel(
        code: 0,
        equivalentPoweringHouseInHours: 0,
        error: true,
        roundedTotalCarbonFootprint: 0,
      );
      throw Exception(e);
    }
    _isLoading = false;
    notifyListeners();
  }
}
