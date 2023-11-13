import 'package:flutter/material.dart';

class ExploreScreenProvider with ChangeNotifier {
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  List<String> _category = [];
  List<String> get category =>_category;

  List<bool> _isButtonSelected = [false,false,false,false];
  List<bool> get iaButtonSelected => _isButtonSelected;

  
}
