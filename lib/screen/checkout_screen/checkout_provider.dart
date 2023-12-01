import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sustain_tour_mobile/constants/shared_preference_manager.dart';
import 'package:sustain_tour_mobile/models/api/promo_api.dart';
import 'package:sustain_tour_mobile/models/booking_models/booking_request_body_models.dart';
import 'package:sustain_tour_mobile/models/promo_models/promo_models.dart';

class CheckoutProvider extends ChangeNotifier {
  int _quantity = 1;
  int get quantity => _quantity;

  bool _isPointUsed = false;
  bool get isPointUsed => _isPointUsed;

  bool _isGetPromoSuccess = false;
  bool get isGetPromoSuccess => _isGetPromoSuccess;

  bool _isPromoUsed = false;
  bool get isPromoUsed => _isPromoUsed;

  int _usedPromoIndex = -1;
  int get usedPromoIndex => _usedPromoIndex;

  int _copyKodeIndex = -1;
  int get copyKodeIndex => _copyKodeIndex;

  String _kodeVoucher = "";
  String get kodeVoucher => _kodeVoucher;

  final TextEditingController _usePromoController = TextEditingController();
  TextEditingController get usePromoController => _usePromoController;

  bool _isLoadingPromo = false;
  bool get isLoadingPromo => _isLoadingPromo;

  int _discountPercentage = 0;
  int get discountPercentage => _discountPercentage;

  List<Promo> _listAllPromo = [];
  List<Promo> get listAllPromo => _listAllPromo;

  String _message = "";
  String get message => _message;

  BookingRequestBodyModel? _requestBodyModel;
  BookingRequestBodyModel? get requestBodyModel => _requestBodyModel;

  void incrementQuantity() {
    _quantity++;
    notifyListeners();
  }

  void decrementQuantity() {
    _quantity = max(_quantity-1, 1);
    notifyListeners();
  }

  void togglePoin(bool value) {
    _isPointUsed = value;
    notifyListeners();
  }

  void getUserPromo() async {
    try {
      _isLoadingPromo = true;
      notifyListeners();
      String token = await SharedPreferenceManager.getToken() ?? "";
      _listAllPromo = await PromoApi().getUserPromo(token: token);

      _isGetPromoSuccess = true;
      _isLoadingPromo = false;
      notifyListeners();
    } catch (e) {
      _isGetPromoSuccess = false;
      _isLoadingPromo = false;
      throw Exception(e);
    }
  }

  void onCopyPromo(int index){
    _copyKodeIndex = index;
    notifyListeners();
  }

  void onUsePromo(String kodeVoucher) {
    _message = "";
    _isPromoUsed = false;
    _usedPromoIndex = -1;
    _kodeVoucher = "";
    _discountPercentage = 0;

    for(int i = 0; i< _listAllPromo.length;i++){
      if(_listAllPromo[i].kodeVoucher == kodeVoucher){
        if(listAllPromo[i].statusAktif == true){
          _isPromoUsed = true;
          _usedPromoIndex = i;
          _message = "Kode berhasil digunakan!";
          _kodeVoucher = kodeVoucher;
          _discountPercentage = listAllPromo[i].jumlahPotonganPersen;
          break;
        } else {
          _message = "Kode yang kamu masukkan sudah kadaluwarsa";
          break;
        }
      }
    }

    if(_isPromoUsed == false && message == ""){
      _message = "Kode yang kamu masukkan tidak ditemukan";
    }

    notifyListeners();
  }

  void onCancelPromo(){
    _isPromoUsed = false;
    _usedPromoIndex = -1;
    _usePromoController.clear();
    _kodeVoucher = "";
    _discountPercentage = 0;
    notifyListeners();
  }

  void onBooking({required int wisataId, required DateTime checkinBooking}){
    _requestBodyModel = BookingRequestBodyModel(
      wisataId: wisataId,
      useAllPoints: _isPointUsed,
      kodeVoucher: kodeVoucher,
      quantity: quantity,
      checkinBooking: DateFormat('yyyy-MM-dd').format(checkinBooking)
    );
  }

  void checkoutProviderReset(){
    _quantity = 1;
    _isPointUsed = false;
    _isGetPromoSuccess = false;
    _isPromoUsed = false;
    _usedPromoIndex = -1;
    _copyKodeIndex = -1;
    _kodeVoucher = "";
    _isLoadingPromo = false;
    _discountPercentage = 0;
    _message = "";
    _requestBodyModel = null;
    _usePromoController.clear();
  }

  @override
  void dispose() {
    _usePromoController.dispose();
    super.dispose();
  }
}