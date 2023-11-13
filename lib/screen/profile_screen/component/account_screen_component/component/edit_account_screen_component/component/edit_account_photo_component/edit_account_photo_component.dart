import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';

class EditAccountPhotoComponent extends StatelessWidget {
  final String imageUrl;
  final void Function()? onTapEditPhoto;
  const EditAccountPhotoComponent(
      {super.key, required this.imageUrl, this.onTapEditPhoto});

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
                  color: ColorThemeStyle.greyBaru,
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
                          errorBuilder: (BuildContext context, Object error,
                              StackTrace? stackTrace) {
                            // Menangani error, mengembalikan widget pengganti (misalnya ikon)
                            return const Center(
                              child: Icon(
                                Icons.image,
                                color: Colors.white,
                                size: 89,
                              ),
                            );
                          },
                        ),
                      )
                    : const Center(
                        child: Icon(
                          Icons.image,
                          color: Colors.white,
                          size: 89,
                        ),
                      )),
            GestureDetector(
              onTap: onTapEditPhoto,
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
