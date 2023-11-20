import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/screen/login_screen/login_provider.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/account_screen_component/component/edit_account_screen_component/component/edit_account_info_component/component/edit_text_field_component_widget/edit_text_field_component_widget.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/account_screen_component/component/edit_account_screen_component/edit_account_provider.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/profile_option_component/component/list_tile_widget.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/profile_provider.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
import 'package:sustain_tour_mobile/widget/badge_widget.dart';

class EditAccountInfoComponent extends StatelessWidget {
  final String? name;
  final String? username;
  final String? noHp;
  final String? email;
  const EditAccountInfoComponent(
      {super.key, this.name, this.username, this.noHp, this.email});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTileWidget(
          title: 'Nama',
          subtitle: name ?? '-',
          iconSvgString: Assets.assetsIconsName,
          iconSize: 30,
          isUsingBottomBorder: true,
          trailing: IconButton(
            icon: const Icon(
              Icons.mode_edit_outlined,
              color: ColorThemeStyle.blue100,
              size: 24,
            ),
            onPressed: () => _buildBottomSheet(context: context, label: 'Name'),
          ),
        ),
        ListTileWidget(
          title: 'Username',
          subtitle: username ?? '-',
          iconSvgString: Assets.assetsIconsUsername,
          iconSize: 30,
          isUsingBottomBorder: true,
          trailing: IconButton(
            icon: const Icon(
              Icons.mode_edit_outlined,
              color: ColorThemeStyle.blue100,
              size: 24,
            ),
            onPressed: () =>
                _buildBottomSheet(context: context, label: 'Username'),
          ),
        ),
        ListTileWidget(
          title: 'No Handphone',
          subtitle: noHp ?? '-',
          iconSvgString: Assets.assetsIconsPhone,
          iconSize: 30,
          isUsingBottomBorder: true,
          trailing: IconButton(
            icon: const Icon(
              Icons.mode_edit_outlined,
              color: ColorThemeStyle.blue100,
              size: 24,
            ),
            onPressed: () =>
                _buildBottomSheet(context: context, label: 'No Handphone'),
          ),
        ),
        ListTileWidget(
          title: 'Email',
          subtitle: email ?? '-',
          iconSvgString: Assets.assetsIconsEmail,
          iconSize: 30,
          isUsingBottomBorder: true,
          trailing: IconButton(
            icon: const Icon(
              Icons.mode_edit_outlined,
              color: ColorThemeStyle.blue100,
              size: 24,
            ),
            onPressed: () =>
                _buildBottomSheet(context: context, label: 'Email'),
          ),
        ),
        ListTileWidget(
          title: 'Password',
          subtitle: '***********',
          iconSvgString: Assets.assetsIconsKey,
          iconSize: 30,
          isUsingBottomBorder: true,
          trailing: IconButton(
            icon: const Icon(
              Icons.mode_edit_outlined,
              color: ColorThemeStyle.blue100,
              size: 24,
            ),
            onPressed: () => _buildBottomSheetPassword(context: context),
          ),
        ),
      ],
    );
  }

  void _buildBottomSheet({
    required BuildContext context,
    required String label,
  }) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        isScrollControlled: true,
        backgroundColor: Colors.white,
        context: context,
        builder: (context) {
          final editProvider =
              Provider.of<EditAccountProvider>(context, listen: false);
          editProvider.clearErrorText();
          switch (label) {
            case 'Name':
              editProvider.controller.text = name ?? '';
              editProvider.setName(name: name ?? '', listen: false);
              break;
            case 'Username':
              editProvider.controller.text = username ?? '';
              editProvider.setUsername(username: username ?? '', listen: false);
              break;
            case 'No Handphone':
              editProvider.controller.text = noHp ?? '';
              editProvider.setNoHandphone(noHp: noHp ?? '', listen: false);
              break;
            case 'Email':
              editProvider.controller.text = email ?? '';
              editProvider.setEmail(email: email ?? '', listen: false);
              break;
            default:
          }

          return Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Consumer<EditAccountProvider>(
                  builder: (context, editAccountProvider, child) {
                    return EditTextFieldComponentWidget(
                      controller: editAccountProvider.controller,
                      label: label,
                      errorText: editAccountProvider.errorText.isEmpty
                          ? null
                          : editAccountProvider.errorText,
                      onChanged: (value) {
                        switch (label) {
                          case 'Name':
                            editAccountProvider.setName(name: value);
                            editAccountProvider.errorTextName();
                            break;
                          case 'Username':
                            editAccountProvider.setUsername(username: value);
                            editAccountProvider.errorTextUsername();
                            break;
                          case 'No Handphone':
                            editAccountProvider.setNoHandphone(noHp: value);
                            editAccountProvider.errorTextNoHp();
                            break;
                          case 'Email':
                            editAccountProvider.setEmail(email: value);
                            editAccountProvider.errorTextEmail();
                            break;
                          default:
                        }
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BadgeWidget.container(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        label: 'Batal',
                        backgroundColor: Colors.red,
                        overlayColor: Colors.red,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 6),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ))),
                    const SizedBox(
                      width: 16,
                    ),
                    Consumer<EditAccountProvider>(
                        builder: (context, editProvider, child) {
                      bool isEnabled = true;
                      switch (label) {
                        case 'Name':
                          isEnabled = editProvider.errorText.isEmpty &&
                              editProvider.currentName.isNotEmpty;
                          break;
                        case 'Username':
                          isEnabled = editProvider.errorText.isEmpty &&
                              editProvider.currentUsername.isNotEmpty;
                          break;
                        case 'No Handphone':
                          isEnabled = editProvider.errorText.isEmpty &&
                              editProvider.currentNoHp.isNotEmpty;
                          break;
                        case 'Email':
                          isEnabled = editProvider.errorText.isEmpty &&
                              editProvider.currentEmail.isNotEmpty;
                          break;
                        default:
                      }
                      return BadgeWidget.container(
                          onPressed: isEnabled
                              ? () async {
                                  final loginProvider =
                                      Provider.of<LoginProvider>(
                                    context,
                                    listen: false,
                                  );

                                  final profileProvider =
                                      Provider.of<ProfileProvider>(
                                    context,
                                    listen: false,
                                  );

                                  String token = loginProvider.token ?? '';
                                  int userId = loginProvider.userId ?? -1;

                                  switch (label) {
                                    case 'Name':
                                      String value = editProvider.currentName;
                                      await profileProvider.updateName(
                                        userId: userId,
                                        token: token,
                                        newName: value,
                                      );
                                      break;
                                    case 'Username':
                                      String value =
                                          editProvider.currentUsername;
                                      await profileProvider.updateUsername(
                                        userId: userId,
                                        token: token,
                                        newUsername: value,
                                      );
                                      break;
                                    case 'No Handphone':
                                      String value = editProvider.currentNoHp;
                                      await profileProvider.updateNoHandphone(
                                        userId: userId,
                                        token: token,
                                        newNoHp: value,
                                      );
                                      break;
                                    case 'Email':
                                      String value = editProvider.currentEmail;
                                      await profileProvider.updateEmail(
                                        userId: userId,
                                        token: token,
                                        newEmail: value,
                                      );
                                      break;
                                    default:
                                  }

                                  if (!context.mounted) return;

                                  Provider.of<LoginProvider>(context,
                                          listen: false)
                                      .loadData();

                                  Navigator.pop(context);

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          content: Text(
                                    profileProvider.message,
                                  )));

                                  profileProvider.clearMessage();
                                }
                              : null,
                          label: 'Simpan',
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 6),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          )));
                    }),
                  ],
                ),
              ],
            ),
          );
        });
  }

  void _buildBottomSheetPassword({
    required BuildContext context,
  }) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        isScrollControlled: true,
        backgroundColor: Colors.white,
        context: context,
        builder: (context) {
          final editProvider =
              Provider.of<EditAccountProvider>(context, listen: false);
          editProvider.setCurrentPassword(
              currentPasswordVal: '', listen: false);
          editProvider.setNewPassword(newPasswordVal: '', listen: false);
          editProvider.clearErrorTextCurrentPassword();
          editProvider.clearErrorTextNewPassword();

          return Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Consumer<EditAccountProvider>(
                  builder: (context, editAccountProvider, child) {
                    return EditTextFieldComponentWidget(
                      label: 'Current Password',
                      errorText:
                          editAccountProvider.errorTextCurrentPassword.isEmpty
                              ? null
                              : editAccountProvider.errorTextCurrentPassword,
                      onChanged: (value) {
                        editAccountProvider.setCurrentPassword(
                          currentPasswordVal: value,
                        );
                        editAccountProvider.errorTextCurrentPasswordSetter();
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Consumer<EditAccountProvider>(
                  builder: (context, editAccountProvider, child) {
                    return EditTextFieldComponentWidget(
                      label: 'New Password',
                      errorText:
                          editAccountProvider.errorTextNewPassword.isEmpty
                              ? null
                              : editAccountProvider.errorTextNewPassword,
                      onChanged: (value) {
                        editAccountProvider.setNewPassword(
                          newPasswordVal: value,
                        );
                        editAccountProvider.errorTextNewPasswordSetter();
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Batal',
                        style: TextStyleWidget.titleT3(
                          color: Colors.black,
                          fontWeight: FontWeightStyle.semiBold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 54,
                    ),
                    Consumer<EditAccountProvider>(
                        builder: (context, editProvider, child) {
                      bool isEnabled =
                          editProvider.errorTextCurrentPassword.isEmpty &&
                              editProvider.errorTextNewPassword.isEmpty &&
                              editProvider.currentPassword.isNotEmpty &&
                              editProvider.newPassword.isNotEmpty;
                      return GestureDetector(
                        onTap: isEnabled
                            ? () async {
                                final loginProvider =
                                    Provider.of<LoginProvider>(
                                  context,
                                  listen: false,
                                );

                                final profileProvider =
                                    Provider.of<ProfileProvider>(
                                  context,
                                  listen: false,
                                );

                                String token = loginProvider.token ?? '';
                                int userId = loginProvider.userId ?? -1;

                                await profileProvider.updatePassword(
                                  userId: userId,
                                  token: token,
                                  currentPassword: editProvider.currentPassword,
                                  newPassword: editProvider.newPassword,
                                );

                                if (!context.mounted) return;

                                Navigator.pop(context);

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                        content: Text(
                                  profileProvider.message,
                                )));

                                profileProvider.clearMessage();
                              }
                            : null,
                        child: Text(
                          'Simpan',
                          style: TextStyleWidget.titleT3(
                            color: isEnabled ? Colors.black : Colors.grey,
                            fontWeight: FontWeightStyle.semiBold,
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
