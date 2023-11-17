import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/profile_emission_component/profile_emission_provider.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/shadow_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class DetailEmissionComponent extends StatelessWidget {
  const DetailEmissionComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 32),
      decoration: BoxDecoration(
        boxShadow: [
          ShadowStyle.emissionShadow,
        ],
        image: const DecorationImage(
          image: AssetImage(
            Assets.assetsImagesEmissionBg,
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
                    ),
                  );
                } else {
                  return Text(
                    '0',
                    style: TextStyleWidget.displayD3(
                      fontWeight: FontWeightStyle.semiBold,
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
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Consumer<ProfileEmissionProvider>(builder: (
            context,
            emissionProvider,
            child,
          ) {
            if (!emissionProvider.isLoading) {
              return RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text:
                        'Selama berliburan anda telah berhasil membantu mengurangi gas emisi yang setara dengan\n',
                    style: TextStyleWidget.labelL3(
                      fontWeight: FontWeightStyle.regular,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text:
                            '${emissionProvider.emissionModel.equivalentPoweringHouseInHours} jam powering house',
                        style: TextStyleWidget.labelL3(
                          fontWeight: FontWeightStyle.bold,
                          color: Colors.black,
                        ),
                      ),
                    ]),
              );
            } else {
              return RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text:
                        'Selama berliburan anda telah berhasil membantu mengurangi gas emisi yang setara dengan\n',
                    style: TextStyleWidget.labelL3(
                      fontWeight: FontWeightStyle.regular,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: '0 menit powering house',
                        style: TextStyleWidget.labelL3(
                          fontWeight: FontWeightStyle.bold,
                          color: Colors.black,
                        ),
                      ),
                    ]),
              );
            }
          })
        ],
      ),
    );
  }
}
