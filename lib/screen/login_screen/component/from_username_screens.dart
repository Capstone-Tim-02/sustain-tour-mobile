import 'package:flutter/material.dart';

class FromUsernameProvider with ChangeNotifier {
  final TextEditingController _emailController = TextEditingController();
  String? _emailError;

  String? get emailError => _emailError;
  TextEditingController get emailController => _emailController;

  bool validateEmail() {
    String email = _emailController.text;
    if (email.isEmpty) {
      _emailError = 'Email tidak boleh kosong';
      notifyListeners();
      return false;
    }

    // Validasi panjang email
    if (email.length <= 5) {
      _emailError = 'Email harus lebih dari 5 karakter';
      notifyListeners();
      return false;
    }

    // Lakukan validasi email sesuai kebutuhan
    else {
      _emailError = null; // Menggunakan nullable pada string
      notifyListeners();
      return true;
    }
  }
}
