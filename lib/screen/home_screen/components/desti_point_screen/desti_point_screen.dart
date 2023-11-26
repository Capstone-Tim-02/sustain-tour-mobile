import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/screen/home_screen/components/desti_point_screen/component/point_history.dart';
import 'package:sustain_tour_mobile/screen/home_screen/components/desti_point_screen/component/user_point_info.dart';
import 'package:sustain_tour_mobile/screen/home_screen/components/desti_point_screen/desti_point_provider.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class DestiPointScreen extends StatelessWidget {
  const DestiPointScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Rewards',
          style: TextStyleWidget.titleT2(
            fontWeight: FontWeightStyle.semiBold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const UserPointInfo(),
            const SizedBox(height: 24),
            Text(
              'Riwayat',
              style: TextStyleWidget.titleT1(
                color: ColorThemeStyle.black100,
                fontWeight: FontWeightStyle.semiBold,
              ),
            ),
            const PointHistory(),
          ],
        ),
      ),
    );
  }
}
