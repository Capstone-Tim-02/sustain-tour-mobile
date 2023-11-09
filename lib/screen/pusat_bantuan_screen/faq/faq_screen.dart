import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
import 'package:sustain_tour_mobile/widget/text_field_widget.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

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
        // Menggunakan SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 32,
          ),
          child: Column(
            children: [
              Container(
                height: 96,
                width: 330,
                color: Colors.black12,
                child: const Text(
                    'Temukan jawaban mengenai permasalahan mengenai aplikasi Destimate'),
              ),
              const SizedBox(height: 32),
              Container(
                height: 56,
                width: 370,
                color: Colors.black12,
                child: const Text('Search'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
