import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/models/api/detail_wisata_byid_api.dart';
import 'package:sustain_tour_mobile/models/detail_wisata_byid_models/detail_wisata_byid_models.dart';

class DetailWisataProvider extends ChangeNotifier {
  final DetailWisataApi _detailWisataApi = DetailWisataApi();
  DetailWisataByid? _detailWisata;
  bool _isLoading = false;

  DetailWisataByid? get detailWisata => _detailWisata;
  bool get isLoading => _isLoading;

  Future<void> getDetailWisataById(int id) async {
    try {
      _isLoading = true;
      _detailWisata = await _detailWisataApi.getDetailWisataById(id);
      notifyListeners();
    } catch (error) {
      print('Error getting detail wisata: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
