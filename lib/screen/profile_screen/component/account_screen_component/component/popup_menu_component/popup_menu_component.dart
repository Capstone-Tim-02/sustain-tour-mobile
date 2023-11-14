import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/constants/routes.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class PopupMenuComponent extends StatelessWidget {
  const PopupMenuComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      offset: const Offset(
        0,
        30,
      ),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
              value: 'edit',
              child: Text(
                'Edit Profile',
                style: TextStyleWidget.bodyB3(
                  fontWeight: FontWeightStyle.medium,
                ),
              )),
        ];
      },
      onSelected: (value) {
        if (value == 'edit') {
          Navigator.pushNamed(context, Routes.editAccountScreen);
        }
      },
      child: const Padding(
        padding: EdgeInsets.only(right: 12.0),
        child: Icon(
          Icons.more_vert,
        ),
      ),
    );
  }
}
