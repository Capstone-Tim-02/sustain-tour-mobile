import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/screen/home_screen/components/desti_point_screen/desti_point_provider.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class PointHistory extends StatelessWidget {
  const PointHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final pointHistoryProvider = context.read<DestiPointProvider>();
    pointHistoryProvider.getPointHistory();
    return Expanded(
      child: Consumer<DestiPointProvider>(
        builder: (context, destiPointProvider, child) {
          if (destiPointProvider.isLoadingHistory) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (destiPointProvider.listPointHistory.isNotEmpty) {
            return ListView.builder(
              itemCount: destiPointProvider.listPointHistory.length,
              itemBuilder: (context, index) {
                var dataPointHistory =
                    destiPointProvider.listPointHistory[index];
                //pengecekan apakah data point Earned ada atau tidak
                String pointsEarnedText = dataPointHistory.pointsEarned != null
                    ? 'Points Earned'
                    : '';

                //pengecekan apakah data point Used ada atau tidak
                String pointsUsedText =
                    dataPointHistory.pointsUsed != null ? 'Points Used' : '';

                // Tampilkan hanya satu dari dua teks berdasarkan ketersediaan data
                String displayText = pointsEarnedText.isNotEmpty
                    ? pointsEarnedText
                    : (pointsUsedText.isNotEmpty ? pointsUsedText : '');

                String pointsEarned = dataPointHistory.pointsEarned != null
                    ? '+ ${dataPointHistory.pointsEarned}'
                    : '';

                //pengecekan apakah data point Used ada atau tidak
                String pointsUsed = dataPointHistory.pointsUsed != null
                    ? '- ${dataPointHistory.pointsUsed}'
                    : '';

                // Menentukan warna teks berdasarkan apakah yang ditampilkan adalah pointsEarned atau pointsUsed
                Color textColor = pointsEarned.isNotEmpty
                    ? ColorThemeStyle.green100
                    : (pointsUsed.isNotEmpty
                        ? ColorThemeStyle.red
                        : ColorThemeStyle.black100);

                Color containerColor = pointsEarned.isNotEmpty
                    ? ColorThemeStyle.greenContainer
                    : (pointsUsed.isNotEmpty
                        ? ColorThemeStyle.redContainer
                        : ColorThemeStyle.black100);

                // Tampilkan hanya satu dari dua teks berdasarkan ketersediaan data
                String displayPoint = pointsEarned.isNotEmpty
                    ? pointsEarned
                    : (pointsUsed.isNotEmpty ? pointsUsed : '');
                return Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Container(
                    width: 380,
                    height: 64,
                    decoration: BoxDecoration(
                      color: ColorThemeStyle.white100,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: ColorThemeStyle.black100.withOpacity(0.1),
                          spreadRadius: 0,
                          blurRadius: 10,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.only(
                        right: 8,
                        left: 8,
                      ),
                      title: Text(
                        dataPointHistory.wisataName ?? "",
                        style: TextStyleWidget.titleT2(
                          fontWeight: FontWeightStyle.medium,
                          color: ColorThemeStyle.black100,
                        ),
                      ),
                      subtitle: Text(
                        displayText,
                        style: TextStyleWidget.bodyB3(
                          fontWeight: FontWeightStyle.medium,
                          color: ColorThemeStyle.grey100,
                        ),
                      ),
                      trailing: Container(
                        width: 54,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: containerColor,
                        ),
                        child: Center(
                          child: Text(
                            displayPoint,
                            style: TextStyleWidget.bodyB2(
                              fontWeight: FontWeightStyle.semiBold,
                              color: textColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 68),
                Image.asset(
                  Assets.assetsImagesNotFoundWisata,
                  height: 162,
                  width: 248,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 90, vertical: 8),
                  child: Text(
                    'Upss maaf, anda belum pernah menggunakan poin untuk memesan tiket',
                    textAlign: TextAlign.center,
                    style: TextStyleWidget.bodyB2(
                      color: ColorThemeStyle.grey100,
                      fontWeight: FontWeightStyle.medium,
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}