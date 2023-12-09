import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/checkout_provider.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
import 'package:sustain_tour_mobile/widget/snack_bar_widget.dart';

class UsePromoTextfieldComponent extends StatelessWidget {
  const UsePromoTextfieldComponent({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutProvider checkoutProvider = Provider.of<CheckoutProvider>(context, listen: false);
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 44,
            child: TextFormField(
              controller: checkoutProvider.usePromoController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                filled: true,
                fillColor: ColorThemeStyle.grey50,
                hintText: "Tempel kode disini",
                hintStyle: TextStyleWidget.bodyB3(
                  color: ColorThemeStyle.black100,
                  fontWeight: FontWeight.w500
                ),
                border:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: ColorThemeStyle.blue100
                  )
                )
              ),
            ),
          ),
        ),
        const SizedBox(width: 17),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            backgroundColor: ColorThemeStyle.blue100
          ),
          onPressed: (){
            checkoutProvider.onUsePromo(checkoutProvider.usePromoController.text);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBarWidget.snackBarWidget(
                message: checkoutProvider.message,
                duration: const Duration(seconds: 2),
                backgroundColor: checkoutProvider.isPromoUsed ? ColorThemeStyle.green100 : ColorThemeStyle.red
              )
            );
          },
          child: Text(
            "Pakai",
            style: TextStyleWidget.titleT2(
              color: ColorThemeStyle.white100,
              fontWeight: FontWeight.w500
            ),
          )
        )
      ],
    );
  }
}