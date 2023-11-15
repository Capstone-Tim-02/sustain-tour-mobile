import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/widget/button_widget.dart';

class ButtonMasukGoogle extends StatelessWidget {
  const ButtonMasukGoogle({Key? key}) : super(key: key);

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
            // LoginProvider yourProvider =
            //     Provider.of<LoginProvider>(context, listen: false);

            // // Panggil metode launchUrl
            // yourProvider.loginDenganGogle();
          },
        ),
      ],
    );
  }
}
