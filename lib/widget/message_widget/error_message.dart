import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';

class ErrorMessageWidget extends StatefulWidget {
  const ErrorMessageWidget(
    {
      Key? key});

  @override
  _ErrorMessageWidgetState createState() => _ErrorMessageWidgetState();
}

class _ErrorMessageWidgetState extends State<ErrorMessageWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        height: 30,
        width: 380,
        child: DecoratedBox(
          decoration: BoxDecoration(color: ColorThemeStyle.errorBar.withOpacity(0.15), borderRadius: const BorderRadius.all(Radius.circular(8))),
          child: const Row(children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.info,
              size: 16,
              color: ColorThemeStyle.red,),
            ),
            Text('Error Message',
              style: TextStyle(
                color: ColorThemeStyle.red),
            )
        ],),
        ),
      )
    );
  }
}