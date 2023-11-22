import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class EditAccountProvider extends ChangeNotifier {
  final TextEditingController _controller = TextEditingController();
  TextEditingController get controller => _controller;

  String _errorText = '';
  String get errorText => _errorText;

  String _errorTextCurrentPassword = '';
  String get errorTextCurrentPassword => _errorTextCurrentPassword;

  String _errorTextNewPassword = '';
  String get errorTextNewPassword => _errorTextNewPassword;

  String _errorTextConfirmNewPassword = '';
  String get errorTextConfirmNewPassword => _errorTextConfirmNewPassword;

  String _currentName = '';
  String get currentName => _currentName;

  String _currentUsername = '';
  String get currentUsername => _currentUsername;

  String _currentNoHp = '';
  String get currentNoHp => _currentNoHp;

  String _currentEmail = '';
  String get currentEmail => _currentEmail;

  String _currentPassword = '';
  String get currentPassword => _currentPassword;

  String _newPassword = '';
  String get newPassword => _newPassword;

  String _confirmNewPassword = '';
  String get confirmNewPassword => _confirmNewPassword;

  void setName({required String name, bool listen = true}) {
    _currentName = name;
    if (listen) {
      notifyListeners();
    }
  }

  void setUsername({required String username, bool listen = true}) {
    _currentUsername = username;
    if (listen) {
      notifyListeners();
    }
  }

  void setNoHandphone({required String noHp, bool listen = true}) {
    _currentNoHp = noHp;
    if (listen) {
      notifyListeners();
    }
  }

  void setEmail({required String email, bool listen = true}) {
    _currentEmail = email;
    if (listen) {
      notifyListeners();
    }
  }

  void setCurrentPassword(
      {required String currentPasswordVal, bool listen = true}) {
    _currentPassword = currentPasswordVal;
    if (listen) {
      notifyListeners();
    }
  }

  void setNewPassword({required String newPasswordVal, bool listen = true}) {
    _newPassword = newPasswordVal;
    if (listen) {
      notifyListeners();
    }
  }

  void setConfirmNewPassword(
      {required String confirmNewPasswordVal, bool listen = true}) {
    _confirmNewPassword = confirmNewPasswordVal;
    if (listen) {
      notifyListeners();
    }
  }

  void errorTextName() {
    if (_currentName.isEmpty) {
      _errorText = 'Nama tidak boleh kosong!';
    } else if (_currentName.length < 3) {
      _errorText = 'Nama minimal 3 karakter';
    } else {
      _errorText = '';
    }
  }

  void errorTextCurrentPasswordSetter() {
    if (_currentPassword.isEmpty) {
      _errorTextCurrentPassword = 'Field ini tidak boleh kosong!';
    } else {
      _errorTextCurrentPassword = '';
    }
  }

  void errorTextNewPasswordSetter() {
    RegExp regex = RegExp(r'^(?=.*\d)(?=.*[^\d])');
    if (_newPassword.isEmpty) {
      _errorTextNewPassword = 'Password tidak boleh kosong!';
    } else if (_newPassword.length < 8) {
      _errorTextNewPassword = 'Password minimal 8 karakter';
    } else if (!regex.hasMatch(_newPassword)) {
      _errorTextNewPassword = 'Password harus ada huruf dan angka';
    } else {
      _errorTextNewPassword = '';
    }
  }

  void errorTextConfirmNewPasswordSetter() {
    if (_newPassword != _confirmNewPassword) {
      _errorTextConfirmNewPassword = 'Password tidak sama';
    } else {
      _errorTextConfirmNewPassword = '';
    }
  }

  void errorTextUsername() {
    RegExp regex = RegExp(r'^[a-zA-Z0-9]+$');
    if (_currentUsername.isEmpty) {
      _errorText = 'Username tidak boleh kosong!';
    } else if (_currentUsername.length < 5) {
      _errorText = 'Username minimal 5 karakter';
    } else if (!regex.hasMatch(_currentUsername)) {
      _errorText = 'Hanya boleh menggunakan angka dan huruf';
    } else {
      _errorText = '';
    }
  }

  void errorTextNoHp() {
    RegExp regExp = RegExp(r'^[0-9]+$');
    if (_currentNoHp.isEmpty) {
      _errorText = 'No Handphone tidak boleh kosong';
    } else if (!regExp.hasMatch(_currentNoHp)) {
      _errorText = 'No Handphone hanya boleh angka';
    } else if (_currentNoHp.length < 10) {
      _errorText = 'No Handphone minimal 10 digit';
    } else if (_currentNoHp.length > 12) {
      _errorText = 'No Handphone maksimal 12 digit';
    } else {
      _errorText = '';
    }
  }

  void errorTextEmail() {
    if (_currentEmail.isEmpty) {
      _errorText = 'Email tidak boloh kosong';
    } else if (!EmailValidator.validate(_currentEmail)) {
      _errorText = 'Email tidak valid';
    } else {
      _errorText = '';
    }
  }

  void clearErrorText() {
    _errorText = '';
  }

  void clearErrorTextCurrentPassword() {
    _errorTextCurrentPassword = '';
  }

  void clearErrorTextNewPassword() {
    _errorTextNewPassword = '';
  }

  void clearErrorTextConfirmNewPassword() {
    _errorTextConfirmNewPassword = '';
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
