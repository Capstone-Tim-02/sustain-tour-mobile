import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/models/terms_condition_model/terms_condition_model.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class DetailTNC extends StatelessWidget {
  final TNCModel tncModel;
  const DetailTNC({super.key, required this.tncModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          tncModel.tittle,
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
              horizontal: 12,
              vertical: 32,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tncModel.desc1,
                  style: TextStyleWidget.labelL2(
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
