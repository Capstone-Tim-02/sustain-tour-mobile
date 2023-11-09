import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class ProfileEmissionComponent extends StatelessWidget {
  const ProfileEmissionComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Container(
        height: 110,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 28),
        decoration: BoxDecoration(
          color: ColorThemeStyle.grey50,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '420',
                  style: TextStyleWidget.displayD3(
                    fontWeight: FontWeightStyle.semiBold,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  'CO2',
                  style: TextStyleWidget.bodyB3(
                    fontWeight: FontWeightStyle.semiBold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Gas emisi carbon yang telah anda keluarkan selama menjalani liburan',
              textAlign: TextAlign.center,
              style: TextStyleWidget.labelL3(
                fontWeight: FontWeightStyle.regular,
              ),
            )
          ],
        ),
      ),
    );
  }
}
