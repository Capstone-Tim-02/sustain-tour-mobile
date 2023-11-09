import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/profile_app_bar_component/profile_app_bar_component.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/profile_screen.dart';
import 'package:sustain_tour_mobile/widget/bottom_navbar_widget/bottom_navbar_widget.dart';
import 'package:sustain_tour_mobile/widget/bottom_navbar_widget/bottom_navbar_widget_provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  Widget buildBody(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return const Text('Halaman utama');
      case 1:
        return const Text('Halaman kedua');
      case 2:
        return const Text('Halaman ketiga');
      case 3:
        return const Text('Halaman keempat');
      case 4:
        return const ProfileScreen();
      default:
        return const Text('Halaman utama');
    }
  }

  AppBar buildAppBar(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return AppBar();
      case 1:
        return AppBar();
      case 2:
        return AppBar();
      case 3:
        return AppBar();
      case 4:
        return ProfileAppBarComponent.profileAppBar;
      default:
        return AppBar();
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomNavigationBarProvider>(context);

    return Scaffold(
      appBar: buildAppBar(provider.currentIndex),
      body: buildBody(provider.currentIndex),
      bottomNavigationBar: const BottomNavigationBarWidget(),
      backgroundColor: Colors.white,
    );
  }
}
