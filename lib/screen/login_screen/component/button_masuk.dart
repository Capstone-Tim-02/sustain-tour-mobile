import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/screen/login_screen/login_provider.dart';
import 'package:sustain_tour_mobile/screen/login_screen/matchmaking_question/matchmaking_1.dart';
import 'package:sustain_tour_mobile/screen/login_screen/component/from_password_screns.dart';
import 'package:sustain_tour_mobile/screen/login_screen/component/from_username_screens.dart';
import 'package:sustain_tour_mobile/widget/button_widget.dart';

class BUttonMasuk extends StatelessWidget {
  const BUttonMasuk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ButtonWidget.defaultContainer(
          onPressed: () {
            Provider.of<FormPasswordProvider>(context, listen: false)
                .validatePassword();
            Provider.of<FromUsernameProvider>(context, listen: false)
                .validateEmail();
            String username =
                Provider.of<FromUsernameProvider>(context, listen: false)
                    .emailController
                    .text;
            String password =
                Provider.of<FormPasswordProvider>(context, listen: false)
                    .passwordController
                    .text;

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

                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) => const Matchmaking1()),
                  );
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
          text: 'Masuk',
        ),
      ],
    );
  }
}
