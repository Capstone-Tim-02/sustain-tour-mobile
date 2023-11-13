import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class ListTileWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String iconSvgString;
  final double? iconSize;
  final Widget? trailing;
  final void Function()? onTap;
  const ListTileWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconSvgString,
    this.onTap,
    this.iconSize,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: SvgPicture.asset(
          iconSvgString,
          width: iconSize ?? 34,
          height: iconSize ?? 34,
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
    );
  }
}
