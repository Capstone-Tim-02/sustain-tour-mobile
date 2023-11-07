import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/widget/text_field_widget.dart';

class CobaWidgetScreen extends StatefulWidget {
  CobaWidgetScreen({super.key});

  @override
  State<CobaWidgetScreen> createState() => _CobaWidgetScreenState();
}

class _CobaWidgetScreenState extends State<CobaWidgetScreen> {
  final TextEditingController emailController = TextEditingController();
  String? errorText; // Menambahkan variabel untuk menangani errorText

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen Coba'),
        centerTitle: true,
        backgroundColor: ColorThemeStyle.grey50,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
              child: TextFieldWidget(
                controller: emailController,
                labelText: 'Email',
                hintText: 'Insert your email',
                prefixIcon: const Icon(Icons.email_outlined),
                errorText: errorText,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (emailController.text.isEmpty) {
                  // Menampilkan pesan kesalahan jika email kosong
                  emailController.clear(); // Menghapus teks dalam TextField
                  setState(() {
                    errorText = 'Data tidak boleh kosong'; // Mengatur errorText
                  });
                } else {
                  // Menghapus pesan kesalahan jika email tidak kosong
                  setState(() {
                    errorText = null;
                  });
                  // Lakukan tindakan login atau yang sesuai jika email tidak kosong
                }
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
