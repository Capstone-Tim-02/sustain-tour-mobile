import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/constants/routes.dart';
import 'package:sustain_tour_mobile/models/api/google_sigin_api.dart';
import 'package:sustain_tour_mobile/screen/login_screen/login_provider.dart';

import 'package:sustain_tour_mobile/screen/register_screen/register_provider.dart';

import 'package:sustain_tour_mobile/widget/button_widget.dart';

class ButtonMasukGoogle extends StatefulWidget {
  const ButtonMasukGoogle({super.key});

  @override
  State<ButtonMasukGoogle> createState() => _ButtonMasukGoogleState();
}

class _ButtonMasukGoogleState extends State<ButtonMasukGoogle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ButtonWidget.defaultOutline(
          svgIcon: Assets.assetsIconsGoogle,
          text: 'Daftar Pakai Google',
          onPressed: () async {
            // GoogleSiginApi.signout();
            try {
              final user = await GoogleSiginApi.loginGoogle();
              if (user != null && mounted) {
                print(user.displayName);
                print(user.email);
                print(user.uid);
                print(user.phoneNumber);
                RegisterProvider authProvider =
                    Provider.of<RegisterProvider>(context, listen: false);
                authProvider.registerUser('Wahyuu', 'Wahyu123', 'alterra5',
                    'alterra5', user.email.toString(), '09876543212');
                LoginProvider loginProvider =
                    Provider.of<LoginProvider>(context, listen: false);
                loginProvider
                    .loginUser('Wahyu123', 'alterra5')
                    .then((loggedIn) {
                  if (loggedIn) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        Routes.mainScreen, (route) => false);
                  }
                });
              }
            } on FirebaseAuthException catch (e) {
              print(e.message);
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('data')));
            } catch (error) {
              print(error);
            }
          },
        ),
      ],
    );
  }
}
