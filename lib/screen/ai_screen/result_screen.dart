import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/models/ai_models/ai_models.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/profile_provider.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class ResultScreen extends StatelessWidget {
  final AiModels gptResponseData;
  final String question;

  const ResultScreen(
      {super.key, required this.gptResponseData, required this.question});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Virtual Assistant',
          style: TextStyleWidget.titleT2(
            fontWeight: FontWeightStyle.semiBold,
          ),
        ),
        leading: const SizedBox(),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.white,
            child: ListTile(
              leading: Consumer<ProfileProvider>(
                builder: (context, profileProvider, child) {
                  if (!profileProvider.isLoading) {
                    return Container(
                      width: 48,
                      height: 48,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorThemeStyle.grey50,
                      ),
                      child: ClipOval(
                        child: Image.network(
                          fit: BoxFit.cover,
                          profileProvider.user.photoProfil,
                          errorBuilder: (BuildContext context, Object error,
                              StackTrace? stackTrace) {
                            // Menangani error, mengembalikan widget pengganti (misalnya ikon)
                            return const Center(
                              child: Icon(Icons.image),
                              // Image.asset(Assets.assetsKepalaChatBot),
                            );
                          },
                        ),
                      ),
                    );
                  } else {
                    return const Icon(Icons.image);
                  }
                },
              ),
              title: Text(
                question,
                textAlign: TextAlign.left,
                style: TextStyleWidget.bodyB3(
                  fontWeight: FontWeightStyle.regular,
                  color: ColorThemeStyle.black100,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            color: ColorThemeStyle.blue20,
            child: ListTile(
              leading: Container(
                width: 48,
                height: 48,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorThemeStyle.white100,
                ),
                child: Image.asset(
                  Assets.assetsImagesKepalaChatBot,
                ),
              ),
              title: Text(
                gptResponseData.data.toString(),
                textAlign: TextAlign.left,
                style: TextStyleWidget.bodyB3(
                  fontWeight: FontWeightStyle.regular,
                  color: ColorThemeStyle.black100,
                ),
              ),
              isThreeLine: true,
              subtitle: const Text(''),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 30,
            ),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorThemeStyle.blue100,
                fixedSize: const Size.fromHeight(60),
              ),
              child: Text(
                'Oke',
                style: TextStyleWidget.titleT2(
                  fontWeight: FontWeightStyle.semiBold,
                  color: ColorThemeStyle.white100,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
