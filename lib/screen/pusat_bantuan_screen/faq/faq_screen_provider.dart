import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/models/faq_model/faq_model.dart';

class FaqScreenProvider with ChangeNotifier {
  final String _valueSearch = '';
  final List<FaqModel> _searchData = [];
  final List<FaqModel> _listfaq = [
    FaqModel(
      tittle: 'Bagaimana cara mendaftar sebagai pemilik wisata ?',
      detail:
          'Untuk mendaftarkan wisata anda pada aplikasi destimate anda perlu menghubungi admin yang tertera pada halaman landing page yang kami miliki. Anda dapat mengakses halaman landing page tersebut dengan mengklik link dibawah \n www.destimate.com ',
    ),
    FaqModel(
      tittle:
          'Apakah kita bisa meminta pengembalian dana jika tempat wisata tidak sesui dengan deskripsi?',
      detail:
          'Untuk mendaftarkan wisata anda pada aplikasi destimate anda perlu menghubungi admin yang tertera pada halaman landing page yang kami miliki. Anda dapat mengakses halaman landing page tersebut dengan mengklik link dibawah \n www.destimate.com ',
    ),
    FaqModel(
      tittle:
          'Apakah promo yang tersedia bisa digunakan diseluruh tempat wisata?',
      detail:
          'Untuk mendaftarkan wisata anda pada aplikasi destimate anda perlu menghubungi admin yang tertera pada halaman landing page yang kami miliki. Anda dapat mengakses halaman landing page tersebut dengan mengklik link dibawah \n www.destimate.com ',
    ),
    FaqModel(
      tittle: 'Bagaimana cara mendaftar sebagai pemilik wisata ?',
      detail:
          'Untuk mendaftarkan wisata anda pada aplikasi destimate anda perlu menghubungi admin yang tertera pada halaman landing page yang kami miliki. Anda dapat mengakses halaman landing page tersebut dengan mengklik link dibawah \n www.destimate.com ',
    ),
    FaqModel(
      tittle:
          'Apakah kita bisa meminta pengembalian dana jika tempat wisata tidak sesui dengan deskripsi?',
      detail:
          'Untuk mendaftarkan wisata anda pada aplikasi destimate anda perlu menghubungi admin yang tertera pada halaman landing page yang kami miliki. Anda dapat mengakses halaman landing page tersebut dengan mengklik link dibawah \n www.destimate.com ',
    ),
    FaqModel(
      tittle:
          'Apakah promo yang tersedia bisa digunakan diseluruh tempat febi?',
      detail:
          'Untuk mendaftarkan wisata anda pada aplikasi destimate anda perlu menghubungi admin yang tertera pada halaman landing page yang kami miliki. Anda dapat mengakses halaman landing page tersebut dengan mengklik link dibawah \n www.destimate.com ',
    ),
    FaqModel(
      tittle: 'Bagaimana cara mendaftar sebagai pemilik gabriel ?',
      detail:
          'Untuk mendaftarkan wisata anda pada aplikasi destimate anda perlu menghubungi admin yang tertera pada halaman landing page yang kami miliki. Anda dapat mengakses halaman landing page tersebut dengan mengklik link dibawah \n www.destimate.com ',
    ),
    FaqModel(
      tittle:
          'Apakah kita bisa meminta pengembalian dana jika tempat wisata tidak sesui dengan deskripsi?',
      detail:
          'Untuk mendaftarkan wisata anda pada aplikasi destimate anda perlu menghubungi admin yang tertera pada halaman landing page yang kami miliki. Anda dapat mengakses halaman landing page tersebut dengan mengklik link dibawah \n www.destimate.com ',
    ),
    FaqModel(
      tittle:
          'Apakah promo yang tersedia bisa digunakan diseluruh tempat febi?',
      detail:
          'Untuk mendaftarkan wisata anda pada aplikasi destimate anda perlu menghubungi admin yang tertera pada halaman landing page yang kami miliki. Anda dapat mengakses halaman landing page tersebut dengan mengklik link dibawah \n www.destimate.com ',
    ),
    FaqModel(
      tittle: 'Bagaimana cara mendaftar sebagai pemilik gabriel ?',
      detail:
          'Untuk mendaftarkan wisata anda pada aplikasi destimate anda perlu menghubungi admin yang tertera pada halaman landing page yang kami miliki. Anda dapat mengakses halaman landing page tersebut dengan mengklik link dibawah \n www.destimate.com ',
    ),
    FaqModel(
      tittle:
          'Apakah kita bisa meminta pengembalian dana jika tempat wisata tidak sesui dengan deskripsi?',
      detail:
          'Untuk mendaftarkan wisata anda pada aplikasi destimate anda perlu menghubungi admin yang tertera pada halaman landing page yang kami miliki. Anda dapat mengakses halaman landing page tersebut dengan mengklik link dibawah \n www.destimate.com ',
    ),
    FaqModel(
      tittle:
          'Apakah promo yang tersedia bisa digunakan diseluruh tempat febi?',
      detail:
          'Untuk mendaftarkan wisata anda pada aplikasi destimate anda perlu menghubungi admin yang tertera pada halaman landing page yang kami miliki. Anda dapat mengakses halaman landing page tersebut dengan mengklik link dibawah \n www.destimate.com ',
    ),
    FaqModel(
      tittle: 'Bagaimana cara mendaftar sebagai pemilik gabriel ?',
      detail:
          'Untuk mendaftarkan wisata anda pada aplikasi destimate anda perlu menghubungi admin yang tertera pada halaman landing page yang kami miliki. Anda dapat mengakses halaman landing page tersebut dengan mengklik link dibawah \n www.destimate.com ',
    ),
    FaqModel(
      tittle:
          'Apakah kita bisa meminta pengembalian dana jika tempat wisata tidak sesui dengan deskripsi?',
      detail:
          'Untuk mendaftarkan wisata anda pada aplikasi destimate anda perlu menghubungi admin yang tertera pada halaman landing page yang kami miliki. Anda dapat mengakses halaman landing page tersebut dengan mengklik link dibawah \n www.destimate.com ',
    ),
    FaqModel(
      tittle:
          'Apakah promo yang tersedia bisa digunakan diseluruh tempat febi?',
      detail:
          'Untuk mendaftarkan wisata anda pada aplikasi destimate anda perlu menghubungi admin yang tertera pada halaman landing page yang kami miliki. Anda dapat mengakses halaman landing page tersebut dengan mengklik link dibawah \n www.destimate.com ',
    ),
    FaqModel(
      tittle: 'Bagaimana cara mendaftar sebagai pemilik gabriel ?',
      detail:
          'Untuk mendaftarkan wisata anda pada aplikasi destimate anda perlu menghubungi admin yang tertera pada halaman landing page yang kami miliki. Anda dapat mengakses halaman landing page tersebut dengan mengklik link dibawah \n www.destimate.com ',
    ),
    FaqModel(
      tittle:
          'Apakah kita bisa meminta pengembalian dana jika tempat wisata tidak sesui dengan deskripsi?',
      detail:
          'Untuk mendaftarkan wisata anda pada aplikasi destimate anda perlu menghubungi admin yang tertera pada halaman landing page yang kami miliki. Anda dapat mengakses halaman landing page tersebut dengan mengklik link dibawah \n www.destimate.com ',
    ),
    FaqModel(
      tittle: 'Pertanyaan terakhir?',
      detail:
          'Untuk mendaftarkan wisata anda pada aplikasi destimate anda perlu menghubungi admin yang tertera pada halaman landing page yang kami miliki. Anda dapat mengakses halaman landing page tersebut dengan mengklik link dibawah \n www.destimate.com ',
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
