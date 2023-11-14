import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sustain_tour_mobile/models/ai_models/ai_models.dart';

class TokenManager {
  static Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    return token;
  }
}

class AiAPI {
  static Future<AiModels> postDataWithAuthorization({required String message}) async {
    Dio dio = Dio();
    String? token = await TokenManager.getToken();

    if (token != null) {
      try {
        final data = jsonEncode(
          {'message': message},
        );
        Response response = await dio.post(
          'https://destimate.uc.r.appspot.com/chatbot/recommend-wisata',
          data: data,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ),
        );

        if (response.statusCode == 200) {
          return AiModels.fromJson(response.data);
        } else {
          throw Exception('Failed to get a valid response');
        }
      } catch (error) {
        // Handle errors
        // print('Error: $error');
        throw Exception('API request failed: $error');
      }
    } else {
      // Handle case when token is not available
      // print('Token not available');
      throw Exception('Token not available');
    }
  }

  getAnswerFromOpenAI({required String question}) {}
}
