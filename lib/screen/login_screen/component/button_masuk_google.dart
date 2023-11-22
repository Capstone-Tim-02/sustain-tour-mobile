import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/widget/button_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ButtonMasukGoogle extends StatelessWidget {
  ButtonMasukGoogle({Key? key}) : super(key: key);
  final Uri _url =
      Uri.parse('https://destimate.uc.r.appspot.com/auth/google/initiate');
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
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
