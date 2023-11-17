import 'package:flutter/material.dart';

class FromNamaPanjangProvider with ChangeNotifier {
  final TextEditingController _namaPanjangController = TextEditingController();
  String? _namaPanjangError;

  String? get namaError => _namaPanjangError;
  TextEditingController get namaController => _namaPanjangController;

  bool validateNama() {
    String namaPanjang = _namaPanjangController.text;
    if (namaPanjang.isEmpty) {
      _namaPanjangError = 'Nama tidak boleh kosong';
      notifyListeners();
      return false;
    }

    // Validasi huruf kapital
    if (!RegExp(r'^[A-Z][a-z]*$').hasMatch(namaPanjang)) {
      _namaPanjangError = 'Nama harus dimulai dari huruf kapital';
      notifyListeners();
      return false;
    }

    // Lakukan validasi nama sesuai kebutuhan
    else {
      _namaPanjangError = null; // Menggunakan nullable pada string
      notifyListeners();
      return true;
    }
  }
}
