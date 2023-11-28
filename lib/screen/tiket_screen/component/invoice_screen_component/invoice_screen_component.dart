import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/models/booking_history_model/booking_history_model.dart';
import 'package:sustain_tour_mobile/screen/tiket_screen/component/invoice_screen_component/component/invoice_container_component/invoice_container_component.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class InvoiceScreenComponent extends StatelessWidget {
  const InvoiceScreenComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final TicketData tiketData =
        ModalRoute.of(context)!.settings.arguments as TicketData;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorThemeStyle.blue100,
        title: Text(
          'Invoice',
          style: TextStyleWidget.titleT2(
            color: Colors.white,
            fontWeight: FontWeightStyle.semiBold,
          ),
        ),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: ListView(
        children: [
          InvoiceContainerComponent(tiket: tiketData),
        ],
      ),
      backgroundColor: ColorThemeStyle.blue100,
    );
  }
}
