import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/constants/routes.dart';
import 'package:sustain_tour_mobile/screen/login_screen/login_provider.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/alert_dialog_component/alert_dialog_component.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/profile_option_component/component/list_tile_widget.dart';
import 'package:sustain_tour_mobile/widget/bottom_navbar_widget/bottom_navbar_widget_provider.dart';

class ProfileOptionComponent extends StatelessWidget {
  const ProfileOptionComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
          child: ListTileWidget(
            isUsingShadow: true,
            title: 'Pusat Bantuan',
            subtitle: 'FAQ dan Virtual Asistent',
            iconSvgString: Assets.assetsIconsHelp,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            trailing: const Icon(Icons.navigate_next),
            onTap: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
          child: ListTileWidget(
            isUsingShadow: true,
            title: 'Term & Condition',
            subtitle: 'Syarat dan ketentuan',
            iconSvgString: Assets.assetsIconsInfo,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            trailing: const Icon(Icons.navigate_next),
            onTap: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
          child: ListTileWidget(
            isUsingShadow: true,
            title: 'Logout',
            subtitle: 'Keluar dari aplikasi',
            iconSvgString: Assets.assetsIconsLogout,
            iconColor: Colors.red,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            trailing: const Icon(Icons.navigate_next),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialogComponent(
                      text: 'Apakah anda yakin ingin logout?',
                      onPressedNoButton: () {
                        Navigator.pop(context);
                      },
                      onPressedYesButton: () {
                        Provider.of<LoginProvider>(context, listen: false)
                            .logout();
                        Navigator.pushNamedAndRemoveUntil(
                            context, Routes.splashScreen, (route) => false);
                        Provider.of<BottomNavigationBarProvider>(context,
                                listen: false)
                            .onChangeIndex(0);
                      },
                    );
                  });
            },
          ),
        ),
      ],
    );
  }
}
