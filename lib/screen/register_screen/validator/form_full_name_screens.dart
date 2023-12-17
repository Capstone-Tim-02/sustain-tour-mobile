import 'package:flutter/material.dart';

class FormFullNameProvider with ChangeNotifier {
  final TextEditingController _fullNameController = TextEditingController();
  String? _fullNameError;

  String? get fullNameError => _fullNameError;
  TextEditingController get fullNameController => _fullNameController;

  bool validateFullName() {
    String fullName = _fullNameController.text;
    if (fullName.isEmpty) {
      _fullNameError = 'Nama tidak boleh kosong';
      notifyListeners();
      return false;
    }

    // Validasi huruf kapital
    else if (fullName.length < 3) {
      _fullNameError = 'Nama minimal 3 karakter';
      notifyListeners();
      return false;
    }

    // Lakukan validasi nama sesuai kebutuhan
    else {
      _fullNameError = null; // Menggunakan nullable pada string
      notifyListeners();
      return true;
    }
  }
}
