import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/shadow_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class UsePromoScreen extends StatelessWidget {
  const UsePromoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text(
          'Pilih Promo',
          style: TextStyleWidget.titleT2(
            fontWeight: FontWeightStyle.semiBold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 28),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 44,
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                          filled: true,
                          fillColor: ColorThemeStyle.grey50,
                          hintText: "Tempel kode disini",
                          hintStyle: TextStyleWidget.bodyB3(
                            color: ColorThemeStyle.black100,
                            fontWeight: FontWeight.w500
                          ),
                          border:  OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: ColorThemeStyle.blue100
                            )
                          )
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 17),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: ColorThemeStyle.blue100
                    ),
                    onPressed: (){},
                    child: Text(
                      "Pakai",
                      style: TextStyleWidget.titleT2(
                        color: ColorThemeStyle.white100,
                        fontWeight: FontWeight.w500
                      ),
                    )
                  )
                ],
              ),
              const SizedBox(height: 32),
              Text(
                "Promo tersedia",
                style: TextStyleWidget.titleT2(
                  color: ColorThemeStyle.black100,
                  fontWeight: FontWeight.w600
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [ShadowStyle.shadowFix1]
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  margin: EdgeInsets.zero,
                  color: ColorThemeStyle.white100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        child: Text(
                          "November Seru dengan diskon 20%",
                          style: TextStyleWidget.bodyB2(
                            color: ColorThemeStyle.black100,
                            fontWeight: FontWeight.w600
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          "Berlaku hingga 20 Nov 2023",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.4,
                            height: 1.6,
                            color: ColorThemeStyle.black100
                          )
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)
                          ),
                          color: ColorThemeStyle.blue80,
                        ),
                        padding: const EdgeInsets.only(left: 12, right: 14, top: 7, bottom: 7),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "KODE PROMO",
                              style: TextStyleWidget.bodyB1(
                                color: ColorThemeStyle.white100,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Container(
                              height: 32,
                              decoration: BoxDecoration(
                                color: ColorThemeStyle.white100,
                                borderRadius: BorderRadius.circular(4)
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                                children: [
                                  Text(
                                    "LIBURAN15",
                                    style: TextStyleWidget.bodyB1(
                                      color: ColorThemeStyle.black100,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  SvgPicture.asset(
                                    Assets.assetsIconsCopy,
                                    width: 13,
                                    height: 13,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [ShadowStyle.shadowFix1]
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  margin: EdgeInsets.zero,
                  color: ColorThemeStyle.white100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        child: Text(
                          "November Seru dengan diskon 20%",
                          style: TextStyleWidget.bodyB2(
                            color: ColorThemeStyle.black100,
                            fontWeight: FontWeight.w600
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          "Berlaku hingga 20 Nov 2023",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.4,
                            height: 1.6,
                            color: ColorThemeStyle.black100
                          )
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)
                          ),
                          color: ColorThemeStyle.blue80,
                        ),
                        padding: const EdgeInsets.only(left: 12, right: 14, top: 7, bottom: 7),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "KODE PROMO",
                              style: TextStyleWidget.bodyB1(
                                color: ColorThemeStyle.white100,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Container(
                              height: 32,
                              decoration: BoxDecoration(
                                color: ColorThemeStyle.white100,
                                borderRadius: BorderRadius.circular(4)
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                                children: [
                                  Text(
                                    "LIBURAN15",
                                    style: TextStyleWidget.bodyB1(
                                      color: ColorThemeStyle.black100,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  SvgPicture.asset(
                                    Assets.assetsIconsCopy,
                                    width: 13,
                                    height: 13,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}