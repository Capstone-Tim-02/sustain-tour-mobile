import 'package:flutter/material.dart';

class FromPhoneProvider with ChangeNotifier {
  final TextEditingController _phoneController = TextEditingController();
  String? _phoneError;

  String? get phoneError => _phoneError;
  TextEditingController get phoneController => _phoneController;

  bool validatePhone() {
    String phone = _phoneController.text;
    if (phone.isEmpty) {
      _phoneError = 'Nomor HP tidak boleh kosong';
      notifyListeners();
      return false;
    }

    // Validasi panjang Nomor HP
    if (phone.length < 8 || phone.length > 15) {
      _phoneError = 'Nomor HP harus terdiri dari 8-15 angka';
      notifyListeners();
      return false;
    }

    if (!RegExp(r'^\d+$').hasMatch(phone)) {
      _phoneError = 'Nomor telepon harus terdiri dari angka saja';
      notifyListeners();
      return false;
    }

    // Lakukan validasi Nomor HP sesuai kebutuhan
    else {
      _phoneError = null; // Menggunakan nullable pada string
      notifyListeners();
      return true;
    }
  }
}
