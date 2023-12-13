import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../constants/api_base_url.dart';

class CarbonFootPrintById {
  Future<Map<String, dynamic>> getCarbonEmissionById(
      int id, String token) async {
    final String url = '$baseUrl/carbonfootprintwisata/$id';

    try {
      final response = await http.get(Uri.parse(url), headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      });

      final Map<String, dynamic> jsonResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        return jsonResponse;
      } else {
        throw Exception(
            'Failed to load carbon emission: ${jsonResponse['message']}');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }
}
