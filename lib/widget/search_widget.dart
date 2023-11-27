import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget(
      {required this.label,
      required this.onSubmit,
      required this.controller,
      this.prefixIcon,
      this.style,
      this.suffixIcon,
      this.onTap,
      this.focusNode,
      Key? key})
      : super(key: key);

  final String label;
  final void Function(String) onSubmit;
  final TextEditingController? controller;
  final TextStyle? style;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final Function()? onTap;
  final FocusNode? focusNode;

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          TextFormField(
            textInputAction: TextInputAction.search,
            style: widget.style ?? Theme.of(context).textTheme.bodyLarge,
            onFieldSubmitted: widget.onSubmit,
            controller: widget.controller,
            cursorColor: ColorThemeStyle.blue100,
            focusNode: widget.focusNode,
            decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  borderSide:
                      BorderSide(color: ColorThemeStyle.grey100, width: 2),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  borderSide:
                      BorderSide(color: ColorThemeStyle.blue100, width: 2),
                ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  borderSide: BorderSide(color: ColorThemeStyle.red, width: 2),
                ),
                prefixIconColor:
                    MaterialStateColor.resolveWith((Set<MaterialState> states) {
                  if (states.contains(MaterialState.focused)) {
                    return ColorThemeStyle.blue100;
                  }
                  if (states.contains(MaterialState.error)) {
                    return ColorThemeStyle.red;
                  }
                  return ColorThemeStyle.grey100;
                }),
                suffixIconColor:
                    MaterialStateColor.resolveWith((Set<MaterialState> states) {
                  if (states.contains(MaterialState.focused)) {
                    return ColorThemeStyle.blue100;
                  }
                  if (states.contains(MaterialState.error)) {
                    return ColorThemeStyle.red;
                  }
                  return ColorThemeStyle.grey100;
                }),
                hintText: widget.label,
                prefixIcon: widget.prefixIcon ??
                    const Icon(
                      Icons.search,
                    ),
                suffixIcon: widget.suffixIcon),
            onTap: widget.onTap,
          )
        ],
      ),
    );
  }
}
