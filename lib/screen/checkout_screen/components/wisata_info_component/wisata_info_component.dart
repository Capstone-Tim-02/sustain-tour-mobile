import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/models/wisata_models/wisata_models.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/components/wisata_info_component/ticket_quantity_component.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class WisataInfoComponent extends StatelessWidget {
  final Wisata selectedWisata;

  const WisataInfoComponent({
    super.key,
    required this.selectedWisata
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            selectedWisata.photoWisata1,
            width: 83,
            height: 86,
            fit: BoxFit.fitHeight,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.image_not_supported);
            },
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.65,
              child: Text(
                selectedWisata.title,
                style: TextStyleWidget.titleT2(
                  color: ColorThemeStyle.black100,
                  fontWeight: FontWeight.w600
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.location_pin, size: 12),
                const SizedBox(width: 8),
                Text(
                  selectedWisata.kota.replaceAll('"', ''),
                  style: TextStyleWidget.bodyB3(
                    color: ColorThemeStyle.grey100,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TicketQuantityComponent(selectedWisata : selectedWisata),
            const SizedBox(height: 24),
          ],
        ),
      ],
    );
  }
}