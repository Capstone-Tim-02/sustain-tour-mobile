import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/constants/currency_format_const.dart';
import 'package:sustain_tour_mobile/constants/date_format_const.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/shadow_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class TiketCardComponentWidget extends StatelessWidget {
  final String invoiceNumber;
  final String photoWisataUrl;
  final String namaWisata;
  final DateTime tanggalBooking;
  final int totalCost;
  final int pointsEarned;
  final String status;
  final Color? upperColor;
  final void Function()? onTapPesanUlang;
  final void Function()? onTapCard;

  const TiketCardComponentWidget({
    super.key,
    required this.invoiceNumber,
    required this.photoWisataUrl,
    required this.namaWisata,
    required this.tanggalBooking,
    required this.totalCost,
    required this.pointsEarned,
    this.upperColor,
    this.onTapPesanUlang,
    required this.status,
    this.onTapCard,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapCard,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [ShadowStyle.shadowFix1],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: upperColor ?? ColorThemeStyle.blue80,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Kode Pemesanan:',
                        style: TextStyleWidget.titleT3(
                          color: Colors.white,
                          fontWeight: FontWeightStyle.regular,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        invoiceNumber,
                        style: TextStyleWidget.titleT3(
                          color: Colors.white,
                          fontWeight: FontWeightStyle.semiBold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(6))),
                    child: Text(
                      status,
                      style: TextStyleWidget.titleT3(
                        color: Colors.white,
                        fontWeight: FontWeightStyle.semiBold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 57,
                          width: 57,
                          decoration: const BoxDecoration(
                            color: ColorThemeStyle.blue60,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            child: Image.network(
                              photoWisataUrl,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 4),
                                child: Text(
                                  namaWisata,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyleWidget.titleT3(
                                    fontWeight: FontWeightStyle.semiBold,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                DateFormatConst.dateToTanggalBulanTahunFormat
                                    .format(tanggalBooking),
                                style: TextStyleWidget.bodyB3(
                                  fontWeight: FontWeightStyle.medium,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        CurrencyFormatConst.convertToIdr(totalCost, 2),
                        style: TextStyleWidget.titleT3(
                          fontWeight: FontWeightStyle.semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        '+$pointsEarned Poin',
                        style: TextStyleWidget.bodyB3(
                          color: ColorThemeStyle.green100,
                          fontWeight: FontWeightStyle.semiBold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            (onTapPesanUlang != null)
                ? Padding(
                    padding: const EdgeInsets.only(
                      left: 14.5,
                      top: 16,
                    ),
                    child: GestureDetector(
                      onTap: onTapPesanUlang,
                      child: Row(
                        children: [
                          Text(
                            'Pesan Ulang',
                            style: TextStyleWidget.bodyB2(
                              color: ColorThemeStyle.blue80,
                              fontWeight: FontWeightStyle.semiBold,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const Icon(
                            Icons.arrow_forward,
                            size: 16,
                            color: ColorThemeStyle.blue80,
                          )
                        ],
                      ),
                    ),
                  )
                : const SizedBox(),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
