import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/widget/bottom_navbar_widget/bottom_navbar_widget_provider.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomNavigationBarProvider>(context);
    return Container(
      height: 80,
      width: 464,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 0,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: ColorThemeStyle.white100,
        selectedItemColor: ColorThemeStyle.blue60, //ganti warna
        unselectedItemColor: ColorThemeStyle.grey80,
        showUnselectedLabels: true, // Menampilkan label selalu
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.assetsIconsHomeFill2,
              width: 24,
              height: 24,
            ),
            label: 'Home',
            activeIcon: SvgPicture.asset(
              Assets.assetsIconsHome,
              width: 24,
              height: 24,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.assetsIconsLocationFill2,
              width: 24,
              height: 24,
            ),
            label: 'Explore',
            activeIcon: SvgPicture.asset(
              Assets.assetsIconsLocation,
              width: 24,
              height: 24,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.assetsIconsPromo2,
              width: 24,
              height: 24,
            ),
            label: 'Promo',
            activeIcon: SvgPicture.asset(
              Assets.assetsIconsTag,
              width: 24,
              height: 24,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.assetsIconsTicketOn2,
              width: 24,
              height: 24,
            ),
            label: 'Ticket',
            activeIcon: SvgPicture.asset(
              Assets.assetsIconsReceipt,
              width: 24,
              height: 24,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.assetsIconsUsers2,
              width: 24,
              height: 24,
            ),
            label: 'Profile',
            activeIcon: SvgPicture.asset(
              Assets.assetsIconsProfile,
              width: 24,
              height: 24,
            ),
          ),
        ],
        currentIndex: provider.currentIndex,
        onTap: (index) {
          provider.onChangeIndex(index);
        },
      ),
    );
  }
}
