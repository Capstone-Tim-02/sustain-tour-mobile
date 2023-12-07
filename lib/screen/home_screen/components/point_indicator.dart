import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/constants/routes.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/profile_provider.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/shadow_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class PointIndicator extends StatelessWidget {
  const PointIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 136,
        width: 380,
        margin: const EdgeInsets.only(top: 158, left: 16, right: 16),
        decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage(Assets.assetsImagesPointBackground),
              fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [ShadowStyle.shadowFix1],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Poin dimiliki saat ini",
                style: TextStyleWidget.bodyB2(
                    color: ColorThemeStyle.black100,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Consumer<ProfileProvider>(
                    builder: (context, profileProvider, child) {
                      return profileProvider.isLoading
                          ? Text(
                              "-- \nDesti Poin",
                              style: TextStyleWidget.headlineH2(
                                  color: ColorThemeStyle.blue100,
                                  fontWeight: FontWeight.w600),
                            )
                          : Text(
                              "${profileProvider.user.points} \nDesti Poin",
                              style: TextStyleWidget.headlineH2(
                                  color: ColorThemeStyle.blue100,
                                  fontWeight: FontWeight.w600),
                            );
                    },
                  ),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, Routes.destiPointScreen),
                    child: const CircleAvatar(
                      backgroundColor: ColorThemeStyle.blue100,
                      maxRadius: 27.5,
                      child: Icon(
                        Icons.navigate_next,
                        color: ColorThemeStyle.white100,
                        size: 40,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
