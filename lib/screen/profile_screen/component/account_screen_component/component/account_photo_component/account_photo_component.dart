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
          decoration: BoxDecoration(
            color: ColorThemeStyle.lightPurple.withOpacity(0.54),
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
                ),
        ),
      ],
    );
  }
}
