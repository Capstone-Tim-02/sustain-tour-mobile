import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/models/api/category_api.dart';

import '../../../models/matchmaking_models/category_models.dart';

class CategoryProvider with ChangeNotifier {
  final CategoryApi _apiProvider = CategoryApi();
  List<Category> _categories = [];

  List<Category> get categories => _categories;

  Future<void> getCategories() async {
    try {
      CategoryModels categoryModels =
          await _apiProvider.getCategoriesApi();
      _categories = categoryModels.categories;
      notifyListeners();
    } catch (error) {
      throw Exception(error);
    }
  }
}
