import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../style/color_theme_style.dart';
import '../style/font_weight_style.dart';
import '../style/text_style_widget.dart';

class ButtonWidget {
  static Widget defaultContainer({
    required String? text,
    required Function()? onPressed,
  }) {
    return SizedBox(
      height: 60,
      width: 380,
      child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            backgroundColor: onPressed == null
                ? null
                : MaterialStateProperty.all(ColorThemeStyle.blue100),
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return ColorThemeStyle.blue60;
                }
                return null;
              },
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text ?? 'Button',
            style: TextStyleWidget.bodyB1(
              fontWeight: FontWeightStyle.semiBold,
              color: onPressed == null
                  ? ColorThemeStyle.grey100
                  : ColorThemeStyle.white100,
            ),
          )),
    );
  }

  static Widget defaultOutline({
    required String? text,
    required Function()? onPressed,
    final String? svgIcon,
  }) {
    return SizedBox(
      height: 60,
      width: 380,
      child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              foregroundColor: onPressed == null
                  ? MaterialStateProperty.all(ColorThemeStyle.grey100)
                  : MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return ColorThemeStyle.white100;
                        }

                        return ColorThemeStyle.blue100;
                      },
                    ),
              side: onPressed == null
                  ? MaterialStateProperty.all(const BorderSide(
                      color: ColorThemeStyle.grey100, width: 2))
                  : MaterialStateProperty.all(const BorderSide(
                      color: ColorThemeStyle.blue100, width: 2)),
              backgroundColor:
                  MaterialStateProperty.all(ColorThemeStyle.white100),
              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return ColorThemeStyle.blue40;
                  }
                  return null;
                },
              )),
          onPressed: onPressed,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(svgIcon.toString()),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  text ?? 'Button',
                  style: TextStyleWidget.bodyB1(
                    fontWeight: FontWeightStyle.semiBold,
                  ),
                ),
              ],
            ),
          )),
    );
  }

  static Widget smallContainer({
    required String? text,
    required Function()? onPressed,
  }) {
    return SizedBox(
      height: 60,
      width: 182,
      child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            backgroundColor: onPressed == null
                ? null
                : MaterialStateProperty.all(ColorThemeStyle.blue100),
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return ColorThemeStyle.blue60;
                }
                return null;
              },
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text ?? 'Button',
            style: TextStyleWidget.titleT2(
              fontWeight: FontWeightStyle.semiBold,
              color: onPressed == null
                  ? ColorThemeStyle.grey100
                  : ColorThemeStyle.white100,
            ),
          )),
    );
  }

  static Widget smallOutline({
    required String? text,
    required Function()? onPressed,
  }) {
    return SizedBox(
      height: 60,
      width: 182,
      child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              foregroundColor: onPressed == null
                  ? MaterialStateProperty.all(ColorThemeStyle.grey100)
                  : MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return ColorThemeStyle.white100;
                        }
                        return ColorThemeStyle.blue100;
                      },
                    ),
              side: onPressed == null
                  ? MaterialStateProperty.all(const BorderSide(
                      color: ColorThemeStyle.grey100, width: 2))
                  : MaterialStateProperty.all(const BorderSide(
                      color: ColorThemeStyle.blue100, width: 2)),
              backgroundColor:
                  MaterialStateProperty.all(ColorThemeStyle.white100),
              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return ColorThemeStyle.blue40;
                  }
                  return null;
                },
              )),
          onPressed: onPressed,
          child: Text(
            text ?? 'Button',
            style: TextStyleWidget.titleT2(
              fontWeight: FontWeightStyle.semiBold,
            ),
          )),
    );
  }

  static Widget iconContainer({
    required Function()? onPressed,
  }) {
    return SizedBox(
      height: 60,
      width: 83,
      child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            backgroundColor: onPressed == null
                ? null
                : MaterialStateProperty.all(ColorThemeStyle.blue100),
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return ColorThemeStyle.blue60;
                }
                return null;
              },
            ),
          ),
          onPressed: onPressed,
          child: Icon(
            Icons.send_sharp,
            color: onPressed == null
                ? ColorThemeStyle.grey100
                : ColorThemeStyle.white100,
          )),
    );
  }

  static Widget iconOutline({
    required Function()? onPressed,
  }) {
    return SizedBox(
      height: 60,
      width: 83,
      child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              foregroundColor: onPressed == null
                  ? MaterialStateProperty.all(ColorThemeStyle.grey100)
                  : MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return ColorThemeStyle.white100;
                        }

                        return ColorThemeStyle.blue100;
                      },
                    ),
              side: onPressed == null
                  ? MaterialStateProperty.all(const BorderSide(
                      color: ColorThemeStyle.grey100, width: 2))
                  : MaterialStateProperty.all(const BorderSide(
                      color: ColorThemeStyle.blue100, width: 2)),
              backgroundColor:
                  MaterialStateProperty.all(ColorThemeStyle.white100),
              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return ColorThemeStyle.blue40;
                  }
                  return null;
                },
              )),
          onPressed: onPressed,
          child: Icon(
            Icons.send_sharp,
            color: onPressed == null
                ? ColorThemeStyle.grey100
                : ColorThemeStyle.blue100,
          )),
    );
  }
}
