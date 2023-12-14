import 'package:flutter/material.dart';

class FormPasswordProvider with ChangeNotifier {
  final TextEditingController _passwordController = TextEditingController();
  String? _passwordError;
  bool _isPasswordVisible = false;

  String? get passwordError => _passwordError;
  bool get isPasswordVisible => _isPasswordVisible;
  TextEditingController get passwordController => _passwordController;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  bool validatePassword() {
    String password = _passwordController.text;

    // Lakukan validasi password sesuai kebutuhan
    if (password.isEmpty) {
      _passwordError = 'Password tidak boleh kosong';
      notifyListeners();
      return false;
    } else {
      _passwordError = null; // Menggunakan nullable pada string
      notifyListeners();
      return true;
    }
  }
}
