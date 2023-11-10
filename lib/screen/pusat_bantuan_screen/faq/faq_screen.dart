import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/screen/pusat_bantuan_screen/faq/detail_faq_screen.dart';
import 'package:sustain_tour_mobile/screen/pusat_bantuan_screen/faq/faq_screen_provider.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
import 'package:sustain_tour_mobile/widget/text_field_widget.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final faqProvider = Provider.of<FaqScreenProvider>(context);

    String? errorText;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'FAQ',
          style: TextStyleWidget.titleT2(
            fontWeight: FontWeightStyle.semiBold,
          ),
        ),
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
            SizedBox(
              height: 60,
              width: 374,
              child: TextFieldWidget(
                labelText: 'Search',
                hintText: 'Apakah saya',
                errorText: errorText,
                prefixIcon: const Icon(Icons.search),
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
                          // SizedBox(
                          //   height: 50,
                          //   width: 340,
                          //   child: Text(
                          //     'Hubungi cp dibawah ini jika kamu tidak menemukan jawaban cpdetimate',
                          //     textAlign: TextAlign.start,
                          //     style: TextStyleWidget.bodyB3(
                          //       fontWeight: FontWeightStyle.medium,
                          //     ),
                          //   ),
                          // ),
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
                            child: Text(
                              'Hubungi cp dibawah ini jika kamu tidak menemukan jawaban cpdetimate',
                              textAlign: TextAlign.center,
                              style: TextStyleWidget.bodyB3(
                                fontWeight: FontWeightStyle.medium,
                              ),
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
