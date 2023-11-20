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
    if (!RegExp(r'^[A-Z][a-z]*$').hasMatch(fullName)) {
      _fullNameError = 'Nama harus dimulai dari huruf kapital';
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
