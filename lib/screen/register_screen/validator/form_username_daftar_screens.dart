import 'package:flutter/material.dart';

class FromUsernameDaftarProvider with ChangeNotifier {
  final TextEditingController _usernameController = TextEditingController();
  String? _usernameError;

  String? get usernameError => _usernameError;
  TextEditingController get usernameController => _usernameController;

  bool validateUsername() {
    String username = _usernameController.text;
    if (username.isEmpty) {
      _usernameError = 'Username tidak boleh kosong';
      notifyListeners();
      return false;
    }

    // Validasi panjang username
    if (username.length <= 5) {
      _usernameError = 'Username harus lebih dari 5 karakter';
      notifyListeners();
      return false;
    }

    // Lakukan validasi username sesuai kebutuhan
    else {
      _usernameError = null; // Menggunakan nullable pada string
      notifyListeners();
      return true;
    }
  }
}
