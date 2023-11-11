import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/screen/home_screen/home_screen_provider.dart';
import 'package:sustain_tour_mobile/screen/main_screen/main_screen.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/shadow_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
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
          final homeProvider = Provider.of<HomeScreenProvider>(context, listen: false);
          homeProvider.getRekomendasiWisata(token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InN0ZXZlbiIsImV4cCI6MTY5OTc1MDU1OSwiaWF0IjoxNjk5NjY0MTU5fQ.VH70WgJZQb_AlEoF2jLawWc_iM_wJhvcuU-mzq6nQeg");
          homeProvider.getPromo(token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InN0ZXZlbiIsImV4cCI6MTY5OTc1MDU1OSwiaWF0IjoxNjk5NjY0MTU5fQ.VH70WgJZQb_AlEoF2jLawWc_iM_wJhvcuU-mzq6nQeg");
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
                //TODO Logic ke halaman poin
                child: GestureDetector(
                  onTap: () {
                    
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
                          Text(
                            "60 Desti poin",
                            style: TextStyleWidget.headlineH2(
                              color: ColorThemeStyle.black100,
                              fontWeight: FontWeight.w700
                            ),
                          ),
                          const SizedBox(height: 21),
                          GestureDetector(
                            onTap: () {},
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
                    //TODO : Navigasi menggunakan tombol Lihat Semua ke halaman promo
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
          SizedBox(
            height: 130,
            child: Consumer<HomeScreenProvider>(
              builder: (context, homeScreenProvider, child) {
                return homeScreenProvider.isLoading == true ?
                const Center(
                  child: CircularProgressIndicator()
                ) :
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
                    //TODO : Navigasi menggunakan tombol Lihat Semua ke halaman explore
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
          Consumer<HomeScreenProvider>(
            builder: (context, homeScreenProvider, child) {
              return homeScreenProvider.isLoading == true ?
                const Padding(
                  padding: EdgeInsets.all(40),
                  child: Center(
                    child: CircularProgressIndicator()
                  ),
                ) :
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
                );
            },
          ),
          const SizedBox(height: 40)
        ],
      ),
    );
  }
}