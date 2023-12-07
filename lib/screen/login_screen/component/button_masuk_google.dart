import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/screen/onboarding_screen/onboarding_screen.dart';
import 'package:sustain_tour_mobile/widget/button_widget.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:url_launcher/url_launcher.dart';

class ButtonMasukGoogle extends StatelessWidget {
  final Uri _url =
      Uri.parse('https://destimate.uc.r.appspot.com/auth/google/initiate');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  Future<void> _handleSignIn(BuildContext context) async {
    try {
      GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();

      if (googleSignInAccount != null) {
        String id = googleSignInAccount.id;
        String token = (await googleSignInAccount.authentication).idToken!;

        print('Google ID: $id');
        print('Google Token: $token');

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => OnboardingScreen(),
          ),
        );
      } else {
        print('Login dibatalkan');
      }
    } catch (error) {
      print('Error: $error');
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ButtonWidget.defaultOutline(
          svgIcon: Assets.assetsIconsGoogle,
          text: 'Daftar Pakai Google',
          onPressed: () {
            _launchUrl();
          },
        ),
      ],
    );
  }
}
