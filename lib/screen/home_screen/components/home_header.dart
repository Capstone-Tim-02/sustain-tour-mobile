import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/constants/routes.dart';
import 'package:sustain_tour_mobile/screen/home_screen/components/notification_screen/notification_provider.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/profile_provider.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      margin: const EdgeInsets.only(left: 16, right: 16, top: 70),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer<ProfileProvider>(
                builder: (context, profileProvider, child) {
                  return profileProvider.isLoading
                      ? Text(
                          "Loading ....",
                          style: TextStyleWidget.titleT2(
                              color: ColorThemeStyle.white100,
                              fontWeight: FontWeight.w500),
                        )
                      : Text(
                          "Hi, ${profileProvider.user.name}",
                          style: TextStyleWidget.titleT2(
                              color: ColorThemeStyle.white100,
                              fontWeight: FontWeight.w500),
                        );
                },
              ),
              const SizedBox(height: 8),
              Text(
                "Selamat Datang",
                style: TextStyleWidget.headlineH3(
                    color: ColorThemeStyle.white100,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          Consumer<NotificationProvider>(
            builder: (context, notifProvider, child) {
              if (notifProvider.isContainUnreadNotif) {
                return Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    CircleAvatar(
                      backgroundColor: ColorThemeStyle.white100,
                      radius: 28,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.notifikasiScreen);
                        },
                        padding: const EdgeInsets.all(12),
                        icon: const Icon(
                          Icons.notifications_active,
                          color: ColorThemeStyle.blue100,
                          size: 32,
                        ),
                      ),
                    ),
                    Container(
                      width: 14,
                      height: 14,
                      margin: const EdgeInsets.only(top: 3),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                );
              } else {
                return CircleAvatar(
                  backgroundColor: ColorThemeStyle.white100,
                  radius: 28,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.notifikasiScreen);
                    },
                    padding: const EdgeInsets.all(12),
                    icon: const Icon(
                      Icons.notifications_active,
                      color: ColorThemeStyle.blue100,
                      size: 32,
                    ),
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
