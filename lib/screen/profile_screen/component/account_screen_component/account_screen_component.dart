import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/account_screen_component/component/account_info_component/account_info_component.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/account_screen_component/component/account_photo_component/account_photo_component.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/account_screen_component/component/popup_menu_component/popup_menu_component.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/profile_provider.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class AccountScreenComponent extends StatelessWidget {
  const AccountScreenComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Akun',
          style: TextStyleWidget.titleT2(
            fontWeight: FontWeightStyle.semiBold,
          ),
        ),
        actions: const [
          PopupMenuComponent(),
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
      ),
      body:
          Consumer<ProfileProvider>(builder: (context, profileProvider, child) {
        if (!profileProvider.isLoading) {
          return Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              AccountPhotoComponent(
                  imageUrl: profileProvider.profileModel.user.photoProfil),
              const SizedBox(
                height: 32,
              ),
              AccountInfoComponent(
                name: profileProvider.profileModel.user.name,
                username: profileProvider.profileModel.user.username,
                noHp: profileProvider.profileModel.user.phoneNumber,
                email: profileProvider.profileModel.user.email,
              ),
            ],
          );
        } else {
          return const Column(
            children: [
              SizedBox(
                height: 40,
              ),
              AccountPhotoComponent(imageUrl: ''),
              SizedBox(
                height: 32,
              ),
              AccountInfoComponent()
            ],
          );
        }
      }),
      backgroundColor: Colors.white,
    );
  }
}
