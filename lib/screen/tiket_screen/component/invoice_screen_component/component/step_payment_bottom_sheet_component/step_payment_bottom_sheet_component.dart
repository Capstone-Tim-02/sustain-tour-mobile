import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/screen/tiket_screen/component/invoice_screen_component/component/step_component_widget/step_component_widget.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class StepPaymentBottomSheetComponent {
  static void buildBottomSheetSteps(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(40))),
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 157,
                      height: 5,
                      margin: const EdgeInsets.only(top: 10, bottom: 20),
                      decoration: const BoxDecoration(
                          color: ColorThemeStyle.grey80,
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                    )
                  ],
                ),
                Text(
                  'Cara Membayar',
                  style: TextStyleWidget.titleT2(
                    color: ColorThemeStyle.blue100,
                    fontWeight: FontWeightStyle.semiBold,
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          StepComponentWidget.step(
                            shape: BoxShape.circle,
                            content: Center(
                              child: Text(
                                '1',
                                style: TextStyleWidget.titleT1(
                                  color: ColorThemeStyle.white100,
                                  fontWeight: FontWeightStyle.semiBold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          StepComponentWidget.trail(),
                          StepComponentWidget.trail(),
                          StepComponentWidget.trail(),
                          StepComponentWidget.trail(),
                          const SizedBox(
                            height: 2,
                          ),
                          StepComponentWidget.step(
                            shape: BoxShape.circle,
                            content: Center(
                              child: Text(
                                '2',
                                style: TextStyleWidget.titleT1(
                                  color: ColorThemeStyle.white100,
                                  fontWeight: FontWeightStyle.semiBold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          StepComponentWidget.trail(),
                          StepComponentWidget.trail(),
                          StepComponentWidget.trail(),
                          StepComponentWidget.trail(),
                          const SizedBox(
                            height: 2,
                          ),
                          StepComponentWidget.step(
                            shape: BoxShape.circle,
                            content: Center(
                              child: Text(
                                '3',
                                style: TextStyleWidget.titleT1(
                                  color: ColorThemeStyle.white100,
                                  fontWeight: FontWeightStyle.semiBold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 24,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Klik booking sekarang',
                              style: TextStyleWidget.titleT2(
                                fontWeight: FontWeightStyle.semiBold,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Anda akan mendampatkan invoice untuk melakukan pembayaran',
                              style: TextStyleWidget.labelL4(
                                  fontWeight: FontWeightStyle.medium,
                                  color: ColorThemeStyle.grey100),
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            Text(
                              'Transfer Secara Manual',
                              style: TextStyleWidget.titleT2(
                                fontWeight: FontWeightStyle.semiBold,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Bank : Mandiri\n12000456789\nKonfirmasi Pembayaran dengan kirimkan bukti pembayaran Klik Disini',
                              style: TextStyleWidget.labelL4(
                                  fontWeight: FontWeightStyle.medium,
                                  color: ColorThemeStyle.grey100),
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            Text(
                              'Anda akan mendapatkan akses ke destinasi wisata',
                              style: TextStyleWidget.titleT2(
                                fontWeight: FontWeightStyle.semiBold,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Setelah anda menyelesaikan pembayaran, anda dapat memasuki lokasi destinasi wisata. ',
                              style: TextStyleWidget.labelL4(
                                  fontWeight: FontWeightStyle.medium,
                                  color: ColorThemeStyle.grey100),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
