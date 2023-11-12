import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/widget/text_field_widget.dart';

class AiScreen extends StatelessWidget {
  const AiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Virtual Assistant'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 71,
                    top: 192,
                    bottom: 16,
                  ),
                  child: Image.asset(
                    Assets.assetsImagesChatBot,
                    height: 186,
                    width: 232,
                  ),
                ),
                const Center(
                  child: Text('Haloo Aku DeBot'),
                ),
                const SizedBox(height: 8),
                const Center(
                  child: Text('Tanyakan pertanyaan, nanti aku jawab'),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 242),
              child: Row(
                children: [
                  SizedBox(
                    width: 300,
                    // child: TextFieldWidget(
                    //   labelText: '',
                    //   hintText: 'Apa yang ingin kamu tanyakan',
                    //   errorText: errorText,
                    // ),
                    // child: TextField(
                    //   decoration: InputDecoration(
                    //     hintText: 'Tulis pertanyaanmu...',
                    //     border: OutlineInputBorder(),
                    //   ),
                    // ),
                  ),
                  const SizedBox(width: 16),
                  Icon(Icons.abc, size: 60),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
