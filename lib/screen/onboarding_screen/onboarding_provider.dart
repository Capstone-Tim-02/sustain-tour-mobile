import 'package:flutter/material.dart';

import '../../models/onboarding_models/onboarding_models.dart';

class CarouselProvider with ChangeNotifier {
  final List<CarouselItem> _carouselItems = [
    CarouselItem(
        imagePath: 'assets/images/logo_destimate.png',
        title: 'Selamat Datang!',
        deskirsi:
            'Selamat datang di Destimate! Ayo jelajahi Indonesia dengan kami.'),
    CarouselItem(
        imagePath: 'assets/images/onboarding.png',
        title: 'Pengalaman yang Dapat Disesuaikan',
        deskirsi:
            'Sesuaikan preferensi perjalanan Kamu untuk mendapatkan rekomendasi yang sesuai dengan minat dan gaya Anda.'),
    CarouselItem(
        imagePath: 'assets/images/logo_destimate.png',
        title: 'Booking tiket Mudah, Tanpa Repot',
        deskirsi:
            'Dapatkan tiket dengan mudah dan nikmati perjalanan tanpa repot dengan layanan pembelian tiket kami.'),
    CarouselItem(
        imagePath: 'assets/images/onboarding.png',
        title: 'Diskon Eksklusif untuk Kamu',
        deskirsi:
            'Dapatkan akses ke penawaran eksklusif dan diskon khusus untuk destinasi impian Kamu.'),
  ];

  int _currentIndex = 0;

  List<CarouselItem> get carouselItems => _carouselItems;
  int get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
