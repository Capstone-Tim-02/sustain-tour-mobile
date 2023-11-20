import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/account_screen_component/component/edit_account_screen_component/component/edit_account_photo_component/component/edit_account_photo_option_component/component/edit_account_photo_from_gallery/edit_account_photo_from_gallery.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/account_screen_component/component/edit_account_screen_component/component/edit_account_photo_component/component/edit_account_photo_option_component/component/edit_account_photo_option_item_component/edit_account_photo_option_item_component.dart';
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
          EditAccountPhotoOptionItemComponent(
            icon: SvgPicture.asset(
              Assets.assetsIconsCamera,
              width: 35,
              colorFilter:
                  const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
            text: 'Ambil Foto',
          ),
          const SizedBox(
            height: 16,
          ),
          const EditAccountPhotoFromGallery(),
          const SizedBox(
            height: 16,
          ),
          EditAccountPhotoOptionItemComponent(
            color: Colors.white,
            isUseShadow: true,
            icon: SvgPicture.asset(
              Assets.assetsIconsTrashBasket,
              width: 35,
              colorFilter: const ColorFilter.mode(Colors.red, BlendMode.srcIn),
            ),
            text: 'Hapus Foto',
            textColor: Colors.red,
          ),
          const SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }
}
