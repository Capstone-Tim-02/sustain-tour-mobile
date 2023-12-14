import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/screen/login_screen/login_provider.dart';

class SplashScreenProvider with ChangeNotifier {
  bool _isLoading = true;
  String _hasToken = '';
  int _hasId = 0;

  bool get isLoading => _isLoading;
  String get hasToken => _hasToken;
  int get hasId => _hasId;

  Future<void> loadDataSplashScreen(BuildContext context) async {
    LoginProvider authProvider =
        Provider.of<LoginProvider>(context, listen: false);
    await authProvider.loadData();

    _hasToken = authProvider.token ?? '';
    _hasId = authProvider.userId ?? 0;

    await Future.delayed(const Duration(seconds: 1));
    _isLoading = false;
    notifyListeners();
  }
}
