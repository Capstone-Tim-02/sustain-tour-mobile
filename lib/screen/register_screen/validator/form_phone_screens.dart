import 'package:flutter/material.dart';

class FromPhoneProvider with ChangeNotifier {
  final TextEditingController _phoneController = TextEditingController();
  String? _phoneError;

  String? get phoneError => _phoneError;
  TextEditingController get phoneController => _phoneController;

  bool validatePhone() {
    String phone = _phoneController.text;

    RegExp regExp = RegExp(r'^[0-9]+$');
    if (phone.isEmpty) {
      _phoneError = 'No Handphone tidak boleh kosong';
      notifyListeners();
      return false;
    } else if (!regExp.hasMatch(phone)) {
      _phoneError = 'No Handphone hanya boleh angka';
      notifyListeners();
      return false;
    } else if (phone.length < 10) {
      _phoneError = 'No Handphone minimal 10 digit';
      notifyListeners();
      return false;
    } else if (phone.length > 12) {
      _phoneError = 'No Handphone maksimal 12 digit';
      notifyListeners();
      return false;
    } else {
      _phoneError = null;
      notifyListeners();
      return true;
    }
  }
}
