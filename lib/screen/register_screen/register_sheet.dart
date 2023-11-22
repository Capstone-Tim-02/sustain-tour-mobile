import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/screen/login_screen/login_screen.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
import 'package:sustain_tour_mobile/widget/button_widget.dart';

class RegisterSheet extends StatelessWidget {
  const RegisterSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.all(16),
      child: Container(
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 16,
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: Image.asset(Assets.assetsImagesSelamatDatang)),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Yeayy Berhasil Daftar',
              style: TextStyleWidget.headlineH3(fontWeight: FontWeightStyle.semiBold),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              'Silahkan cek email kamu untuk verifikasi akun, dan setelah itu lakukan login',
              style: TextStyleWidget.bodyB1(fontWeight: FontWeightStyle.light),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 31,
            ),
            ButtonWidget.defaultContainer(
              text: 'Masuk',
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const LoginScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}