import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/constants/routes.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/checkout_provider.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/shadow_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class PromoInfoComponent extends StatelessWidget {
  const PromoInfoComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Promo",
          style: TextStyleWidget.titleT2(
            color: ColorThemeStyle.black100,
            fontWeight: FontWeight.w600
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: (){
            Provider.of<CheckoutProvider>(context, listen: false).getUserPromo();
            Navigator.pushNamed(
              context,
              Routes.usePromoScreen
            );
          },
          child: Container(
            width: double.infinity,
            height: 72,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              boxShadow: [ShadowStyle.shadowFix1],
              color: ColorThemeStyle.white100,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: ColorThemeStyle.blue100,
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: SvgPicture.asset(
                        Assets.assetsIconsPromo,
                        width: 28,
                        height: 28,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Consumer<CheckoutProvider>(
                      builder: (context, checkoutProvider, child) {
                        return checkoutProvider.isPromoUsed
                          ? Center(
                              child: Text(
                                "1 Promo Digunakan",
                                style: TextStyleWidget.titleT3(
                                  color: ColorThemeStyle.black100,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Gunakan Promo",
                                  style: TextStyleWidget.titleT3(
                                    color: ColorThemeStyle.black100,
                                    fontWeight: FontWeight.w500
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "pilih promo yang tersedia",
                                  style: TextStyleWidget.bodyB3(
                                    color: ColorThemeStyle.grey100,
                                    fontWeight: FontWeight.w500
                                  ),
                                )
                              ],
                            );
                      },
                    )
                  ],
                ),
                const Icon(
                  Icons.navigate_next,
                  size: 24,
                  color: ColorThemeStyle.black100,
                )
              ]
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}