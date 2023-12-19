import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/constants/routes.dart';
import 'package:sustain_tour_mobile/screen/home_screen/components/notification_screen/notification_provider.dart';
import 'package:sustain_tour_mobile/screen/home_screen/home_screen_provider.dart';
import 'package:sustain_tour_mobile/screen/login_screen/login_provider.dart';
import 'package:sustain_tour_mobile/screen/login_screen/component/from_password_screns.dart';
import 'package:sustain_tour_mobile/screen/login_screen/component/from_username_screens.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/profile_emission_component/component/detail_emission_screen_component/component/travel_history_component/travel_history_provider.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/profile_emission_component/profile_emission_provider.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/profile_provider.dart';
import 'package:sustain_tour_mobile/screen/promo_screen/promo_provider.dart';
import 'package:sustain_tour_mobile/widget/bottom_navbar_widget/bottom_navbar_widget_provider.dart';
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
        Consumer<LoginProvider>(
          builder: (context, loginProvider, child) {
            return loginProvider.isLoadingLogin
              ? const Center(child: CircularProgressIndicator())
              : ButtonWidget.defaultContainer(
                  onPressed: () async {
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
                      authProvider.loginUser(username, password).then((loggedIn) async {
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

                          await profileProvider.getUserData(userId: loginProvider.userId ?? 0);
                          if (!context.mounted) return;

                          if (profileProvider.user.statusCategory == true) {
                            HomeScreenProvider homeScreenProvider =
                                Provider.of<HomeScreenProvider>(context,
                                    listen: false);
                            ProfileProvider profileProvider =
                                Provider.of<ProfileProvider>(context,
                                    listen: false);
                            PromoProvider promoProvider =
                                Provider.of<PromoProvider>(context,
                                    listen: false);
                            TravelHistoryProvider travelHistoryProvider =
                                Provider.of<TravelHistoryProvider>(context, listen: false);
                            NotificationProvider notificationProvider =
                                Provider.of<NotificationProvider>(context, listen: false);
                            ProfileEmissionProvider profileEmissionProvider =
                                Provider.of<ProfileEmissionProvider>(context,
                                  listen: false);

                            homeScreenProvider.getRekomendasiWisata();
                            promoProvider.getUserPromo();
                            homeScreenProvider.getPromo();
                            profileProvider.getUserData(
                                userId: loginProvider.userId ?? 0);

                            travelHistoryProvider.getBookingHistory();
                            notificationProvider.getNotifications();

                            profileEmissionProvider.getUserEmission(
                              userId: loginProvider.userId ?? 0,
                            );

                            Provider.of<BottomNavigationBarProvider>(context,
                                    listen: false)
                                .onChangeIndex(0);
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              Routes.mainScreen,
                              (route) => false,
                            );
                          } else {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              Routes.matchmaking1Screen,
                              (route) => false,
                            );
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBarWidget.snackBarWidget(
                                  message: authProvider.message));
                        }
                      });
                    }
                  },
                  text: 'Masuk',
                );
          },
        ),
      ],
    );
  }
}
