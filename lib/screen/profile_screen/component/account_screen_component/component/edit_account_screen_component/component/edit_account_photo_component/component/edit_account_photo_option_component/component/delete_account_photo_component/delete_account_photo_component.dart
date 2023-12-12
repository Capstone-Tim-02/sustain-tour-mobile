import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/screen/login_screen/login_provider.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/account_screen_component/component/edit_account_screen_component/component/edit_account_photo_component/component/edit_account_photo_option_component/component/edit_account_photo_option_item_component/edit_account_photo_option_item_component.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/alert_dialog_component/alert_dialog_component.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/profile_provider.dart';
import 'package:sustain_tour_mobile/widget/snack_bar_widget.dart';

class DeleteAccountPhotoComponent extends StatelessWidget {
  const DeleteAccountPhotoComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialogComponent(
                text: 'Apakah anda yakin ingin menghapus foto akun?',
                onPressedNoButton: () => Navigator.pop(context),
                onPressedYesButton: () async {
                  final profileProvider =
                      Provider.of<ProfileProvider>(context, listen: false);
                  final loginProvider =
                      Provider.of<LoginProvider>(context, listen: false);

                  await profileProvider.deleteProfileImage(
                      userId: loginProvider.userId ?? -1,
                  );

                  if (!context.mounted) return;

                  Navigator.pop(context);
                  Navigator.pop(context);

                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBarWidget.snackBarWidget(
                          message: profileProvider.message));
                },
              );
            });
      },
      child: EditAccountPhotoOptionItemComponent(
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
    );
  }
}
