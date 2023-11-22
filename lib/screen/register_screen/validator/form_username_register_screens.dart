import 'package:flutter/material.dart';

class FromUsernameRegisterProvider with ChangeNotifier {
  final TextEditingController _usernameRegisterController = TextEditingController();
  String? _usernameRegisterError;

  String? get usernameRegisterError => _usernameRegisterError;
  TextEditingController get usernameRegisterController => _usernameRegisterController;

  bool validateUsernameRegister() {
    String usernameRegister = _usernameRegisterController.text;
    if (usernameRegister.isEmpty) {
      _usernameRegisterError = 'Username tidak boleh kosong';
      notifyListeners();
      return false;
    }

    // Validasi panjang username
    if (usernameRegister.length <= 5) {
      _usernameRegisterError = 'Username harus lebih dari 5 karakter';
      notifyListeners();
      return false;
    }

    // Lakukan validasi username sesuai kebutuhan
    else {
      _usernameRegisterError = null; // Menggunakan nullable pada string
      notifyListeners();
      return true;
    }
  }
}
