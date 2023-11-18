import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class BookingHistoryComponent extends StatelessWidget {
  const BookingHistoryComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Riwayat Kunjungan',
              style: TextStyleWidget.titleT2(
                fontWeight: FontWeightStyle.semiBold,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Container(
                    height: 81,
                    width: double.infinity,
                    margin: const EdgeInsets.only(
                      bottom: 16,
                      right: 16,
                      left: 16,
                    ),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                          )
                        ]),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 82,
                                height: 65,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  child: Image.asset(
                                    Assets.assetsCardImagesCard1,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 21,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Pantai Pink',
                                    style: TextStyleWidget.titleT2(
                                      fontWeight: FontWeightStyle.semiBold,
                                    ),
                                  ),
                                  Text(
                                    'Nusa Tenggara Timur',
                                    style: TextStyleWidget.bodyB3(
                                      color: ColorThemeStyle.grey100,
                                      fontWeight: FontWeightStyle.medium,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '320',
                                style: TextStyleWidget.headlineH3(
                                  fontWeight: FontWeightStyle.semiBold,
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 6.0),
                                child: Text(
                                  'CO2',
                                  style: TextStyleWidget.bodyB2(
                                    fontWeight: FontWeightStyle.semiBold,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ]),
                  );
                }),
          )
        ],
      ),
    );
  }
}
