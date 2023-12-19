import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/constants/routes.dart';

import 'package:sustain_tour_mobile/models/api/google_sigin_api.dart';
import 'package:sustain_tour_mobile/screen/login_screen/login_provider.dart';
import 'package:sustain_tour_mobile/screen/register_screen/register_provider.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
import 'package:sustain_tour_mobile/widget/button_widget.dart';
import 'package:sustain_tour_mobile/widget/snack_bar_widget.dart';

class ButtonMasukGoogle extends StatefulWidget {
  const ButtonMasukGoogle({Key? key}) : super(key: key);

  @override
  _ButtonMasukGoogleState createState() => _ButtonMasukGoogleState();
}

class _ButtonMasukGoogleState extends State<ButtonMasukGoogle> {
  String generateRandomNumber(int length) {
    final random = Random();
    String result = '';

    for (int i = 0; i < length; i++) {
      result += random.nextInt(10).toString();
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Consumer<LoginProvider>(
          builder: (context, loginProvider, child) {
            return loginProvider.isLoadingLogin
              ? const SizedBox()
              : ButtonWidget.defaultOutline(
                  svgIcon: Assets.assetsIconsGoogle,
                  text: 'Daftar Pakai Google',
                  onPressed: () async {
                    // GoogleSiginApi.signout();
                    try {
                      final user = await GoogleSiginApi.loginGoogle();
                      String randomNumber = generateRandomNumber(13);
                      if (user != null && mounted) {
                        print(user.displayName);
                        print(user.email);
                        print(user.uid);
                        print(
                          (randomNumber),
                        );
                        print(user.emailVerified);
                        RegisterProvider authProvider =
                            Provider.of<RegisterProvider>(context, listen: false);
                        authProvider.registerUser(
                          user.displayName.toString(),
                          user.displayName.toString(),
                          'alterra5',
                          'alterra5',
                          user.email.toString(),
                          randomNumber,
                        );
                        showBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Padding(
                              padding: const EdgeInsets.all(16),
                              child: Container(
                                child: Wrap(
                                  alignment: WrapAlignment.center,
                                  spacing: 16,
                                  children: [
                                    SizedBox(
                                        height: 200,
                                        width: 200,
                                        child: Image.asset(
                                            Assets.assetsImagesSelamatDatang)),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Text(
                                      'Silahkan cek email kamu untuk verifikasi akun',
                                      style: TextStyleWidget.bodyB1(
                                          fontWeight: FontWeightStyle.light),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(
                                      height: 31,
                                    ),
                                    ButtonWidget.defaultContainer(
                                      text: 'Masuk',
                                      onPressed: () async {
                                        LoginProvider loginProvider =
                                            Provider.of<LoginProvider>(context,
                                                listen: false);
                                        loginProvider
                                            .loginUser(
                                                user.displayName.toString(), 'alterra5')
                                            .then((logedIn) {
                                          if (logedIn) {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBarWidget.snackBarWidget(
                                                    message: loginProvider.message));
                                            Navigator.of(context)
                                                .pushNamedAndRemoveUntil(
                                              Routes.matchmaking1Screen,
                                              (route) => false,
                                            );
                                          } else {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBarWidget.snackBarWidget(
                                                    message: authProvider.message));
                                          }
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );

                        // Show BottomSheet
                      }
                    } on FirebaseAuthException catch (e) {
                      print(e.message);
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(content: Text('data')));
                    } catch (error) {
                      print(error);
                    }
                  },
                );
          },
        )
      ],
    );
  }
}
