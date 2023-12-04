import 'package:dio/dio.dart';
import 'package:sustain_tour_mobile/constants/api_base_url.dart';
import 'package:sustain_tour_mobile/constants/shared_preference_manager.dart';
import 'package:sustain_tour_mobile/models/point_history_model/point_history_model.dart';

class PointHistoryApi {
  Future<List<PointsHistory>> getPointHistoryFromAPI() async {
    String? token = await SharedPreferenceManager.getToken();

    final response = await Dio().get(
      '$baseUrl/user/points/history',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
    List<PointsHistory> listPointHistory = [];

    List<dynamic> responseData = response.data["points_history"];

    if (response.statusCode == 200) {
      for (var element in responseData) {
        listPointHistory.add(PointsHistory.fromJson(element));
      }
    } else {
      return listPointHistory = [];
    }

    return listPointHistory;
  }
}
