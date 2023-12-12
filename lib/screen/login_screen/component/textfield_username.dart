import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/screen/login_screen/component/from_username_screens.dart';
import 'package:sustain_tour_mobile/widget/text_field_widget.dart';

class TextFieldUsername extends StatelessWidget {
  const TextFieldUsername({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FromUsernameProvider>(
      builder: (context, fromUsernameProvider, _) {
        return Column(
          children: [
            TextFieldWidget(
              textCapitalization: TextCapitalization.none,
              labelText: 'Username',
              hintText: 'Username',
              errorText: fromUsernameProvider.emailError,
              controller: fromUsernameProvider.emailController,
              prefixIcon: FractionallySizedBox(
                widthFactor: 0.06,
                child: SvgPicture.asset(
                  Assets.assetsIconsUsername,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        );
      },
    );
  }
}
