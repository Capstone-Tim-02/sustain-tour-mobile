import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/screen/login_screen/login_provider.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/account_screen_component/component/edit_account_screen_component/component/edit_account_photo_component/component/edit_account_photo_option_component/component/edit_account_photo_option_item_component/edit_account_photo_option_item_component.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/profile_provider.dart';
import 'package:sustain_tour_mobile/widget/snack_bar_widget.dart';

class EditAccountPhotoFromGallery extends StatelessWidget {
  const EditAccountPhotoFromGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final profileProvider =
            Provider.of<ProfileProvider>(context, listen: false);
        XFile? image = await profileProvider.getImageFromGallery();

        if (image != null) {
          if (!context.mounted) return;
          File selectedImage = File(image.path);

          final loginProvider =
              Provider.of<LoginProvider>(context, listen: false);

          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return const AlertDialog(
                  backgroundColor: Colors.white,
                  content: SizedBox(
                    height: 100,
                    child: Center(child: CircularProgressIndicator()),
                  ),
                );
              });

          await profileProvider.uploadProfileImage(
            userId: loginProvider.userId ?? -1,
            image: selectedImage,
          );

          if (!context.mounted) return;
          Provider.of<LoginProvider>(context, listen: false).loadData();

          Navigator.pop(context);
          Navigator.pop(context);

          ScaffoldMessenger.of(context).showSnackBar(
              SnackBarWidget.snackBarWidget(message: profileProvider.message));
        }
      },
      child: EditAccountPhotoOptionItemComponent(
        icon: Padding(
          padding: const EdgeInsets.only(left: 3),
          child: SvgPicture.asset(
            Assets.assetsIconsGallery,
            width: 30,
            // height: 36,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
        text: 'Ambil dari galeri',
      ),
    );
  }
}
