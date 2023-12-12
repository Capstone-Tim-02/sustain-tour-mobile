import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/models/api/detail_wisata_byid_api.dart';
import 'package:sustain_tour_mobile/models/detail_wisata_byid_models/detail_wisata_byid_models.dart';

class DetailWisataProvider extends ChangeNotifier {
  final DetailWisataApi _detailWisataApi = DetailWisataApi();
  DetailWisataByid? _detailWisata;

  DetailWisataByid? get detailWisata => _detailWisata;

  Future<void> getDetailWisataById(int id, String token) async {
    try {
      _detailWisata = await _detailWisataApi.getDetailWisataById(id, token);
      notifyListeners();
    } catch (error) {
      print('Error getting detail wisata: $error');
    }
  }
}
