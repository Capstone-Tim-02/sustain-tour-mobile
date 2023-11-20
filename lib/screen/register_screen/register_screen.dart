import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/screen/login_screen/component/from_password_screns.dart';
import 'package:sustain_tour_mobile/screen/login_screen/component/from_username_screens.dart';
import 'package:sustain_tour_mobile/screen/register_screen/register_provider.dart';
import 'package:sustain_tour_mobile/screen/register_screen/register_sheet.dart';
import 'package:sustain_tour_mobile/screen/register_screen/validator/form_confirm_password_screens.dart';
import 'package:sustain_tour_mobile/screen/register_screen/validator/form_full_name_screens.dart';
import 'package:sustain_tour_mobile/screen/register_screen/validator/form_email_register_screens.dart';
import 'package:sustain_tour_mobile/screen/register_screen/validator/form_phone_screens.dart';
import 'package:sustain_tour_mobile/screen/register_screen/validator/form_username_register_screens.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
import 'package:sustain_tour_mobile/widget/button_widget.dart';
import 'package:sustain_tour_mobile/widget/text_field_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 64, right: 19, left: 19),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Daftar',
                style: TextStyleWidget.headlineH1(
                    fontWeight: FontWeightStyle.semiBold),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Daftar untuk Memulai Trip Kamu yang\nMenyenangkan',
                style:
                    TextStyleWidget.bodyB1(fontWeight: FontWeightStyle.light),
              ),
              const SizedBox(
                height: 32,
              ),
              TextFieldWidget(
                  labelText: 'Nama Lengkap',
                  hintText: 'Nama Lengkap',
                  errorText:
                      Provider.of<FormFullNameProvider>(context).fullNameError,
                  controller: Provider.of<FormFullNameProvider>(context)
                      .fullNameController,
                  prefixIcon: FractionallySizedBox(
                    widthFactor: 0.06,
                    child: SvgPicture.asset(
                      Assets.assetsIconsUsers,
                      fit: BoxFit.contain,
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget(
                  labelText: 'Username',
                  hintText: 'Username',
                  errorText: Provider.of<FromUsernameRegisterProvider>(context)
                      .usernameRegisterError,
                  controller: Provider.of<FromUsernameRegisterProvider>(context)
                      .usernameRegisterController,
                  prefixIcon: FractionallySizedBox(
                    widthFactor: 0.06,
                    child: SvgPicture.asset(
                      Assets.assetsIconsUsername,
                      fit: BoxFit.contain,
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget(
                  labelText: 'Nomor Handphone',
                  hintText: 'Nomor Handphone',
                  errorText: Provider.of<FromPhoneProvider>(context).phoneError,
                  controller:
                      Provider.of<FromPhoneProvider>(context).phoneController,
                  prefixIcon: FractionallySizedBox(
                    widthFactor: 0.06,
                    child: SvgPicture.asset(
                      Assets.assetsIconsPhone,
                      fit: BoxFit.contain,
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget(
                  labelText: 'Email',
                  hintText: 'Email',
                  errorText: Provider.of<FromEmailRegisterProvider>(context)
                      .emailRegisterError,
                  controller: Provider.of<FromEmailRegisterProvider>(context)
                      .emailRegisterController,
                  prefixIcon: FractionallySizedBox(
                    widthFactor: 0.06,
                    child: SvgPicture.asset(
                      Assets.assetsIconsEmail,
                      fit: BoxFit.contain,
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget(
                  controller: Provider.of<FormPasswordProvider>(context)
                      .passwordController,
                  labelText: 'Password',
                  hintText: 'Pasword',
                  // obscureText: !Provider.of<FormPasswordProvider>(context)
                  //     .isPasswordVisible,
                  errorText:
                      Provider.of<FormPasswordProvider>(context).passwordError,
                  suffixIcon: GestureDetector(
                    child: Icon(
                      Provider.of<FormPasswordProvider>(context)
                              .isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onTap: () {
                      Provider.of<FormPasswordProvider>(context, listen: false)
                          .togglePasswordVisibility();
                    },
                  ),
                  prefixIcon: FractionallySizedBox(
                    widthFactor: 0.05,
                    child: SvgPicture.asset(
                      Assets.assetsIconsLock,
                      fit: BoxFit.contain,
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget(
                  controller: Provider.of<FormConfirmPasswordProvider>(context)
                      .confirmPasswordController,
                  labelText: 'Konfirmasi Password',
                  hintText: 'Konfirmasi Password',
                  // obscureText: !Provider.of<FormPasswordProvider>(context)
                  //     .isPasswordVisible,
                  errorText: Provider.of<FormConfirmPasswordProvider>(context)
                      .confirmPasswordError,
                  suffixIcon: GestureDetector(
                    child: Icon(
                      Provider.of<FormConfirmPasswordProvider>(context)
                              .isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onTap: () {
                      Provider.of<FormConfirmPasswordProvider>(context,
                              listen: false)
                          .togglePasswordVisibility();
                    },
                  ),
                  prefixIcon: FractionallySizedBox(
                    widthFactor: 0.05,
                    child: SvgPicture.asset(
                      Assets.assetsIconsLock,
                      fit: BoxFit.contain,
                    ),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(),
                  Row(
                    children: [
                      const Text('Lupa Password?'),
                      TextButton(
                          onPressed: () {}, child: const Text('Atur Ulang'))
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),
              ButtonWidget.defaultContainer(
                  onPressed: () {
                    // Memanggil validasi password
                    Provider.of<FormFullNameProvider>(context, listen: false)
                        .validateFullName();
                    Provider.of<FromUsernameRegisterProvider>(context,
                            listen: false)
                        .validateUsernameRegister();
                    Provider.of<FromPhoneProvider>(context, listen: false)
                        .validatePhone();
                    Provider.of<FormPasswordProvider>(context, listen: false)
                        .validatePassword();
                    Provider.of<FromUsernameProvider>(context, listen: false)
                        .validateEmail();
                    String name = Provider.of<FormFullNameProvider>(context,
                            listen: false)
                        .fullNameController
                        .text;
                    String username = Provider.of<FromUsernameRegisterProvider>(
                            context,
                            listen: false)
                        .usernameRegisterController
                        .text;
                    String phone =
                        Provider.of<FromPhoneProvider>(context, listen: false)
                            .phoneController
                            .text;
                    String email = Provider.of<FromEmailRegisterProvider>(
                            context,
                            listen: false)
                        .emailRegisterController
                        .text;
                    String password = Provider.of<FormPasswordProvider>(context,
                            listen: false)
                        .passwordController
                        .text;
                    String confirmPassword =
                        Provider.of<FormConfirmPasswordProvider>(context,
                                listen: false)
                            .confirmPasswordController
                            .text;

                    if (username.isNotEmpty && password.isNotEmpty) {
                      RegisterProvider authProvider =
                          Provider.of<RegisterProvider>(context, listen: false);
                      authProvider
                          .registerUser(name, username, phone, email, password,
                              confirmPassword)
                          .then((signUp) {
                        if (signUp) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(authProvider.message),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(authProvider.message),
                            ),
                          ); // Handle login failure
                        }
                      });
                    }
                    showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        context: context,
                        builder: (context) => const RegisterSheet());
                  },
                  text: 'Daftar'),
              const SizedBox(
                height: 8,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('Atau')],
              ),
              const SizedBox(
                height: 8,
              ),
              ButtonWidget.defaultOutline(
                svgIcon: Assets.assetsIconsGoogle,
                text: 'Daftar dengan Google',
                onPressed: () {
                  showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      context: context,
                      builder: (context) => const RegisterSheet());
                  // LoginProvider yourProvider =
                  //     Provider.of<LoginProvider>(context, listen: false);
                  // // Panggil metode launchUrl
                  // yourProvider.loginDenganGogle();
                },
              ),
              const SizedBox(
                height: 32,
              ),
              const Text(
                'Dengan mendaftar untuk membuat akun, Kamu menyetujui Ketentuan Penggunaan dan Kebijakan Privasi',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 29,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          const Text('Sudah Punya Akun?'),
                          TextButton(
                            onPressed: () {},
                            child: const Text('Masuk'),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ]),
      ),
    ));
  }
}
