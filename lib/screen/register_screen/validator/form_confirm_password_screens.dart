import 'package:flutter/material.dart';

class FormConfirmPasswordProvider with ChangeNotifier {
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  String? _confirmPasswordError;
  bool _isConfirmPasswordVisible = false;

  String? get confirmPasswordError => _confirmPasswordError;
  bool get isConfirmPasswordVisible => _isConfirmPasswordVisible;
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;

  void toggleConfirmPasswordVisibility() {
    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    notifyListeners();
  }

  bool validateConfirmPassword({required String password}) {
    String confirmPassword = _confirmPasswordController.text;

    if (confirmPassword != password) {
      _confirmPasswordError = 'Password tidak sama';
      notifyListeners();
      return false;
    } else {
      _confirmPasswordError = null; // Menggunakan nullable pada string
      notifyListeners();
      return true;
    }
  }
}
