import 'package:flutter/material.dart';

class FromUsernameRegisterProvider with ChangeNotifier {
  final TextEditingController _usernameRegisterController =
      TextEditingController();
  String? _usernameRegisterError;

  String? get usernameRegisterError => _usernameRegisterError;
  TextEditingController get usernameRegisterController =>
      _usernameRegisterController;

  bool validateUsernameRegister() {
    String usernameRegister = _usernameRegisterController.text;

    RegExp regex = RegExp(r'^[a-zA-Z0-9]+$');
    if (usernameRegister.isEmpty) {
      _usernameRegisterError = 'Username tidak boleh kosong!';
      notifyListeners();
      return false;
    } else if (usernameRegister.length < 5) {
      _usernameRegisterError = 'Username minimal 5 karakter';
      notifyListeners();
      return false;
    } else if (!regex.hasMatch(usernameRegister)) {
      _usernameRegisterError = 'Hanya boleh menggunakan angka dan huruf';
      notifyListeners();
      return false;
    } else {
      _usernameRegisterError = null;
      notifyListeners();
      return true;
    }
  }
}
