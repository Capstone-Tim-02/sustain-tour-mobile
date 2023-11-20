import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/constants/routes.dart';
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
          return Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(0, 0),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 8,
                ),
                Container(
                  width: 60,
                  height: 60,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorThemeStyle.grey50,
                  ),
                  child: profileProvider.user.photoProfil.isNotEmpty
                      ? ClipOval(
                          child: Image.network(
                            profileProvider.user.photoProfil,
                            width: 60,
                            height: 60,
                            fit: BoxFit
                                .cover, // memastikan gambar pas dalam lingkaran tanpa distorsi
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return const Center(
                                child: SizedBox(
                                    width: 15,
                                    height: 15,
                                    child: CircularProgressIndicator()),
                              );
                            },
                            errorBuilder: (BuildContext context, Object error,
                                StackTrace? stackTrace) {
                              // Menangani error, mengembalikan widget pengganti (misalnya ikon)
                              return const Center(
                                child: Icon(
                                  Icons.broken_image_outlined,
                                  color: ColorThemeStyle.grey100,
                                  size: 30,
                                ),
                              );
                            },
                          ),
                        )
                      : const Center(
                          child: Icon(
                            Icons.broken_image_outlined,
                            color: ColorThemeStyle.grey100,
                            size: 30,
                          ),
                        ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
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
                    GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, Routes.accountScreen),
                      child: Text(
                        'Profile Selengkapnya',
                        style: TextStyleWidget.titleT3(
                          color: ColorThemeStyle.blue80,
                          fontWeight: FontWeightStyle.medium,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        } else {
          return Row(
            children: [
              const SizedBox(
                width: 8,
              ),
              Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorThemeStyle.grey50,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.broken_image_outlined,
                      color: ColorThemeStyle.grey100,
                      size: 30,
                    ),
                  )),
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
