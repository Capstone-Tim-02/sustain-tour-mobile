import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';

class DisabledsMessageWidget extends StatefulWidget {
  const DisabledsMessageWidget(
    {
      Key? key});

  @override
  _DisabledsMessageWidgetState createState() => _DisabledsMessageWidgetState();
}

class _DisabledsMessageWidgetState extends State<DisabledsMessageWidget> {
  @override
  Widget build(BuildContext context) {
    return const Material(
      child: SizedBox(
        height: 30,
        width: 380,
        child: DecoratedBox(
          decoration: BoxDecoration(color: ColorThemeStyle.disabledsBar, borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Row(children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.info,
              size: 16,
              color: ColorThemeStyle.grey100,),
            ),
            Text('Disableds Message',
              style: TextStyle(
                color: ColorThemeStyle.grey100),
            )
        ],),
        ),
      )
    );
  }
}