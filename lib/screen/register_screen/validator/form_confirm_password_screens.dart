import 'package:flutter/material.dart';
import 'form_password_register_screens.dart';

class FormConfirmPasswordProvider with ChangeNotifier {
  final TextEditingController _confirmPasswordController = TextEditingController();
  String? _confirmPasswordError;
  bool _isConfirmPasswordVisible = false;

  String? get confirmPasswordError => _confirmPasswordError;
  bool get isConfirmPasswordVisible => _isConfirmPasswordVisible;
  TextEditingController get confirmPasswordController => _confirmPasswordController;

  void toggleConfirmPasswordVisibility() {
    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    notifyListeners();
  }

  bool validateConfirmPassword() {
    String confirmPassword = _confirmPasswordController.text;

    // Validasi panjang password
    if (confirmPassword.length <= 5) {
      _confirmPasswordError = 'Password harus lebih dari 5 karakter';
      notifyListeners();
      return false;
    }

    if (confirmPassword != FormPasswordRegisterProvider){
      _confirmPasswordError = 'Password tidak sama';
      notifyListeners();
      return false;
    }

    // Lakukan validasi password sesuai kebutuhan
    if (confirmPassword.isEmpty) {
      _confirmPasswordError = 'Password tidak boleh kosong';
      notifyListeners();
      return false;
    } else {
      _confirmPasswordError = null; // Menggunakan nullable pada string
      notifyListeners();
      return true;
    }
  }
}
