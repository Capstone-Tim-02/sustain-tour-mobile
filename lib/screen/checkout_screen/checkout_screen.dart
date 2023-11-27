import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/constants/routes.dart';
import 'package:sustain_tour_mobile/models/wisata_models/wisata_models.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/shadow_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
import 'package:sustain_tour_mobile/widget/button_widget.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wisataItem = (ModalRoute.of(context)?.settings.arguments) as Wisata;
    return Scaffold(
      appBar:  AppBar(
        title: Text(
          'Checkout',
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
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  "Tanggal kunjungan",
                  style: TextStyleWidget.titleT2(
                    color: ColorThemeStyle.grey100,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
              Text(
                //TODO Ganti dengan tanggal sesuai pilihan
                "27 September 2023",
                style: TextStyleWidget.headlineH3(
                  color: ColorThemeStyle.black100,
                  fontWeight: FontWeight.w600
                ),
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      wisataItem.photoWisata1,
                      width: 83,
                      height: 86,
                      fit: BoxFit.fitHeight,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.image_not_supported);
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.65,
                        child: Text(
                          wisataItem.title,
                          style: TextStyleWidget.titleT2(
                            color: ColorThemeStyle.black100,
                            fontWeight: FontWeight.w600
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.location_pin, size: 12),
                          const SizedBox(width: 8),
                          Text(
                            wisataItem.kota,
                            style: TextStyleWidget.bodyB3(
                              color: ColorThemeStyle.grey100,
                              fontWeight: FontWeight.w500
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.65,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  customBorder: const CircleBorder(),
                                  onTap: (){
                                    //TODO Logic remove quantity
                                  },
                                  child: Container(
                                    width: 24,
                                    height: 24,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: ColorThemeStyle.blue100
                                    ),
                                    child: const Icon(
                                      Icons.remove,
                                      size: 20,
                                      color: ColorThemeStyle.white100
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 22),
                                  child: Text(
                                    //TODO Ganti 4 dengan quantity
                                    "4",
                                    style: TextStyleWidget.bodyB3(
                                      color: ColorThemeStyle.black100,
                                      fontWeight: FontWeight.w500
                                    ),
                                  )
                                ),
                                InkWell(
                                  customBorder: const CircleBorder(),
                                  onTap: (){
                                    //TODO Logic Add quantity
                                  },
                                  child: Container(
                                    width: 24,
                                    height: 24,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: ColorThemeStyle.blue100
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      size: 19,
                                      color: ColorThemeStyle.white100
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "Rp 130.000",
                              style: TextStyleWidget.titleT2(
                                color: ColorThemeStyle.black100,
                                fontWeight: FontWeight.w600
                              ),
                            )
                          ]
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
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
                              colorFilter: const ColorFilter.mode(ColorThemeStyle.white100, BlendMode.srcIn),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Column(
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
                          ),
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
              Text(
                "Poin",
                style: TextStyleWidget.titleT2(
                  color: ColorThemeStyle.black100,
                  fontWeight: FontWeight.w600
                ),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: (){},
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
                              Assets.assetsIconsCoin,
                              width: 28,
                              height: 28,
                              colorFilter: const ColorFilter.mode(ColorThemeStyle.white100, BlendMode.srcIn),
                            )
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Gunakan Poinmu",
                                style: TextStyleWidget.titleT3(
                                  color: ColorThemeStyle.black100,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "20 Poin",
                                style: TextStyleWidget.bodyB3(
                                  color: ColorThemeStyle.grey100,
                                  fontWeight: FontWeight.w500
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Switch(
                        //TODO buat toggle switchnya
                        value: true,
                        onChanged: (bool value){}
                      )
                    ]
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                "Order Info",
                style: TextStyleWidget.titleT2(
                  color: ColorThemeStyle.black100,
                  fontWeight: FontWeight.w600
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sub total",
                    style: TextStyleWidget.bodyB3(
                      color: ColorThemeStyle.black100,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  Text(
                    "Rp 520.000",
                    style: TextStyleWidget.bodyB3(
                      color: ColorThemeStyle.black100,
                      fontWeight: FontWeight.w500
                    ),
                  )
                ],
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyleWidget.bodyB3(
                      color: ColorThemeStyle.black100,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  Text(
                    "Rp 520.000",
                    style: TextStyleWidget.bodyB1(
                      color: ColorThemeStyle.blue100,
                      fontWeight: FontWeight.w600
                    ),
                  )
                ],
              ),
              const SizedBox(height: 60),
              ButtonWidget.defaultContainer(
                text: "Booking Sekarang",
                onPressed: (){}
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}