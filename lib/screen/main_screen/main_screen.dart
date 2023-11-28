import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/screen/explore_screen/components/title_explore.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/profile_app_bar_component/profile_app_bar_component.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/profile_screen.dart';
import 'package:sustain_tour_mobile/screen/explore_screen/explore_screen.dart';
import 'package:sustain_tour_mobile/screen/home_screen/home_screen.dart';
import 'package:sustain_tour_mobile/screen/tiket_screen/component/tiket_app_bar_component/tiket_app_bar_component.dart';
import 'package:sustain_tour_mobile/screen/tiket_screen/tiket_screen.dart';
import 'package:sustain_tour_mobile/widget/bottom_navbar_widget/bottom_navbar_widget.dart';
import 'package:sustain_tour_mobile/widget/bottom_navbar_widget/bottom_navbar_widget_provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  AppBar? buildAppBar(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return null;
      case 1:
        return TitleExplore.exploreAppBar;
      case 2:
        return AppBar();
      case 3:
        return TiketAppBarComponent.tiketAppBar;
      case 4:
        return ProfileAppBarComponent.profileAppBar;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomNavigationBarProvider>(context);

    return Scaffold(
      appBar: buildAppBar(provider.currentIndex),
      body: IndexedStack(index: provider.currentIndex, children: const [
        HomeScreen(),
        ExploreScreen(),
        Text("Halaman Ketiga"),
        Text("Halaman Keempat"),
        ProfileScreen(),
      ]),
      bottomNavigationBar: const BottomNavigationBarWidget(),
      backgroundColor: Colors.white,
    );
  }
}
