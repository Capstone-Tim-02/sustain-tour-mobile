import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/models/faq_model/faq_model.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class DetailFaqScreen extends StatelessWidget {
  final FaqModel faqModel;
  const DetailFaqScreen({super.key, required this.faqModel});

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 32,
            ),
            child: Column(
              children: [
                Text(
                  faqModel.tittle,
                  style: TextStyleWidget.titleT2(
                    fontWeight: FontWeightStyle.semiBold,
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  faqModel.detail,
                  style: TextStyleWidget.labelL1(
                    fontWeight: FontWeightStyle.medium,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
