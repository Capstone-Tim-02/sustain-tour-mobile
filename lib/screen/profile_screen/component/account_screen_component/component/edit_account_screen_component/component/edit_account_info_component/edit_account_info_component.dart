import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/account_screen_component/component/edit_account_screen_component/component/edit_account_info_component/component/edit_text_field_component_widget/edit_text_field_component_widget.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/profile_option_component/component/list_tile_widget.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

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
            onPressed: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  isScrollControlled: true,
                  backgroundColor: Colors.white,
                  context: context,
                  builder: (context) {
                    return Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      margin: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const EditTextFieldComponentWidget(),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  'Batal',
                                  style: TextStyleWidget.titleT3(
                                    color: Colors.black,
                                    fontWeight: FontWeightStyle.semiBold,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 54,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  'Simpan',
                                  style: TextStyleWidget.titleT3(
                                    color: Colors.black,
                                    fontWeight: FontWeightStyle.semiBold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  });
            },
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
