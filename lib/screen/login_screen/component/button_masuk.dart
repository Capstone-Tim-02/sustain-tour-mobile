import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/constants/routes.dart';
import 'package:sustain_tour_mobile/screen/home_screen/components/notification_screen/notification_provider.dart';
import 'package:sustain_tour_mobile/screen/home_screen/home_screen_provider.dart';
import 'package:sustain_tour_mobile/screen/login_screen/login_provider.dart';
import 'package:sustain_tour_mobile/screen/login_screen/matchmaking_question/matchmaking_1.dart';
import 'package:sustain_tour_mobile/screen/login_screen/component/from_password_screns.dart';
import 'package:sustain_tour_mobile/screen/login_screen/component/from_username_screens.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/profile_emission_component/component/detail_emission_screen_component/component/travel_history_component/travel_history_provider.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/profile_emission_component/profile_emission_provider.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/profile_provider.dart';
import 'package:sustain_tour_mobile/widget/button_widget.dart';
import 'package:sustain_tour_mobile/widget/snack_bar_widget.dart';

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
                      SnackBarWidget.snackBarWidget(
                          message: authProvider.message));
                  Provider.of<FromUsernameProvider>(context, listen: false)
                      .emailController
                      .clear();
                  Provider.of<FormPasswordProvider>(context, listen: false)
                      .passwordController
                      .clear();
                  LoginProvider loginProvider =
                      Provider.of<LoginProvider>(context, listen: false);
                  ProfileProvider profileProvider =
                      Provider.of<ProfileProvider>(context, listen: false);
                  profileProvider.getUserData(
                      userId: loginProvider.userId ?? 0);

                  Future.delayed(const Duration(milliseconds: 1500), () async {
                    if(profileProvider.user.statusCategory == true){
                      HomeScreenProvider homeScreenProvider =
                        Provider.of<HomeScreenProvider>(context, listen: false);
                      homeScreenProvider.getRekomendasiWisata();
                      homeScreenProvider.getPromo();

                      Provider.of<TravelHistoryProvider>(context, listen: false)
                          .getBookingHistory();

                      Provider.of<NotificationProvider>(context, listen: false)
                          .getNotifications();

                      Provider.of<ProfileEmissionProvider>(context, listen: false)
                          .getUserEmission(
                        userId: loginProvider.userId ?? 0);

                      Navigator.pushReplacementNamed(
                          context, Routes.mainScreen);
                    } else {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => const Matchmaking1()),
                      );
                    }
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBarWidget.snackBarWidget(
                          message: authProvider.message));
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
