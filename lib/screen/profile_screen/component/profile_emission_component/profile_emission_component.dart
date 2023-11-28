import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/constants/routes.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/profile_emission_component/profile_emission_provider.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class ProfileEmissionComponent extends StatelessWidget {
  const ProfileEmissionComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, Routes.detailEmissionScreen),
      child: Container(
        // height: 110,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 28),
        decoration: BoxDecoration(
          color: ColorThemeStyle.blue100,
          // boxShadow: [
          //   ShadowStyle.emissionShadow,
          // ],
          image: const DecorationImage(
            image: AssetImage(
              Assets.assetsImagesEmissionRealBg,
            ),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Consumer<ProfileEmissionProvider>(
                    builder: (context, emissionProvider, child) {
                  if (!emissionProvider.isLoading) {
                    return Text(
                      '${emissionProvider.emissionModel.roundedTotalCarbonFootprint}',
                      style: TextStyleWidget.displayD3(
                        fontWeight: FontWeightStyle.semiBold,
                        color: Colors.white,
                      ),
                    );
                  } else {
                    return Text(
                      '0',
                      style: TextStyleWidget.displayD3(
                        fontWeight: FontWeightStyle.semiBold,
                        color: Colors.white,
                      ),
                    );
                  }
                }),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  'CO2',
                  style: TextStyleWidget.bodyB3(
                    fontWeight: FontWeightStyle.semiBold,
                    color: Colors.white,
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
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Lihat Selengkapnya',
                  textAlign: TextAlign.center,
                  style: TextStyleWidget.labelL3(
                    fontWeight: FontWeightStyle.semiBold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 15,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
