import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';

class AccountPhotoComponent extends StatelessWidget {
  final String imageUrl;
  const AccountPhotoComponent({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
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
                ),
        ),
      ],
    );
  }
}
