import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sustain_tour_mobile/models/terms_condition_model/terms_condition_model.dart';
import 'package:sustain_tour_mobile/screen/term_condition_screen/component/detail_tnc.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class TermsConditionScreen extends StatelessWidget {
  const TermsConditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<TNCModel> tncData = [
      TNCModel(
        icon: Icon(
          MdiIcons.tooltipQuestion,
          color: ColorThemeStyle.blue100,
          size: 34,
        ),
        tittle: 'Syarat dan Ketentuan',
        subtittle: 'Persyaratan menggunakan destimate',
        desc1:
            'Dokumen ini, yang disebut "Perjanjian Pengguna" ("Perjanjian"), merupakan kontrak antara Anda ("Anda" atau "Pengguna") dan Destimate ("Storetasker", "kami", "kita", atau "kami"). \n \nAnda harus membaca, menyetujui, dan menerima semua syarat dan ketentuan yang terdapat dalam Perjanjian ini untuk dapat menggunakan aplikasi kami. \n \nSemua aplikasi terafiliasi, termasuk situs web yang dimiliki dan dioperasikan oleh kami, pendahulu atau penerus kepentingan kami, atau Afiliasi kami (secara kolektif disebut "Situs"), semua layanan, aplikasi, dan produk yang dapat diakses melalui Situs, dan semua aplikasi seluler Storetasker yang mengaitkan atau merujuk pada Perjanjian ini ("Layanan") baik disediakan oleh kami atau Afiliasi kami.',
        desc2: '',
        desc3: '',
      ),
      TNCModel(
        icon: Icon(
          MdiIcons.bookOutline,
          color: ColorThemeStyle.blue100,
          size: 34,
        ),
        tittle: 'Perjanjian Pengguna',
        subtittle: 'Ketentuan yang harus ditaati',
        desc1:
            'Dokumen ini, yang disebut "Perjanjian Pengguna" ("Perjanjian"), merupakan kontrak antara Anda ("Anda" atau "Pengguna") dan Destimate ("Storetasker", "kami", "kita", atau "kami"). \n \nAnda harus membaca, menyetujui, dan menerima semua syarat dan ketentuan yang terdapat dalam Perjanjian ini untuk dapat menggunakan aplikasi kami. \n \nSemua aplikasi terafiliasi, termasuk situs web yang dimiliki dan dioperasikan oleh kami, pendahulu atau penerus kepentingan kami, atau Afiliasi kami (secara kolektif disebut "Situs"), semua layanan, aplikasi, dan produk yang dapat diakses melalui Situs, dan semua aplikasi seluler Storetasker yang mengaitkan atau merujuk pada Perjanjian ini ("Layanan") baik disediakan oleh kami atau Afiliasi kami.',
        desc2: '',
        desc3: '',
      ),
      TNCModel(
        icon: Icon(
          MdiIcons.shieldAlert,
          color: ColorThemeStyle.blue100,
          size: 34,
        ),
        tittle: 'Kebijakan Privasi',
        subtittle: 'Ketentuan yang harus ditaati',
        desc1:
            'Dokumen ini, yang disebut "Perjanjian Pengguna" ("Perjanjian"), merupakan kontrak antara Anda ("Anda" atau "Pengguna") dan Destimate ("Storetasker", "kami", "kita", atau "kami"). \n \nAnda harus membaca, menyetujui, dan menerima semua syarat dan ketentuan yang terdapat dalam Perjanjian ini untuk dapat menggunakan aplikasi kami. \n \nSemua aplikasi terafiliasi, termasuk situs web yang dimiliki dan dioperasikan oleh kami, pendahulu atau penerus kepentingan kami, atau Afiliasi kami (secara kolektif disebut "Situs"), semua layanan, aplikasi, dan produk yang dapat diakses melalui Situs, dan semua aplikasi seluler Storetasker yang mengaitkan atau merujuk pada Perjanjian ini ("Layanan") baik disediakan oleh kami atau Afiliasi kami.',
        desc2: '',
        desc3: '',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Term & Condition',
          style: TextStyleWidget.titleT2(
            fontWeight: FontWeightStyle.semiBold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: tncData.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailTNC(tncModel: tncData[index]),
                  ),
                );
              },
              child: Container(
                // margin: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(0, 0),
                      spreadRadius: 0,
                    )
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.only(right: 10, left: 16),
                  leading: (tncData[index].icon),
                  title: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 8.0,
                      top: 2.5,
                    ),
                    child: Text(
                      tncData[index].tittle,
                      style: TextStyleWidget.titleT3(
                        fontWeight: FontWeightStyle.medium,
                      ),
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 2.5,
                    ),
                    child: Text(
                      tncData[index].subtittle,
                      style: TextStyleWidget.bodyB3(
                        fontWeight: FontWeightStyle.medium,
                        color: ColorThemeStyle.grey100,
                      ),
                    ),
                  ),
                  trailing: const Icon(Icons.navigate_next),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
