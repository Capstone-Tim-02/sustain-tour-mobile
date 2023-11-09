import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/screen/main_screen/main_screen.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/shadow_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
import 'package:sustain_tour_mobile/widget/bottom_navbar_widget/bottom_navbar_widget_provider.dart';
import 'package:sustain_tour_mobile/widget/card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 241,
                decoration: const BoxDecoration(
                  color: ColorThemeStyle.grey100,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32)
                  )
                ),
              ),
              Container(
                height: 64,
                margin: const EdgeInsets.only(left: 16, right: 16, top: 70),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hi, Fulan",
                          style: TextStyleWidget.titleT2(
                            color: ColorThemeStyle.white100,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Selamat Datang",
                          style: TextStyleWidget.headlineH3(
                            color: ColorThemeStyle.white100,
                            fontWeight: FontWeight.w600
                          ),
                        )
                      ],
                    ),
                    const CircleAvatar(
                      backgroundColor: ColorThemeStyle.white100,
                      radius: 28,
                      child: Icon(
                        Icons.notifications_active,
                        color: ColorThemeStyle.black100,
                        size: 32,
                      ),
                    )
                  ],
                ),
              ),
              Center(
                child: Container(
                  height: 120,
                  width: 380,
                  margin: const EdgeInsets.only(top: 165,left: 16,right: 16),
                  decoration: BoxDecoration(
                    color: ColorThemeStyle.white100,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [ShadowStyle.shadowFix2],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Poin dimiliki saat ini",
                          style: TextStyleWidget.bodyB2(
                            color: ColorThemeStyle.black100,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "60 Desti poin",
                          style: TextStyleWidget.titleT1(
                            color: ColorThemeStyle.black100,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Selengkapnya",
                                style: TextStyleWidget.titleT3(
                                  color: ColorThemeStyle.black100,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                              const Icon(
                                Icons.navigate_next,
                                size: 24,
                              )
                            ]
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 32, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Penawaran Khusus",
                  style: TextStyleWidget.titleT2(
                    color: ColorThemeStyle.black100,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child : Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CardWidget.medium(
                    imageUrl: "https://media.istockphoto.com/id/1432434937/photo/aerial-view-of-panama-canal-on-the-atlantic-side.webp?b=1&s=612x612&w=0&k=20&c=n48PbZKA0dFI7sLejIgu2mNZwH4KuIQktREwhKowa6g=",
                    title: "Promo 20% Wisata alam"
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CardWidget.medium(
                    imageUrl: "https://media.istockphoto.com/id/1432434937/photo/aerial-view-of-panama-canal-on-the-atlantic-side.webp?b=1&s=612x612&w=0&k=20&c=n48PbZKA0dFI7sLejIgu2mNZwH4KuIQktREwhKowa6g=",
                    title: "Promo 20% Wisata alam"
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CardWidget.medium(
                    imageUrl: "https://media.istockphoto.com/id/1432434937/photo/aerial-view-of-panama-canal-on-the-atlantic-side.webp?b=1&s=612x612&w=0&k=20&c=n48PbZKA0dFI7sLejIgu2mNZwH4KuIQktREwhKowa6g=",
                    title: "Promo 20% Wisata alam"
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CardWidget.medium(
                    imageUrl: "https://media.istockphoto.com/id/1432434937/photo/aerial-view-of-panama-canal-on-the-atlantic-side.webp?b=1&s=612x612&w=0&k=20&c=n48PbZKA0dFI7sLejIgu2mNZwH4KuIQktREwhKowa6g=",
                    title: "Promo 20% Wisata alam"
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CardWidget.medium(
                    imageUrl: "https://media.istockphoto.com/id/1432434937/photo/aerial-view-of-panama-canal-on-the-atlantic-side.webp?b=1&s=612x612&w=0&k=20&c=n48PbZKA0dFI7sLejIgu2mNZwH4KuIQktREwhKowa6g=",
                    title: "Promo 20% Wisata alam"
                  ),
                ),
              ],
            )
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.only(left: 19, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Rekomendasi Wisata",
                  style: TextStyleWidget.titleT2(
                    color: ColorThemeStyle.black100,
                    fontWeight: FontWeight.w600
                  )
                ),
                GestureDetector(
                  onTap: (){
                    //TODO : Navigasi menggunakan tombol Lihat Semua
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          Provider.of<BottomNavigationBarProvider>(context).onChangeIndex(1);
                          return const MainScreen();
                        }
                      )
                    );
                  },
                  child: Text(
                    "Lihat semua",
                    style: TextStyleWidget.bodyB3(
                      color: ColorThemeStyle.black100,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                )
              ],
            ),
          ),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8
            ),
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return CardWidget.small(
                imageUrl: "https://upload.wikimedia.org/wikipedia/commons/e/e1/Pemandangan_Gunung_Bromo.jpg",
                title: "Wisata alam",
                location: "Surabaya",
                subtitle: "Rp 200.000"
              );
            },
          ),
          const SizedBox(height: 40)
        ],
      ),
    );
  }
}