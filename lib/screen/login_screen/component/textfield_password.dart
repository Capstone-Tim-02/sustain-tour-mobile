import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/screen/login_screen/component/from_password_screns.dart';
import 'package:sustain_tour_mobile/widget/text_field_widget.dart';

class TextFieldPassword extends StatelessWidget {
  const TextFieldPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FormPasswordProvider>(
      builder: (context, formPasswordProvider, _) {
        return Column(
          children: [
            TextFieldWidget(
              controller: formPasswordProvider.passwordController,
              labelText: 'Password',
              hintText: 'Password',
              obscureText: !formPasswordProvider.isPasswordVisible,
              errorText: formPasswordProvider.passwordError,
              suffixIcon: GestureDetector(
                child: Icon(
                  formPasswordProvider.isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
                onTap: () {
                  formPasswordProvider.togglePasswordVisibility();
                },
              ),
              prefixIcon: FractionallySizedBox(
                widthFactor: 0.05,
                child: SvgPicture.asset(
                  Assets.assetsIconsLock,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Add more widgets or content as needed
          ],
        );
      },
    );
  }
}
