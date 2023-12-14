import 'package:flutter/material.dart';

class FormPasswordRegisterProvider with ChangeNotifier {
  final TextEditingController _passwordRegisterController =
      TextEditingController();
  String? _passwordRegisterError;
  bool _isPasswordRegisterVisible = false;

  String? get passwordRegisterError => _passwordRegisterError;
  bool get isPasswordRegisterVisible => _isPasswordRegisterVisible;
  TextEditingController get passwordRegisterController =>
      _passwordRegisterController;

  void togglePasswordRegisterVisibility() {
    _isPasswordRegisterVisible = !_isPasswordRegisterVisible;
    notifyListeners();
  }

  bool validatePasswordRegister() {
    String passwordRegister = _passwordRegisterController.text;

    RegExp regex = RegExp(r'^(?=.*\d)(?=.*[^\d])');
    if (passwordRegister.isEmpty) {
      _passwordRegisterError = 'Password tidak boleh kosong!';
      notifyListeners();
      return false;
    } else if (passwordRegister.length < 8) {
      _passwordRegisterError = 'Password minimal 8 karakter';
      notifyListeners();
      return false;
    } else if (!regex.hasMatch(passwordRegister)) {
      _passwordRegisterError = 'Password harus ada huruf dan angka';
      notifyListeners();
      return false;
    } else {
      _passwordRegisterError = null;
      notifyListeners();
      return true;
    }
  }
}
