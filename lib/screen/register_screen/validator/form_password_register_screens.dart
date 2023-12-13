import 'package:flutter/material.dart';

class FormPasswordRegisterProvider with ChangeNotifier {
  final TextEditingController _passwordRegisterController = TextEditingController();
  String? _passwordRegisterError;
  bool _isPasswordRegisterVisible = false;

  String? get passwordRegisterError => _passwordRegisterError;
  bool get isPasswordRegisterVisible => _isPasswordRegisterVisible;
  TextEditingController get passwordRegisterController => _passwordRegisterController;

  void togglePasswordRegisterVisibility() {
    _isPasswordRegisterVisible = !_isPasswordRegisterVisible;
    notifyListeners();
  }

  bool validatePasswordRegister() {
    String passwordRegister = _passwordRegisterController.text;

    // Validasi panjang password
    if (passwordRegister.length <= 5) {
      _passwordRegisterError = 'Password harus lebih dari 5 karakter';
      notifyListeners();
      return false;
    }

    // Lakukan validasi password sesuai kebutuhan
    if (passwordRegister.isEmpty) {
      _passwordRegisterError = 'Password tidak boleh kosong';
      notifyListeners();
      return false;
    } else {
      _passwordRegisterError = null; // Menggunakan nullable pada string
      notifyListeners();
      return true;
    }
  }
}
