import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/profile_option_component/component/list_tile_widget.dart';

class ProfileOptionComponent extends StatelessWidget {
  const ProfileOptionComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTileWidget(
          title: 'Akun',
          subtitle: 'Mengganti nama, username, password dll',
          iconSvgString: Assets.assetsIconsAccountCircleFill,
          onTap: () {},
        ),
        ListTileWidget(
          title: 'Pusat Bantuan',
          subtitle: 'FAQ dan Virtual Asistent',
          iconSvgString: Assets.assetsIconsHelp,
          onTap: () {},
        ),
        ListTileWidget(
          title: 'Term & Condition',
          subtitle: 'Lorem ipsum dolot sit amet',
          iconSvgString: Assets.assetsIconsAccountCircleFill,
          onTap: () {},
        ),
        ListTileWidget(
          title: 'Logout',
          subtitle: 'Keluar dari aplikasi',
          iconSvgString: Assets.assetsIconsLogout,
          onTap: () {},
        ),
      ],
    );
  }
}
