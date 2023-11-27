import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/models/api/point_history_api.dart';
import 'package:sustain_tour_mobile/models/point_history_model/point_history_model.dart';

class DestiPointProvider extends ChangeNotifier {
  bool _isLoadingHistory = false;
  bool get isLoadingHistory => _isLoadingHistory;

  List<PointsHistory> _listPointHistory = [];
  List<PointsHistory> get listPointHistory => _listPointHistory;

  void getPointHistory() async {
    _isLoadingHistory = true;
    notifyListeners();

    _listPointHistory = await PointHistoryApi().getPointHistoryFromAPI();
    //mengurutkan data yang used dulu baru yang earned
    _listPointHistory.sort(
      (a, b) {
        return a.pointsEarned?.compareTo(b.pointsEarned ?? 0) ?? 0;
      },
    );
    _isLoadingHistory = false;
    notifyListeners();
  }
}
