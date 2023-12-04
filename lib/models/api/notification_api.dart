import 'package:dio/dio.dart';
import 'package:sustain_tour_mobile/constants/api_base_url.dart';
import 'package:sustain_tour_mobile/constants/shared_preference_manager.dart';
import 'package:sustain_tour_mobile/models/notification_model/notification_model.dart';

class NotificationApi {
  static Future<NotificationModel> getNotifications() async {
    String? token = await SharedPreferenceManager.getToken();

    try {
      final response = await Dio().get(
        '$baseUrl/user/notification',
        options: Options(
          headers: {
            "authorization": "Bearer $token",
          },
        ),
      );

      NotificationModel notifModel = NotificationModel.fromJson(response.data);
      return notifModel;
    } on DioException catch (e) {
      throw '${e.response?.data['message']}';
    }
  }
}
