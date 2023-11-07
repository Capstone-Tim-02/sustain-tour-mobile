import 'package:flutter/material.dart';

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
        return const Text('Halaman kelima');
      default:
        return const Text('Halaman utama');
    }
  }


  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
