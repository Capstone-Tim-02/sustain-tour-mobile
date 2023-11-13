import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/profile_option_component/component/list_tile_widget.dart';

class EditAccountInfoComponent extends StatelessWidget {
  final String? name;
  final String? username;
  final String? noHp;
  final String? email;
  const EditAccountInfoComponent(
      {super.key, this.name, this.username, this.noHp, this.email});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTileWidget(
          title: 'Nama',
          subtitle: name ?? '-',
          iconSvgString: Assets.assetsIconsName,
          iconSize: 30,
          trailing: IconButton(
            icon: const Icon(
              Icons.edit,
              size: 24,
            ),
            onPressed: () {},
          ),
        ),
        ListTileWidget(
          title: 'Username',
          subtitle: username ?? '-',
          iconSvgString: Assets.assetsIconsUsername,
          iconSize: 30,
          trailing: IconButton(
            icon: const Icon(
              Icons.edit,
              size: 24,
            ),
            onPressed: () {},
          ),
        ),
        ListTileWidget(
          title: 'No Handphone',
          subtitle: noHp ?? '-',
          iconSvgString: Assets.assetsIconsPhone,
          iconSize: 30,
          trailing: IconButton(
            icon: const Icon(
              Icons.edit,
              size: 24,
            ),
            onPressed: () {},
          ),
        ),
        ListTileWidget(
          title: 'Email',
          subtitle: email ?? '-',
          iconSvgString: Assets.assetsIconsEmail,
          iconSize: 30,
          trailing: IconButton(
            icon: const Icon(
              Icons.edit,
              size: 24,
            ),
            onPressed: () {},
          ),
        ),
        ListTileWidget(
          title: 'Password',
          subtitle: '***********',
          iconSvgString: Assets.assetsIconsKey,
          iconSize: 30,
          trailing: IconButton(
            icon: const Icon(
              Icons.edit,
              size: 24,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
