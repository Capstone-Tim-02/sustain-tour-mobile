import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/screen/explore_screen/explore_screen.dart';
import 'package:sustain_tour_mobile/screen/home_screen/home_screen.dart';
import 'package:sustain_tour_mobile/widget/bottom_navbar_widget/bottom_navbar_widget.dart';
import 'package:sustain_tour_mobile/widget/bottom_navbar_widget/bottom_navbar_widget_provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  Widget buildBody(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return const ExploreScreen();
      case 2:
        return const Text('Halaman ketiga');
      case 3:
        return const Text('Halaman keempat');
      case 4:
        return const Text('Halaman kelima');
      default:
        return const Text('Halaman utama');
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomNavigationBarProvider>(context);

    return Scaffold(
      body: buildBody(provider.currentIndex),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}
