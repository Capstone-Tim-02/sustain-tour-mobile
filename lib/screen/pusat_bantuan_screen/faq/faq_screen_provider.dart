import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/models/faq_model/faq_model.dart';

class FaqScreenProvider with ChangeNotifier {
  final String _valueSearch = '';
  final List<FaqModel> _searchData = [];
  final List<FaqModel> _listfaq = [
    FaqModel(
      tittle: 'Bagaimana cara mendaftar sebagai pemilik wisata ?',
      detail:
          'Untuk mendaftarkan wisata anda pada aplikasi destimate anda perlu menghubungi admin yang tertera pada halaman landing page yang kami miliki. Anda dapat mengakses halaman landing page tersebut dengan mengklik link dibawah',
      link: "www.destimate.com",
      additional:
          'Adapun alur dari pendaftarannya adalah \n1. Pemilik tempat wisata mengakses website destimate \n2. Pemilik wisata mengklik tombol ‘Daftar Sekarang’ sehingga akan dialihkan menuju google form untuk menginputkan data yang dibutuhkan',
    ),
    FaqModel(
      tittle:
          'Apakah kita bisa meminta pengembalian dana jika tempat wisata tidak sesuai dengan deskripsi?',
      detail: '',
      link: 'www.destimate.com',
      additional: '',
    ),
    FaqModel(
      tittle:
          'Apakah promo yang tersedia bisa digunakan diseluruh tempat wisata?',
      detail: '',
      link: 'www.destimate.com',
      additional: '',
    ),
    FaqModel(
      tittle: 'Apakah bisa melakukan pembatalan tiket?',
      detail: '',
      link: 'www.destimate.com',
      additional: '',
    ),
  ];

  String get valueSearch => _valueSearch;
  List<FaqModel> get searchData => _searchData;
  List<FaqModel> get listFaq => _listfaq;

  void searchFaq(String value) {
    _searchData.clear();
    if (value.isEmpty) {
      notifyListeners();
      return;
    }

    for (var element in _listfaq) {
      if (element.tittle.toLowerCase().contains(value.trim().toLowerCase())) {
        _searchData.add(element);
      }
    }
    notifyListeners();
  }
}
