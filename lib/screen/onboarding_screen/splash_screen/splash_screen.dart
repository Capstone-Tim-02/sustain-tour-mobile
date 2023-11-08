import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
import '../onboarding_screen.dart';
import 'splash_screen_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Provider.of<SplashScreenProvider>(context, listen: false)
          .loadDataSplasScreen()
          .then((_) {
        // Navigasi ke halaman home screen saat pengambilan data selesai.
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const CarouselPage()));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo_destimate.png',
              height: 116,
              width: 116,
            ),
            const SizedBox(
              height: 28,
            ),
            Text(
              'Destimate',
              style: TextStyleWidget.headlineH1(
                  fontWeight: FontWeightStyle.semiBold),
            )
          ],
        ),
      ),
    );
  }
}
