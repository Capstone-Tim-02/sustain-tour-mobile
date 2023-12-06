import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/account_screen_component/component/edit_account_screen_component/component/edit_account_photo_component/component/edit_account_photo_option_component/edit_account_photo_option_component.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';

class EditAccountPhotoComponent extends StatelessWidget {
  final String imageUrl;
  const EditAccountPhotoComponent({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
                height: 182,
                width: 182,
                decoration: const BoxDecoration(
                  color: ColorThemeStyle.grey50,
                  shape: BoxShape.circle,
                ),
                child: imageUrl.isNotEmpty
                    ? ClipOval(
                        child: Image.network(
                          imageUrl,
                          width: 182,
                          height: 182,
                          fit: BoxFit
                              .fill, // memastikan gambar pas dalam lingkaran tanpa distorsi
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                          errorBuilder: (BuildContext context, Object error,
                              StackTrace? stackTrace) {
                            // Menangani error, mengembalikan widget pengganti (misalnya ikon)
                            return const Center(
                              child: Icon(
                                Icons.broken_image_outlined,
                                color: ColorThemeStyle.grey100,
                                size: 80,
                              ),
                            );
                          },
                        ),
                      )
                    : const Center(
                        child: Icon(
                          Icons.broken_image_outlined,
                          color: ColorThemeStyle.grey100,
                          size: 80,
                        ),
                      )),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return const EditAccountPhotoOptionComponent();
                  },
                );
              },
              child: Container(
                height: 40,
                width: 40,
                margin: const EdgeInsets.only(bottom: 8, right: 8),
                decoration: const BoxDecoration(
                  color: ColorThemeStyle.blue100,
                  shape: BoxShape.circle,
                ),
                child: Center(
                    child: SvgPicture.asset(
                  Assets.assetsIconsCamera,
                  width: 20,
                  height: 20,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                )),
              ),
            )
          ],
        ),
      ],
    );
  }
}
