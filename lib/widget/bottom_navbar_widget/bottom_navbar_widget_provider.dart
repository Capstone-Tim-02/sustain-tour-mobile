import 'package:flutter/material.dart';

class BottomNavigationBarProvider with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void onChangeIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}