import 'package:flutter/material.dart';

class FormConfirmPasswordProvider with ChangeNotifier {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  String? _passwordError;
  String? _confirmPasswordError;
  bool _isPasswordVisible = false;

  String? get passwordError => _passwordError;
  String? get confirmPasswordError => _confirmPasswordError;
  bool get isPasswordVisible => _isPasswordVisible;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get confirmPasswordController => _confirmPasswordController;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  bool validatePassword() {
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

    // Validasi panjang password
    if (password.length <= 2) {
      _passwordError = 'Password harus lebih dari 5 karakter';
      notifyListeners();
      return false;
    }

    if (password != confirmPassword){
      _passwordError = 'Password tidak sama';
      notifyListeners();
      return false;
    }

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
