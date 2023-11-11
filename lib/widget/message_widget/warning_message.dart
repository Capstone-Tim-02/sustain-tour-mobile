import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';

class WarningMessageWidget extends StatefulWidget {
  const WarningMessageWidget(
    {
      Key? key});

  @override
  _WarningMessageWidgetState createState() => _WarningMessageWidgetState();
}

class _WarningMessageWidgetState extends State<WarningMessageWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        height: 30,
        width: 380,
        child: DecoratedBox(
          decoration: BoxDecoration(color: ColorThemeStyle.warningBar.withOpacity(0.16), borderRadius: const BorderRadius.all(Radius.circular(8))),
          child: const Row(children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.info,
              size: 16,
              color: ColorThemeStyle.warning,),
            ),
            Text('Warning Message',
              style: TextStyle(
                color: ColorThemeStyle.warning),
            )
        ],),
        ),
      )
    );
  }
}