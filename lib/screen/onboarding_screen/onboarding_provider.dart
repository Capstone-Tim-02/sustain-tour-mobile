import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';

import '../../models/onboarding_models/onboarding_models.dart';

class OnboardingProvider with ChangeNotifier {
  final List<OnboardingModels> _carouselItems = [
    OnboardingModels(
        imagePath: Assets.assetsImagesOnboarding1,
        title: 'Selamat Datang!',
        deskripsi:
            'Selamat datang di Destimate! Ayo jelajahi Indonesia dengan kami.'),
    OnboardingModels(
        imagePath: Assets.assetsImagesOnboarding2,
        title: 'Pengalaman yang Dapat Disesuaikan',
        deskripsi:
            'Sesuaikan preferensi perjalanan Kamu untuk mendapatkan rekomendasi yang sesuai dengan minat dan gaya Anda.'),
    OnboardingModels(
        imagePath: Assets.assetsImagesLogoDestimate,
        title: 'Booking tiket Mudah, Tanpa Repot',
        deskripsi:
            'Dapatkan tiket dengan mudah dan nikmati perjalanan tanpa repot dengan layanan pembelian tiket kami.'),
    OnboardingModels(
        imagePath: Assets.assetsImagesOnboarding4,
        title: 'Diskon Eksklusif untuk Kamu',
        deskripsi:
            'Dapatkan akses ke penawaran eksklusif dan diskon khusus untuk destinasi impian Kamu.'),
  ];

  int _currentIndex = 0;

  List<OnboardingModels> get carouselItems => _carouselItems;
  int get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
