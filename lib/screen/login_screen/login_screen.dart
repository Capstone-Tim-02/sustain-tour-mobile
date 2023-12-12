import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/constants/routes.dart';
import 'package:sustain_tour_mobile/screen/login_screen/component/button_masuk.dart';
import 'package:sustain_tour_mobile/screen/login_screen/component/button_masuk_google.dart';
// import 'package:sustain_tour_mobile/screen/login_screen/component/button_masuk_google.dart';
import 'package:sustain_tour_mobile/screen/login_screen/component/textfield_password.dart';
import 'package:sustain_tour_mobile/screen/login_screen/component/textfield_username.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding:
            const EdgeInsets.only(top: 64, right: 19, left: 19, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Masuk',
                  style: TextStyleWidget.headlineH1(
                      fontWeight: FontWeightStyle.semiBold),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Login untuk Memulai Trip Kamu yang\nMenyenangkan',
                  style:
                      TextStyleWidget.bodyB1(fontWeight: FontWeightStyle.light),
                ),
                const SizedBox(
                  height: 32,
                ),
                const TextFieldUsername(),
                const SizedBox(
                  height: 10,
                ),
                const TextFieldPassword(),
                const SizedBox(height: 32),
                const BUttonMasuk(),
                const SizedBox(
                  height: 8,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('Atau')],
                ),
                const SizedBox(
                  height: 8,
                ),
                ButtonMasukGoogle(),
              ],
            ),
            const SizedBox(height: 32),
            const BUttonMasuk(),
            const SizedBox(
              height: 8,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('Atau')],
            ),
            const SizedBox(
              height: 8,
            ),
            ButtonMasukGoogle(),
            const SizedBox(
              height: 150,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
            children : [Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const Text('Belum Punya Akun?'),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, Routes.registerScreen);
                          },
                          child: const Text(
                            'Daftar',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),])
          ],
        ),
      ),
    );
  }
}
