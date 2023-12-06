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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 32,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            const SizedBox(height: 8),
            Text(
              faqModel.link,
              style: const TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.black,
                  decorationThickness: 1.5,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 16),
            Text(
              faqModel.additional,
              style: TextStyleWidget.labelL1(
                fontWeight: FontWeightStyle.medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
