import 'package:flutter/material.dart';

class EditAccountProvider extends ChangeNotifier {
  final TextEditingController _nameController = TextEditingController();
  TextEditingController get nameController => _nameController;

  String _currentName = '';
  String get currentName => _currentName;

  void setNameContollerText({required String text}) {
    _nameController.text = text;
    notifyListeners();
  }

  void setName({required String name}) {
    _currentName = name;
    notifyListeners();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}
