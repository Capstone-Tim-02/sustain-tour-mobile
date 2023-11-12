import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget(
    {
      required this.label,
      required this.onSubmit,
      required this.controller,
      Key? key})
      : super(key: key);

      final String label;
      final void Function(String) onSubmit;
      final TextEditingController? controller;

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(children: [
        TextFormField(
          textInputAction: TextInputAction.search,
          style: Theme.of(context).textTheme.bodyText1,
          onFieldSubmitted: widget.onSubmit,
          controller: widget.controller,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(40.0)),
              borderSide: BorderSide(color: ColorThemeStyle.grey100),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(40.0)),
              borderSide: BorderSide(color: ColorThemeStyle.blue100),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(40.0)),
              borderSide: BorderSide(color: ColorThemeStyle.red),
            ),
            prefixIconColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.focused)) {
                return ColorThemeStyle.blue100;
              }
              if (states.contains(MaterialState.error)) {
                return ColorThemeStyle.red;
              }
                return ColorThemeStyle.grey100;
            }),
            hintText: widget.label,
            prefixIcon: const Icon(
              Icons.search,
            ),
            suffixIcon: const Icon(
              Icons.clear
            ),
          ),
        )
      ],),
    );
  }
}