import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/constants/custom_icons.dart';
import 'package:sustain_tour_mobile/screen/pusat_bantuan_screen/faq/component/detail_faq_screen.dart';
import 'package:sustain_tour_mobile/screen/pusat_bantuan_screen/faq/component/s_widget.dart';
import 'package:sustain_tour_mobile/screen/pusat_bantuan_screen/faq/faq_screen_provider.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class FaqScreen extends StatelessWidget {
  FaqScreen({Key? key}) : super(key: key);
  final Uri _url = Uri.parse('https://wa.me/6285173412286');
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final faqProvider = Provider.of<FaqScreenProvider>(context);

    String? errorText;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'FAQ',
          style: TextStyleWidget.titleT2(
            fontWeight: FontWeightStyle.semiBold,
          ),
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 96,
              width: 330,
              child: Text(
                'Kami menyediakan jawaban dari permasalahan yang kamu alami',
                textAlign: TextAlign.start,
                style: TextStyleWidget.titleT1(
                  fontWeight: FontWeightStyle.semiBold,
                ),
              ),
            ),
            const SizedBox(height: 32),
            // const TextFieldPassword(),
            SizedBox(
              height: 56,
              width: 374,
              child: SWidget(
                hintText: 'Cari Pertanyaan',
                errorText: errorText,
                controller: faqProvider.searchController,
                suffixIcon: Consumer<FaqScreenProvider>(
                  builder: (context, faqScreenProvider, child) {
                    return faqScreenProvider.isIconVisible
                        ? IconButton(
                            onPressed: () {
                              faqScreenProvider.clearSearch();
                            },
                            icon: const Icon(
                              Icons.clear,
                              color: ColorThemeStyle.blue100,
                            ),
                          )
                        : const SizedBox(
                            height: 4,
                            width: 4,
                          ); // Pastikan mengembalikan Icon ketika isIconVisible false
                  },
                ),
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Icon(
                    CustomIcons.search,
                    size: 24,
                    color: ColorThemeStyle.blue100,
                  ),
                ),
                // controller: quesController,
                onChange: (String value) {
                  faqProvider.searchFaq(value);
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
                child: faqProvider.searchData.isNotEmpty ||
                        faqProvider.valueSearch.isNotEmpty
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: faqProvider.searchData.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailFaqScreen(
                                          faqModel:
                                              faqProvider.searchData[index],
                                        ),
                                      ),
                                    );
                                  },
                                  child: Card(
                                    elevation: 0.5,
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: ListTile(
                                      trailing: const Icon(
                                          Icons.arrow_forward_ios,
                                          size: 16),
                                      title: Text(
                                        faqProvider.searchData[index].tittle,
                                        style: TextStyleWidget.bodyB3(
                                          fontWeight: FontWeightStyle.medium,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      )
                    :
                    // Text('data kosong')
                    Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: faqProvider.listFaq.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailFaqScreen(
                                          faqModel: faqProvider.listFaq[index],
                                        ),
                                      ),
                                    );
                                  },
                                  child: Card(
                                    elevation: 0.5,
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: ListTile(
                                      trailing: const Icon(
                                          Icons.arrow_forward_ios,
                                          size: 16),
                                      title: Text(
                                        faqProvider.listFaq[index].tittle,
                                        style: TextStyleWidget.bodyB3(
                                          fontWeight: FontWeightStyle.medium,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 32,
                              left: 38,
                              right: 38,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Jika kamu tidak menemukan jawaban hubungi contact person kami dengan ',
                                  textAlign: TextAlign.center,
                                  style: TextStyleWidget.bodyB3(
                                    fontWeight: FontWeightStyle.semiBold,
                                  ),
                                ),
                                TextButton(
                                  onPressed: _launchUrl,
                                  child: Text(
                                    'klik disini wa.me/828181711',
                                    textAlign: TextAlign.center,
                                    style: TextStyleWidget.bodyB3(
                                        fontWeight: FontWeightStyle.semiBold,
                                        color: ColorThemeStyle.blue100),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
