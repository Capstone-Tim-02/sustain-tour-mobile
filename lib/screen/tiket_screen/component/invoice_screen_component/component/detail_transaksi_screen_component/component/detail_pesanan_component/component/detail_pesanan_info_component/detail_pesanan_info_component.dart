import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/profile_provider.dart';
import 'package:sustain_tour_mobile/screen/tiket_screen/component/invoice_screen_component/component/step_component_widget/step_component_widget.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class DetailPesananInfoComponent extends StatelessWidget {
  final String wisataName;
  final int jumlahTiketYangDibeli;
  final double emisiCarbon;
  const DetailPesananInfoComponent(
      {super.key,
      required this.wisataName,
      required this.jumlahTiketYangDibeli,
      required this.emisiCarbon});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: StepComponentWidget.step(
                borderRadius: BorderRadius.circular(8),
                content: Center(
                  child: SvgPicture.asset(
                    Assets.assetsIconsAccountCircleFill,
                    width: 28,
                    height: 28,
                    colorFilter: const ColorFilter.mode(
                        ColorThemeStyle.white100, BlendMode.srcIn),
                  ),
                ),
              ),
            ),
            StepComponentWidget.trail(
              height: 4,
              width: 4,
              margin: const EdgeInsets.only(top: 8, bottom: 6, left: 17.5),
              shape: BoxShape.circle,
              borderRadius: null,
            ),
            StepComponentWidget.trail(
              height: 4,
              width: 4,
              margin: const EdgeInsets.only(bottom: 6, left: 17.5),
              shape: BoxShape.circle,
              borderRadius: null,
            ),
            StepComponentWidget.trail(
              height: 4,
              width: 4,
              margin: const EdgeInsets.only(bottom: 8, left: 17.5),
              shape: BoxShape.circle,
              borderRadius: null,
            ),
            StepComponentWidget.step(
              borderRadius: BorderRadius.circular(8),
              content: const Center(
                  child: Icon(
                Icons.location_pin,
                size: 28,
                color: Colors.white,
              )),
            ),
            StepComponentWidget.trail(
              height: 4,
              width: 4,
              margin: const EdgeInsets.only(top: 8, bottom: 6, left: 17.5),
              shape: BoxShape.circle,
              borderRadius: null,
            ),
            StepComponentWidget.trail(
              height: 4,
              width: 4,
              margin: const EdgeInsets.only(bottom: 6, left: 17.5),
              shape: BoxShape.circle,
              borderRadius: null,
            ),
            StepComponentWidget.trail(
              height: 4,
              width: 4,
              margin: const EdgeInsets.only(bottom: 8, left: 17.5),
              shape: BoxShape.circle,
              borderRadius: null,
            ),
            StepComponentWidget.step(
              borderRadius: BorderRadius.circular(8),
              backgroundColor: ColorThemeStyle.green100,
              content: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(
                      Assets.assetsIconsCloud,
                      width: 22,
                      height: 22,
                      colorFilter: const ColorFilter.mode(
                          ColorThemeStyle.white100, BlendMode.srcIn),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7.0),
                      child: Text(
                        'CO2',
                        style: TextStyleWidget.labelL5(
                          fontWeight: FontWeightStyle.semiBold,
                          color: ColorThemeStyle.white100,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Consumer<ProfileProvider>(
                builder: (context, profileProvider, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    profileProvider.user.name,
                    style: TextStyleWidget.titleT3(
                      fontWeight: FontWeightStyle.medium,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    profileProvider.user.email,
                    style: TextStyleWidget.bodyB3(
                        fontWeight: FontWeightStyle.medium,
                        color: ColorThemeStyle.grey100),
                  ),
                ],
              );
            }),
            const SizedBox(
              height: 36,
            ),
            Text(
              wisataName,
              style: TextStyleWidget.titleT3(
                fontWeight: FontWeightStyle.medium,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              '$jumlahTiketYangDibeli tiket dibeli',
              style: TextStyleWidget.bodyB3(
                  fontWeight: FontWeightStyle.medium,
                  color: ColorThemeStyle.grey100),
            ),
            const SizedBox(
              height: 36,
            ),
            Text(
              'Emisi Carbon',
              style: TextStyleWidget.titleT3(
                fontWeight: FontWeightStyle.medium,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              '${emisiCarbon.toStringAsFixed(0)} CO2',
              style: TextStyleWidget.bodyB3(
                  fontWeight: FontWeightStyle.medium,
                  color: ColorThemeStyle.grey100),
            ),
          ],
        )
      ],
    );
  }
}
