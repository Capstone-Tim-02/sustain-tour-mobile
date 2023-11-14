import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/screen/login_screen/login_provider.dart';

class SplashScreenProvider with ChangeNotifier {
  bool _isLoading = true;
  bool _hasToken = false;

  bool get isLoading => _isLoading;
  bool get hasToken => _hasToken;

  Future<void> loadDataSplashScreen(BuildContext context) async {
    LoginProvider authProvider =
        Provider.of<LoginProvider>(context, listen: false);
    await authProvider.loadToken();

    _hasToken = authProvider.token != null;

    await Future.delayed(const Duration(seconds: 3));
    _isLoading = false;
    notifyListeners();
  }
}
