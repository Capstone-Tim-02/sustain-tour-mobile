import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/profile_provider.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class ProfileTileComponent extends StatelessWidget {
  final String? urlPicture;
  const ProfileTileComponent({super.key, this.urlPicture});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child:
          Consumer<ProfileProvider>(builder: (context, profileProvider, child) {
        if (profileProvider.isLoading == false) {
          return Row(
            children: [
              Container(
                width: 84,
                height: 84,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorThemeStyle.greyBaru,
                ),
                child: profileProvider.user.photoProfil.isNotEmpty
                    ? ClipOval(
                        child: Image.network(
                          profileProvider.user.photoProfil,
                          width: 84,
                          height: 84,
                          fit: BoxFit
                              .cover, // memastikan gambar pas dalam lingkaran tanpa distorsi
                          errorBuilder: (BuildContext context, Object error,
                              StackTrace? stackTrace) {
                            // Menangani error, mengembalikan widget pengganti (misalnya ikon)
                            return const Center(
                              child: Icon(
                                Icons.image,
                                color: Colors.white,
                                size: 50,
                              ),
                            );
                          },
                        ),
                      )
                    : const Center(
                        child: Icon(
                          Icons.image,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
              ),
              const SizedBox(
                width: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      profileProvider.user.name,
                      style: TextStyleWidget.titleT2(
                        fontWeight: FontWeightStyle.semiBold,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      profileProvider.user.username,
                      style: TextStyleWidget.titleT3(
                        color: ColorThemeStyle.grey100,
                        fontWeight: FontWeightStyle.medium,
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        } else {
          return Row(
            children: [
              Container(
                width: 84,
                height: 84,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorThemeStyle.grey80,
                ),
                child: ClipOval(
                  child: Image.network(
                    '',
                    width: 84,
                    height: 84,
                    fit: BoxFit
                        .cover, // memastikan gambar pas dalam lingkaran tanpa distorsi
                    errorBuilder: (BuildContext context, Object error,
                        StackTrace? stackTrace) {
                      // Menangani error, mengembalikan widget pengganti (misalnya ikon)
                      return const Center(
                        child: Icon(
                          Icons.image,
                          color: Colors.white,
                          size: 50,
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '-',
                      style: TextStyleWidget.titleT2(
                        fontWeight: FontWeightStyle.semiBold,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      '-',
                      style: TextStyleWidget.titleT3(
                        color: ColorThemeStyle.grey100,
                        fontWeight: FontWeightStyle.medium,
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        }
      }),
    );
  }
}
