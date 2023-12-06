import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/account_screen_component/component/edit_account_screen_component/component/edit_account_photo_component/component/edit_account_photo_option_component/component/delete_account_photo_component/delete_account_photo_component.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/account_screen_component/component/edit_account_screen_component/component/edit_account_photo_component/component/edit_account_photo_option_component/component/edit_account_photo_from_camera/edit_account_photo_from_camera.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/account_screen_component/component/edit_account_screen_component/component/edit_account_photo_component/component/edit_account_photo_option_component/component/edit_account_photo_from_gallery/edit_account_photo_from_gallery.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';

class EditAccountPhotoOptionComponent extends StatelessWidget {
  const EditAccountPhotoOptionComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(40))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 5,
                width: 157,
                decoration: const BoxDecoration(
                    color: ColorThemeStyle.grey80,
                    borderRadius: BorderRadius.all(Radius.circular(4))),
              )
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          const EditAccountPhotoFromCamera(),
          const SizedBox(
            height: 16,
          ),
          const EditAccountPhotoFromGallery(),
          const SizedBox(
            height: 16,
          ),
          const DeleteAccountPhotoComponent(),
          const SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }
}
