import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/account_screen_component/component/edit_account_screen_component/component/edit_account_info_component/edit_account_info_component.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/account_screen_component/component/edit_account_screen_component/component/edit_account_photo_component/edit_account_photo_component.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/profile_provider.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class EditAccountScreenComponent extends StatelessWidget {
  const EditAccountScreenComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Edit Akun',
          style: TextStyleWidget.titleT2(
            fontWeight: FontWeightStyle.semiBold,
          ),
        ),
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
              EditAccountPhotoComponent(
                  imageUrl: profileProvider.user.photoProfil),
              const SizedBox(
                height: 32,
              ),
              EditAccountInfoComponent(
                name: profileProvider.user.name,
                username: profileProvider.user.username,
                noHp: profileProvider.user.phoneNumber,
                email: profileProvider.user.email,
              ),
            ],
          );
        } else {
          return const Column(
            children: [
              SizedBox(
                height: 40,
              ),
              EditAccountPhotoComponent(imageUrl: ''),
              SizedBox(
                height: 32,
              ),
              EditAccountInfoComponent(),
            ],
          );
        }
      }),
    );
  }
}
