import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';

class CorrectMessageWidget extends StatefulWidget {
  const CorrectMessageWidget(
    {
      Key? key});

  @override
  _CorrectMessageWidgetState createState() => _CorrectMessageWidgetState();
}

class _CorrectMessageWidgetState extends State<CorrectMessageWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        height: 30,
        width: 380,
        child: DecoratedBox(
          decoration: BoxDecoration(color: ColorThemeStyle.correctBar.withOpacity(0.22), borderRadius: const BorderRadius.all(Radius.circular(8))),
          child: const Row(children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.info,
              size: 16,
              color: ColorThemeStyle.correctMessage,),
            ),
            Text('Correct Message',
              style: TextStyle(
                color: ColorThemeStyle.correctMessage),
            )
        ],),
        ),
      )
    );
  }
}