import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/screen/ai_screen/result_screen.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/screen/ai_screen/ai_screen_provider.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
import 'package:sustain_tour_mobile/widget/button_widget.dart';
import 'package:sustain_tour_mobile/widget/text_field_widget.dart';

class AiScreen extends StatelessWidget {
  const AiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final aiProvider = context.read<AiScreenProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Virtual Assistant',
          style: TextStyleWidget.titleT2(
            fontWeight: FontWeightStyle.semiBold,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 71,
                  bottom: 16,
                ),
                child: Image.asset(
                  Assets.assetsImagesChatBot,
                  height: 186,
                  width: 232,
                ),
              ),
              Center(
                child: Text(
                  'Haloo Aku DeBot',
                  style: TextStyleWidget.titleT2(
                    fontWeight: FontWeightStyle.semiBold,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 72,
                    right: 72,
                    top: 8,
                  ),
                  child: Text(
                    'Virtual Asistent ini hanya menjawab mengenai pertanyaan terkait destinasi wisata',
                    textAlign: TextAlign.center,
                    style: TextStyleWidget.bodyB3(
                      fontWeight: FontWeightStyle.medium,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 300,
                      height: 62,
                      child: TextFieldWidget(
                        controller: aiProvider.messageController,
                        hintText: 'Apa yang ingin kamu tanyakan',
                        fillColor: ColorThemeStyle.grey50,
                        filled: true,
                        textCapitalization: TextCapitalization.sentences,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Consumer<AiScreenProvider>(
                      builder: (context, aiProvider, child) {
                        if (aiProvider.isLoadingAnswer) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          return SizedBox(
                            width: 64,
                            height: 60,
                            child: ButtonWidget.iconContainer(
                              onPressed: () {
                                aiProvider.getRecommendation().then(
                                  (_) {
                                    final aiResponseData =
                                        aiProvider.openAiAnswer;

                                    // aiProvider.resetFields(
                                    //     aiProvider.messageController);
                                    if (aiResponseData != null) {
                                      // aiProvider.resetFields(
                                      //     aiProvider.messageController);
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return ResultScreen(
                                              gptResponseData: aiResponseData,
                                              question: aiProvider
                                                  .messageController.text,
                                            );
                                          },
                                        ),
                                      );
                                    } else {
                                      const snackBar = SnackBar(
                                        content: Text(
                                          'perompak somalia sedang meretas device anda',
                                        ),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    }
                                  },
                                );
                              },
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
