import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sustain_tour_mobile/models/api/carbon_footprint_byid.dart';

class CarbonEmissionProvider extends ChangeNotifier {
  final CarbonFootPrintById _carbonFootPrintById = CarbonFootPrintById();
  double? _totalCarbonFootprint;
  bool _isLoading = false;
  String? _error;

  double? get totalCarbonFootprint => _totalCarbonFootprint;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> getCarbonEmissionById(int id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    try {
      _isLoading = true;
      notifyListeners();

      final Map<String, dynamic> response =
          await _carbonFootPrintById.getCarbonEmissionById(id, token ?? '-');

      if (response['error'] == false) {
        _totalCarbonFootprint = response['total_carbon_footprint'];
        _error = null;
      } else {
        _error = response['message'];
      }
    } catch (error) {
      _error = 'Error: $error';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
