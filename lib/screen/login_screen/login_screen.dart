import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';

import 'package:sustain_tour_mobile/screen/login_screen/login_provider.dart';
import 'package:sustain_tour_mobile/screen/main_screen/main_screen.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
import 'package:sustain_tour_mobile/widget/button_widget.dart';
import 'package:sustain_tour_mobile/widget/text_field_widget.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(top: 64, right: 19, left: 19),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
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
              style: TextStyleWidget.bodyB1(fontWeight: FontWeightStyle.light),
            ),
            const SizedBox(
              height: 32,
            ),
            TextFieldWidget(
                labelText: 'Email',
                hintText: 'Email',
                errorText: null,
                controller: _usernameController,
                prefixIcon: FractionallySizedBox(
                  widthFactor: 0.06,
                  child: SvgPicture.asset(
                    Assets.assetsIconsPersonOutline,
                    fit: BoxFit.contain,
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            TextFieldWidget(
                controller: _passwordController,
                labelText: 'Password',
                hintText: 'Pasword',
                errorText: null,
                suffixIcon: const Icon(Icons.visibility_off),
                prefixIcon: FractionallySizedBox(
                  widthFactor: 0.06,
                  child: SvgPicture.asset(
                    Assets.assetsIconsLock,
                    fit: BoxFit.contain,
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(),
                Row(
                  children: [
                    const Text('Lupa Password?'),
                    TextButton(
                        onPressed: () {}, child: const Text('Atur Ulang'))
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            ButtonWidget.defaultContainer(
                onPressed: () {
                  String username = _usernameController.text;
                  String password = _passwordController.text;
                  if (username.isNotEmpty && password.isNotEmpty) {
                    LoginProvider authProvider =
                        Provider.of<LoginProvider>(context, listen: false);
                    authProvider.loginUser(username, password).then((loggedIn) {
                      if (loggedIn) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(authProvider.message),
                          ),
                        );

                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const MainScreen()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(authProvider.message),
                          ),
                        ); // Handle login failure
                      }
                    });
                  }
                },
                text: 'Masuk'),
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
            ButtonWidget.defaultOutline(
                text: 'Daftar Pakai Google', onPressed: () {}),
            ElevatedButton(
              onPressed: () {
                LoginProvider authProvider =
                    Provider.of<LoginProvider>(context, listen: false);
                authProvider.logout();
                // Navigasi kembali ke halaman login setelah logout
                Navigator.of(context).pop();
              },
              child: const Text('Logout'),
            ),
            const SizedBox(
              height: 134,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const Text('Belum Punya Akun?'),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Daftar'),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
