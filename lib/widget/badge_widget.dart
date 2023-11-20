import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class BadgeWidget {
  static SizedBox container(
      {required void Function()? onPressed, String? label}) {
    return SizedBox(
      // width: 86,
      height: 40,
      child: ElevatedButton(
        style: ButtonStyle(
          // atur background
          backgroundColor: onPressed == null
              ? null
              : MaterialStateProperty.all(ColorThemeStyle.blue100),

          // atur background saat di press
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return ColorThemeStyle.blue60; //<-- SEE HERE
              }
              return null; // Defer to the widget's default.
            },
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label ?? 'Label',
          style: TextStyleWidget.titleT3(
            fontWeight: FontWeightStyle.medium,
            color: onPressed == null
                ? ColorThemeStyle.grey100
                : ColorThemeStyle.white100,
          ),
        ),
      ),
    );
  }

  static SizedBox outline(
      {required void Function()? onPressed, String? label}) {
    return SizedBox(
      // width: 86,
      height: 40,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),

          // buat atur warna label nya
          foregroundColor: onPressed == null
              ? MaterialStateProperty.all(
                  ColorThemeStyle.grey100) // warna label saat disable
              : MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      // Warna teks saat tombol ditekan
                      return ColorThemeStyle.white100;
                    }
                    // Warna teks dalam keadaan normal
                    return ColorThemeStyle.blue100;
                  },
                ),

          // buat atur warna border
          side: onPressed == null
              ? MaterialStateProperty.all(const BorderSide(
                  color: ColorThemeStyle.grey100,
                  width: 2)) // warna border saat disable
              : MaterialStateProperty.all(const BorderSide(
                  color: ColorThemeStyle.blue100,
                  width: 2)), // warna border saat enable

          // atur background
          backgroundColor:
              MaterialStateProperty.all(Colors.transparent), // ngikutin figma

          // atur warna button saat ditekan
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return ColorThemeStyle.blue40; //<-- SEE HERE
              }
              return null; // Defer to the widget's default.
            },
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label ?? 'Label',
          style: TextStyleWidget.titleT3(
            fontWeight: FontWeightStyle.medium,
          ),
        ),
      ),
    );
  }

  static SizedBox texted({required void Function()? onPressed, String? label}) {
    return SizedBox(
      // width: 86,
      height: 40,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          // buat atur warna label nya
          foregroundColor: onPressed == null
              ? MaterialStateProperty.all(
                  ColorThemeStyle.grey100) // warna teks saat disable
              : MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      // Warna teks saat tombol ditekan
                      return ColorThemeStyle.white100;
                    }
                    // Warna teks dalam keadaan normal
                    return ColorThemeStyle.blue100;
                  },
                ),

          // atur background
          backgroundColor: MaterialStateProperty.all(Colors.transparent),

          // atur warna background saat ditekan
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return ColorThemeStyle.blue40; //<-- SEE HERE
              }
              return null; // Defer to the widget's default.
            },
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label ?? 'Label',
          style: TextStyleWidget.titleT3(
            fontWeight: FontWeightStyle.medium,
          ),
        ),
      ),
    );
  }

  static SizedBox containerWithIcon(
      {required void Function()? onPressed,
      required String? label,
      Icon? icon}) {
    return SizedBox(
      // width: 86,
      height: 40,
      child: ElevatedButton.icon(
        icon: icon ?? const Icon(Icons.add),
        
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(
              horizontal: 24,
            ),
          ),
          iconColor: onPressed == null
              ? MaterialStateProperty.all(ColorThemeStyle.grey100)
              : MaterialStateProperty.all(Colors.white),
          backgroundColor: onPressed == null
              ? null
              : MaterialStateProperty.all(ColorThemeStyle.blue100),
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return ColorThemeStyle.blue60; //<-- SEE HERE
              }
              return null; // Defer to the widget's default.
            },
          ),
        ),
        onPressed: onPressed,
        label: Text(
          label ?? 'Label',
          style: TextStyleWidget.titleT3(
            fontWeight: FontWeightStyle.medium,
            color: onPressed == null
                ? ColorThemeStyle.grey100
                : ColorThemeStyle.white100,
          ),
        ),
      ),
    );
  }

  static SizedBox outlineWithIcon(
      {required void Function()? onPressed, String? label, Icon? icon}) {
    return SizedBox(
      // width: 86,
      height: 40,
      child: ElevatedButton.icon(
        icon: icon ?? const Icon(Icons.add),
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),

          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(
              horizontal: 24,
            ),
          ),

          // buat atur warna label nya
          foregroundColor: onPressed == null
              ? MaterialStateProperty.all(
                  ColorThemeStyle.grey100) // warna label saat disable
              : MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      // Warna teks saat tombol ditekan
                      return ColorThemeStyle.white100;
                    }
                    // Warna teks dalam keadaan normal
                    return ColorThemeStyle.blue100;
                  },
                ),

          // buat atur warna border
          side: onPressed == null
              ? MaterialStateProperty.all(const BorderSide(
                  color: ColorThemeStyle.grey100,
                  width: 2)) // warna border saat disable
              : MaterialStateProperty.all(const BorderSide(
                  color: ColorThemeStyle.blue100,
                  width: 2)), // warna border saat enable

          // atur background
          backgroundColor:
              MaterialStateProperty.all(Colors.transparent), // ngikutin figma

          // atur warna button saat ditekan
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return ColorThemeStyle.blue40; //<-- SEE HERE
              }
              return null; // Defer to the widget's default.
            },
          ),
        ),
        onPressed: onPressed,
        label: Text(
          label ?? 'Label',
          style: TextStyleWidget.titleT3(
            fontWeight: FontWeightStyle.medium,
          ),
        ),
      ),
    );
  }

  static SizedBox textedWithIcon(
      {required void Function()? onPressed, String? label, Icon? icon}) {
    return SizedBox(
      // width: 86,
      height: 40,
      child: ElevatedButton.icon(
        icon: icon ?? const Icon(Icons.add),
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),

          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(
              horizontal: 24,
            ),
          ),

          // buat atur warna label nya
          foregroundColor: onPressed == null
              ? MaterialStateProperty.all(
                  ColorThemeStyle.grey100) // warna teks saat disable
              : MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      // Warna teks saat tombol ditekan
                      return ColorThemeStyle.white100;
                    }
                    // Warna teks dalam keadaan normal
                    return ColorThemeStyle.blue100;
                  },
                ),

          // atur background
          backgroundColor: MaterialStateProperty.all(Colors.transparent),

          // atur warna background saat ditekan
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return ColorThemeStyle.blue40; //<-- SEE HERE
              }
              return null; // Defer to the widget's default.
            },
          ),
        ),
        onPressed: onPressed,
        label: Text(
          label ?? 'Label',
          style: TextStyleWidget.titleT3(
            fontWeight: FontWeightStyle.medium,
          ),
        ),
      ),
    );
  }
}
