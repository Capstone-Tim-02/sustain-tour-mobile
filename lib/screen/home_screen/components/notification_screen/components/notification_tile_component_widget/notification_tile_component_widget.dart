import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationTileComponentWidget extends StatelessWidget {
  final void Function()? onTap;
  final String iconSvg;
  final String title;
  final DateTime createdAt;
  final String message;
  final Color? backgroundColor;
  final Color? titleColor;
  final Color? messageColor;
  final Color? timeColor;
  const NotificationTileComponentWidget(
      {super.key,
      this.onTap,
      required this.iconSvg,
      required this.title,
      required this.createdAt,
      required this.message,
      this.backgroundColor,
      this.titleColor,
      this.messageColor,
      this.timeColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        tileColor: backgroundColor ?? Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: SvgPicture.asset(
          iconSvg,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: TextStyleWidget.titleT3(
                  fontWeight: FontWeightStyle.medium,
                  color: titleColor ?? ColorThemeStyle.grey100,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                timeago.format(createdAt, locale: 'id'),
                overflow: TextOverflow.ellipsis,
                style: TextStyleWidget.labelL4(
                  fontWeight: FontWeightStyle.medium,
                  color: timeColor ?? ColorThemeStyle.grey100,
                ),
              ),
            ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            message,
            overflow: TextOverflow.ellipsis,
            style: TextStyleWidget.bodyB3(
              fontWeight: FontWeightStyle.medium,
              color: messageColor ?? ColorThemeStyle.grey100,
            ),
          ),
        ),
      ),
    );
  }
}
