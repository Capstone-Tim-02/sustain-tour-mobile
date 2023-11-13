import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/screen/home_screen/home_screen_provider.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/shadow_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
import 'package:sustain_tour_mobile/widget/badge_widget.dart';
import 'package:sustain_tour_mobile/widget/bottom_navbar_widget/bottom_navbar_widget_provider.dart';
import 'package:sustain_tour_mobile/widget/card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => setState(
        () {
          //TODO Gabungin sama auth
          final homeProvider = Provider.of<HomeScreenProvider>(context, listen: false);
          homeProvider.getUserData(id: 33, token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InN0ZXZlbiIsImV4cCI6MTY5OTg1ODE4MSwiaWF0IjoxNjk5NzcxNzgxfQ.eYF06ejiaTGNA-JudNUpTYCTNc2o21zBA5jNRSKHBy0");
          homeProvider.getPromo(token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InN0ZXZlbiIsImV4cCI6MTY5OTg1ODE4MSwiaWF0IjoxNjk5NzcxNzgxfQ.eYF06ejiaTGNA-JudNUpTYCTNc2o21zBA5jNRSKHBy0");
          homeProvider.getRekomendasiWisata(token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InN0ZXZlbiIsImV4cCI6MTY5OTg1ODE4MSwiaWF0IjoxNjk5NzcxNzgxfQ.eYF06ejiaTGNA-JudNUpTYCTNc2o21zBA5jNRSKHBy0");
        },
      ),
    );
    super.didChangeDependencies();
  }

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
                  color: ColorThemeStyle.blue100,
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
                        Consumer<HomeScreenProvider>(
                          builder: (context, homeScreenProvider, child) {
                            return Text(
                              "Hi, ${homeScreenProvider.userData?.name ?? " ........"}",
                              style: TextStyleWidget.titleT2(
                                color: ColorThemeStyle.white100,
                                fontWeight: FontWeight.w500
                              ),
                            );
                          },
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
                    CircleAvatar(
                      backgroundColor: ColorThemeStyle.white100,
                      radius: 28,
                      child: IconButton(
                        onPressed: (){
                          //TODO : Navigasi ke page Notification

                        },
                        padding: const EdgeInsets.all(12),
                        icon: const Icon(
                          Icons.notifications_active,
                          color: ColorThemeStyle.black100,
                          size: 32,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Provider.of<BottomNavigationBarProvider>(context, listen: false).onChangeIndex(1);
                  },
                  child: Container(
                    height: 136,
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
                          const SizedBox(height: 8),
                          Consumer<HomeScreenProvider>(
                            builder: (context, homeScreenProvider, child) {
                              return Text(
                                "${homeScreenProvider.userData?.points ?? "--"} Desti Poin",
                                style: TextStyleWidget.headlineH2(
                                  color: ColorThemeStyle.black100,
                                  fontWeight: FontWeight.w700
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 21),
                          GestureDetector(
                            onTap: () {
                              //TODO Navigasi ke Halaman Poin
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Selengkapnya",
                                  style: TextStyleWidget.titleT3(
                                    color: ColorThemeStyle.black100,
                                    fontWeight: FontWeight.w600
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
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 32, bottom: 8, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Penawaran Khusus",
                  style: TextStyleWidget.titleT2(
                    color: ColorThemeStyle.black100,
                    fontWeight: FontWeight.w600
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Provider.of<BottomNavigationBarProvider>(context, listen: false).onChangeIndex(1);
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
          SizedBox(
            height: 130,
            child: Consumer<HomeScreenProvider>(
              builder: (context, homeScreenProvider, child) {
                return homeScreenProvider.isLoadingPromo ?
                const Center(
                  child: CircularProgressIndicator()
                ) :
                homeScreenProvider.isGetPromoSuccess ?
                  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: homeScreenProvider.listPromo.length,
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: CardWidget.medium(
                          imageUrl: homeScreenProvider.listPromo[index].imageVoucher,
                          title: homeScreenProvider.listPromo[index].title
                        ),
                      );
                    },
                  ) :
                  Column(
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        "Terjadi kesalahan!",
                        style: TextStyleWidget.titleT2(
                          fontWeight: FontWeight.w700,
                          color: ColorThemeStyle.red
                        ),
                      ),
                      const SizedBox(height: 16),
                      BadgeWidget.container(
                        onPressed: (){
                          didChangeDependencies();
                        },
                        label: "Muat ulang"
                      )
                    ],
                  );
              },
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
                    Provider.of<BottomNavigationBarProvider>(context, listen: false).onChangeIndex(1);
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
          Consumer<HomeScreenProvider>(
            builder: (context, homeScreenProvider, child) {
              return homeScreenProvider.isLoadingWisata ?
                const Padding(
                  padding: EdgeInsets.all(40),
                  child: Center(
                    child: CircularProgressIndicator()
                  ),
                ) :
                homeScreenProvider.isGetWisataSuccess ?
                  GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8
                    ),
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: homeScreenProvider.listWisata.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CardWidget.small(
                        imageUrl: homeScreenProvider.listWisata[index].photoWisata1,
                        title: homeScreenProvider.listWisata[index].title,
                        location: homeScreenProvider.listWisata[index].kota,
                        price: homeScreenProvider.listWisata[index].price
                      );
                    },
                  ) :
                  Column(
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        "Terjadi kesalahan!",
                        style: TextStyleWidget.titleT2(
                          fontWeight: FontWeight.w700,
                          color: ColorThemeStyle.red
                        ),
                      ),
                      const SizedBox(height: 16),
                      BadgeWidget.container(
                        onPressed: (){
                          didChangeDependencies();
                        },
                        label: "Muat ulang"
                      )
                    ],
                  );
            },
          ),
          const SizedBox(height: 40)
        ],
      ),
    );
  }
}