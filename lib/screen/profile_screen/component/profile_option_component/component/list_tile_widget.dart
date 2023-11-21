import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class ListTileWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String iconSvgString;
  final BorderRadiusGeometry? borderRadius;
  final Color? iconColor;
  final double? iconSize;
  final Widget? trailing;
  final bool isUsingShadow;
  final bool isUsingBottomBorder;
  final void Function()? onTap;
  const ListTileWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconSvgString,
    this.onTap,
    this.iconSize,
    this.trailing,
    this.isUsingShadow = false,
    this.iconColor,
    this.borderRadius,
    this.isUsingBottomBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // margin: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            (isUsingShadow)
                ? BoxShadow(
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(0, 0),
                    spreadRadius: 0,
                  )
                : const BoxShadow()
          ],
          borderRadius: borderRadius,
          border: isUsingBottomBorder
              ? const Border(
                  bottom: BorderSide(
                    width: 2,
                    color: ColorThemeStyle.grey50,
                  ),
                )
              : null,
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.only(right: 10, left: 16),
          leading: SvgPicture.asset(
            iconSvgString,
            width: iconSize ?? 34,
            height: iconSize ?? 34,
            colorFilter: ColorFilter.mode(
                iconColor ?? ColorThemeStyle.blue100, BlendMode.srcIn),
          ),
          title: Padding(
            padding: const EdgeInsets.only(
              bottom: 8.0,
              top: 2.5,
            ),
            child: Text(
              title,
              style: TextStyleWidget.titleT3(
                fontWeight: FontWeightStyle.medium,
              ),
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(
              bottom: 2.5,
            ),
            child: Text(
              subtitle,
              style: TextStyleWidget.bodyB3(
                fontWeight: FontWeightStyle.medium,
                color: ColorThemeStyle.grey100,
              ),
            ),
          ),
          trailing: trailing,
        ),
      ),
    );
  }
}
