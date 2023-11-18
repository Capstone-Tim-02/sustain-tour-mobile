import 'package:flutter/foundation.dart';
import '../../../models/api/category_kesukaan_api.dart';

class CategoryKesukaanProvider extends ChangeNotifier {
  final CategoryKesukaanApi _apiClient = CategoryKesukaanApi();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> updateCategoryKesukaan(
      int userId, String token, String newCategoryKesukaan) async {
    try {
      _setLoading(true);
      await _apiClient.updateCategoryKesukaan(
          userId, token, newCategoryKesukaan);
    } catch (error) {
      error.toString();
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }
}
