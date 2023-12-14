import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/checkout_provider.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/profile_provider.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/shadow_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
import 'package:sustain_tour_mobile/widget/snack_bar_widget.dart';

class PoinInfoComponent extends StatelessWidget {
  const PoinInfoComponent({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileProvider profileProvider = Provider.of<ProfileProvider>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Poin",
          style: TextStyleWidget.titleT2(
            color: ColorThemeStyle.black100,
            fontWeight: FontWeight.w600
          ),
        ),
        const SizedBox(height: 8),
        Consumer<CheckoutProvider>(
          builder: (context, checkoutProvider, child) {
            return Container(
              width: double.infinity,
              height: 72,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                boxShadow: [ShadowStyle.shadowFix1],
                color: checkoutProvider.isPointUsed ? ColorThemeStyle.blue100 : ColorThemeStyle.white100,
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
                          color: checkoutProvider.isPointUsed ? ColorThemeStyle.white100 : ColorThemeStyle.blue100 ,
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: SvgPicture.asset(
                          Assets.assetsIconsCoin,
                          width: 28,
                          height: 28,
                          colorFilter: ColorFilter.mode(
                            checkoutProvider.isPointUsed ? ColorThemeStyle.blue100 : ColorThemeStyle.white100,
                            BlendMode.srcIn
                          ),
                        )
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Gunakan Poinmu",
                            style: TextStyleWidget.titleT3(
                              color: checkoutProvider.isPointUsed ? ColorThemeStyle.white100 : ColorThemeStyle.black100,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "${profileProvider.user.points.toString()} Poin",
                            style: TextStyleWidget.bodyB3(
                              color: checkoutProvider.isPointUsed ? ColorThemeStyle.white100 : ColorThemeStyle.grey100,
                              fontWeight: FontWeight.w500
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Theme(
                    data: ThemeData(
                      useMaterial3: false
                    ),
                    child: Switch(
                      activeColor: ColorThemeStyle.blue40,
                      activeTrackColor: ColorThemeStyle.grey50,
                      inactiveThumbColor: ColorThemeStyle.grey100,
                      inactiveTrackColor: ColorThemeStyle.grey50,
                      value: checkoutProvider.isPointUsed,
                      onChanged: (bool value){
                        if(profileProvider.user.points == 0){
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBarWidget.snackBarWidget(
                              message: "Kamu tidak memiliki poin!",
                              duration: const Duration(seconds: 2),
                              backgroundColor: ColorThemeStyle.red
                            )
                          );
                        } else {
                          checkoutProvider.togglePoin(value);
                        }
                      }
                    ),
                  )
                ]
              ),
            );
          }
        ),
        const SizedBox(height: 24)
      ],
    );
  }
}