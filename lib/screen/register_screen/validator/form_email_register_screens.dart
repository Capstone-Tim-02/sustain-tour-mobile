import 'package:flutter/material.dart';

class FromEmailRegisterProvider with ChangeNotifier {
  final TextEditingController _emailRegisterController = TextEditingController();
  String? _emailRegisterError;

  String? get emailRegisterError => _emailRegisterError;
  TextEditingController get emailRegisterController => _emailRegisterController;

  bool validateEmailRegister() {
    String emailRegister = _emailRegisterController.text;
    if (emailRegister.isEmpty) {
      _emailRegisterError = 'Email tidak boleh kosong';
      notifyListeners();
      return false;
    }

    // Validasi panjang email
    if (emailRegister.length <= 5) {
      _emailRegisterError = 'Email harus lebih dari 5 karakter';
      notifyListeners();
      return false;
    }

    // Lakukan validasi email sesuai kebutuhan
    else {
      _emailRegisterError = null; // Menggunakan nullable pada string
      notifyListeners();
      return true;
    }
  }
}
