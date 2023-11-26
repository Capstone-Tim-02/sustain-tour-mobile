import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/models/faq_model/faq_model.dart';

class FaqScreenProvider with ChangeNotifier {
  String _valueSearch = "";
  bool _isIconVisible = false;
  final TextEditingController _searchController = TextEditingController();

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
      detail:
          'Maaf, namun kami tidak dapat memproses pengembalian dana melalui metode pembayaran. Hal ini karena, Anda hanya melakukan pembayaran langsung di lokasi wisata yang Anda tuju.',
      link: '',
      additional:
          'Untuk memberikan gambaran yang lebih jelas tentang pengalaman di tempat wisata, kami telah menyediakan deskripsi rinci beserta foto dan video. Kami yakin Anda akan menikmati melihat semua informasi menarik yang telah kami sediakan untuk membuat perjalanan Anda semakin berkesan!',
    ),
    FaqModel(
      tittle:
          'Apakah promo yang tersedia bisa digunakan diseluruh tempat wisata?',
      detail:
          'Kami menyediakan dua kategori promo yang dapat meningkatkan pengalaman liburan Anda. \n \n \n Pertama, terdapat promo yang berlaku di seluruh destinasi wisata yang kami tawarkan. Sedangkan yang kedua, terdapat promo khusus yang hanya dapat digunakan di destinasi wisata tertentu. Untuk memudahkan pemilihan, informasi terkait kategori promo (umum atau khusus) telah kami sertakan pada setiap penawaran.',
      link: '',
      additional:
          'Kami harap ini membantu Anda menentukan pilihan yang sesuai dengan keinginan dan rencana liburan Anda.🌟🎉',
    ),
    FaqModel(
      tittle: 'Apakah jika pembayaran berhasil maka tiket akan diterbitkan?',
      detail: '',
      link: 'www.destimate.com',
      additional: '',
    ),
    FaqModel(
      tittle: 'Apakah bisa melakukan pembatalan tiket?',
      detail:
          'Untuk memudahkan proses pembatalan tiket, Anda dapat mengikuti langkah-langkah berikut: \n \n \n1.Buka halaman tiket. \n2. Pilih tiket yang ingin Anda batalkan. \n3.Setelah masuk ke halaman invoice, temukan tombol pembatalan yang disediakan.',
      link: '',
      additional:
          'Namun, perlu diingat bahwa pembatalan tiket akan mengakibatkan kehilangan poin yang telah terakumulasi sebelumnya. Silakan lakukan pembatalan dengan bijak sesuai kebutuhan Anda. Jika ada pertanyaan lebih lanjut, tim kami siap membantu!',
    ),
    FaqModel(
      tittle:
          'Apakah promo yang tersedia bisa digunakan diseluruh tempat wisata?',
      detail:
          'Kami menyediakan dua kategori promo yang dapat meningkatkan pengalaman liburan Anda. \n \n \n Pertama, terdapat promo yang berlaku di seluruh destinasi wisata yang kami tawarkan. Sedangkan yang kedua, terdapat promo khusus yang hanya dapat digunakan di destinasi wisata tertentu. Untuk memudahkan pemilihan, informasi terkait kategori promo (umum atau khusus) telah kami sertakan pada setiap penawaran.',
      link: '',
      additional:
          'Kami harap ini membantu Anda menentukan pilihan yang sesuai dengan keinginan dan rencana liburan Anda.🌟🎉',
    ),
    FaqModel(
      tittle: 'Apakah jika pembayaran berhasil maka tiket akan diterbitkan?',
      detail: '',
      link: 'www.destimate.com',
      additional: '',
    ),
    FaqModel(
      tittle: 'Apakah bisa melakukan pembatalan tiket?',
      detail:
          'Untuk memudahkan proses pembatalan tiket, Anda dapat mengikuti langkah-langkah berikut: \n \n \n1.Buka halaman tiket. \n2. Pilih tiket yang ingin Anda batalkan. \n3.Setelah masuk ke halaman invoice, temukan tombol pembatalan yang disediakan.',
      link: '',
      additional:
          'Namun, perlu diingat bahwa pembatalan tiket akan mengakibatkan kehilangan poin yang telah terakumulasi sebelumnya. Silakan lakukan pembatalan dengan bijak sesuai kebutuhan Anda. Jika ada pertanyaan lebih lanjut, tim kami siap membantu!',
    ),
  ];

  String get valueSearch => _valueSearch;
  bool get isIconVisible => _isIconVisible;
  TextEditingController get searchController => _searchController;

  List<FaqModel> get searchData => _searchData;
  List<FaqModel> get listFaq => _listfaq;

  // fungsi untuk mengatur visibilitas ikon pada suffixIcon
  void setSuffixIconVisible(bool isVisible) {
    _isIconVisible = isVisible;
    notifyListeners();
  }

  void clearSearch() {
    _valueSearch = '';
    _searchData.clear();
    _searchController.clear();
    setSuffixIconVisible(false);
    notifyListeners();
  }

  void searchFaq(String value) {
    _searchData.clear();

    for (var element in _listfaq) {
      if (element.tittle.toLowerCase().contains(value.trim().toLowerCase())) {
        _searchData.add(element);
      }
    }

    setSuffixIconVisible(true); // Atur visibilitas ikon pada suffixIcon
    notifyListeners();
  }
}
