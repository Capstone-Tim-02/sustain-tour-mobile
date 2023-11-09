import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/models/faq_model/faq_model.dart';
import 'package:sustain_tour_mobile/screen/pusat_bantuan_screen/faq/detail_faq_screen.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
import 'package:sustain_tour_mobile/widget/text_field_widget.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({super.key});

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  String valueSearch = '';
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
          'Apakah promo yang tersedia bisa digunakan diseluruh tempat wisata?',
      detail:
          'Untuk mendaftarkan wisata anda pada aplikasi destimate anda perlu menghubungi admin yang tertera pada halaman landing page yang kami miliki. Anda dapat mengakses halaman landing page tersebut dengan mengklik link dibawah \n www.destimate.com ',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    String? errorText;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'FAQ',
          style: TextStyleWidget.titleT2(
            fontWeight: FontWeightStyle.semiBold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 96,
            width: 340,
            child: Text(
              'Temukan jawaban mengenai permasalahan mengenai aplikasi Destimate',
              textAlign: TextAlign.start,
              style: TextStyleWidget.titleT1(
                fontWeight: FontWeightStyle.semiBold,
              ),
            ),
          ),
          const SizedBox(height: 32),
          SizedBox(
            height: 60,
            width: 374,
            child: TextFieldWidget(
                labelText: 'Search',
                hintText: 'Apakah saya',
                errorText: errorText,
                prefixIcon: const Icon(Icons.search),
                onChange: (String value) {
                  searchFaq(value);
                }),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 32,
              ),
              child: _searchData.isNotEmpty || valueSearch.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: _searchData.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailFaqScreen(
                                  faqModel: _searchData[index],
                                ),
                              ),
                            );
                          },
                          child: Card(
                            elevation: 2,
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            child: ListTile(
                              trailing:
                                  const Icon(Icons.arrow_forward_ios, size: 16),
                              title: Text(_searchData[index].tittle),
                            ),
                          ),
                        );
                      },
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: _listfaq.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailFaqScreen(
                                  faqModel: _listfaq[index],
                                ),
                              ),
                            );
                          },
                          child: Card(
                            elevation: 2,
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            child: ListTile(
                              trailing:
                                  const Icon(Icons.arrow_forward_ios, size: 16),
                              title: Text(_listfaq[index].tittle),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }

  void searchFaq(String value) {
    _searchData.clear();
    if (value.isEmpty) {
      setState(() {});
      return;
    }

    for (var element in _listfaq) {
      if (element.tittle.toLowerCase().contains(value.trim().toLowerCase())) {
        _searchData.add(element);
      }
    }
    setState(() {});
  }
}
