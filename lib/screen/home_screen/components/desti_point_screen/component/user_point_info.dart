import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/profile_provider.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class UserPointInfo extends StatelessWidget {
  const UserPointInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 136,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 24,
      ),
      decoration: BoxDecoration(
        color: ColorThemeStyle.blue100,
        image: const DecorationImage(
          opacity: 200,
          image: AssetImage(
            Assets.assetsImagesEmissionRealBgWhite,
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Point dimiliki saat ini',
            style: TextStyleWidget.bodyB2(
              color: ColorThemeStyle.white100,
              fontWeight: FontWeightStyle.medium,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Consumer<ProfileProvider>(
                builder: (context, profileProvider, child) {
                  return profileProvider.isLoading
                      ? Text(
                          "-- \nDesti Poin",
                          style: TextStyleWidget.headlineH2(
                            color: ColorThemeStyle.white100,
                            fontWeight: FontWeightStyle.semiBold,
                          ),
                        )
                      : Text(
                          "${profileProvider.user.points} \nDesti Poin",
                          style: TextStyleWidget.headlineH2(
                            color: ColorThemeStyle.white100,
                            fontWeight: FontWeightStyle.semiBold,
                          ),
                        );
                },
              ),
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    isDismissible: false,
                    enableDrag: false,
                    context: context,
                    builder: (context) {
                      return Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 34,
                          vertical: 24,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Center(
                              child: Text(
                                'Tentang Desti Point',
                                style: TextStyleWidget.titleT2(
                                  color: ColorThemeStyle.black100,
                                  fontWeight: FontWeightStyle.semiBold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Perolehan Poin',
                              style: TextStyleWidget.titleT3(
                                color: ColorThemeStyle.black100,
                                fontWeight: FontWeightStyle.semiBold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Dapatkan 1 Desti Poin untuk setiap transaksi sebesar Rp10.000 dan berlaku kelipatannya.',
                              style: TextStyleWidget.bodyB3(
                                color: ColorThemeStyle.black100,
                                fontWeight: FontWeightStyle.regular,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Contoh: Transaksi sebesar Rp45.000 akan mendapatkan 4 Desti Poin ; transaksi sebesar Rp21.000 akan mendapatkan 2 Desti Poin',
                              style: TextStyleWidget.bodyB3(
                                color: ColorThemeStyle.black100,
                                fontWeight: FontWeightStyle.regular,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Pemakaian Poin',
                              style: TextStyleWidget.titleT3(
                                color: ColorThemeStyle.black100,
                                fontWeight: FontWeightStyle.semiBold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Dapatkan potongan harga sebesar Rp1.000 untuk setiap 10 poin yang digunakan. Potongan harga ini berlaku secara kelipatan.',
                              style: TextStyleWidget.bodyB3(
                                color: ColorThemeStyle.black100,
                                fontWeight: FontWeightStyle.regular,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Contoh: Poin sebanyak 35 dapat digunakan untuk potongan harga senilai Rp3.000 ; poin sebanyak 51 dapat digunakan untuk potongan harga senilai Rp5.000',
                              style: TextStyleWidget.bodyB3(
                                color: ColorThemeStyle.black100,
                                fontWeight: FontWeightStyle.regular,
                              ),
                            ),
                            const SizedBox(height: 40),
                            SizedBox(
                              width: double.infinity,
                              height: 60,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorThemeStyle.blue100,
                                ),
                                child: Text(
                                  'Mengerti',
                                  style: TextStyleWidget.titleT2(
                                    fontWeight: FontWeightStyle.semiBold,
                                    color: ColorThemeStyle.white100,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                icon: Icon(
                  MdiIcons.alertCircle,
                  color: ColorThemeStyle.white100,
                  size: 40,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
