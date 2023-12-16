import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/widget/button_widget.dart';
import 'package:google_sign_in/google_sign_in.dart';

const List<String> scopes = <String>[
  'email',
  'https://destimate.uc.r.appspot.com/auth/google/initiate',
];

GoogleSignIn _googleSignIn = GoogleSignIn(
  // Optional clientId
  // clientId: 'your-client_id.apps.googleusercontent.com',
  scopes: scopes,
);

class ButtonMasukGoogle extends StatefulWidget {
  const ButtonMasukGoogle({super.key});

  @override
  State<ButtonMasukGoogle> createState() => _ButtonMasukGoogleState();
}

class _ButtonMasukGoogleState extends State<ButtonMasukGoogle> {
  GoogleSignInAccount? _curentuser;
  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  @override
  void initState() {
    _googleSignIn.onCurrentUserChanged.listen((event) {
      setState(() {
        _curentuser = event;
      });
    });
    _googleSignIn.signInSilently();
    super.initState();
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
            _handleSignIn();
            print('object');
            print(_curentuser?.displayName ?? '-');
          },
        ),
      ],
    );
  }
}
