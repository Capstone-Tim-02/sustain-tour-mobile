import 'package:flutter/material.dart';

class TiketProvider extends ChangeNotifier {
  int _tabIndex = 0;
  int get tabIndex => _tabIndex;

  void setTabIndex({required int index}) {
    _tabIndex = index;
    notifyListeners();
  }
}
