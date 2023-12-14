import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class FromEmailRegisterProvider with ChangeNotifier {
  final TextEditingController _emailRegisterController =
      TextEditingController();
  String? _emailRegisterError;

  String? get emailRegisterError => _emailRegisterError;
  TextEditingController get emailRegisterController => _emailRegisterController;

  bool validateEmailRegister() {
    String emailRegister = _emailRegisterController.text;

    if (emailRegister.isEmpty) {
      _emailRegisterError = 'Email tidak boloh kosong';
      notifyListeners();
      return false;
    } else if (!EmailValidator.validate(emailRegister)) {
      _emailRegisterError = 'Email tidak valid';
      notifyListeners();
      return false;
    } else {
      _emailRegisterError = null;
      notifyListeners();
      return true;
    }
  }
}
