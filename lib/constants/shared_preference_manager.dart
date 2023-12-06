import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceManager {
  static Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    return token;
  }
  
  //mungkin perlu perbaikan untuk hapus Tokennya
  static Future<void> hapusToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    // token = null;
    // userId = null;
  }
}