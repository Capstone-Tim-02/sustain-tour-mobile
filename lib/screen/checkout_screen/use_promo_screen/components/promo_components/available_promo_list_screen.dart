import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/constants/date_format_const.dart';
import 'package:sustain_tour_mobile/models/promo_models/promo_models.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/checkout_provider.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/shadow_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
import 'package:sustain_tour_mobile/widget/snack_bar_widget.dart';

class AvailablePromoListScreen extends StatelessWidget {
  const AvailablePromoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutProvider checkoutProvider = Provider.of<CheckoutProvider>(context, listen: false);
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: checkoutProvider.listAllPromo.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        Promo promoItem = checkoutProvider.listAllPromo[index];
        return Consumer<CheckoutProvider>(
          builder: (context, checkoutProvider, child) {
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [ShadowStyle.shadowFix1]
              ),
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                margin: EdgeInsets.zero,
                color: ColorThemeStyle.white100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      child: Text(
                        promoItem.namaPromo,
                        style: TextStyleWidget.bodyB2(
                          color: ColorThemeStyle.black100,
                          fontWeight: FontWeight.w600
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        "Berlaku hingga ${DateFormatConst.dateToTanggalHalfBulanTahunFormatNoKoma.format(promoItem.tanggalKadaluarsa)}",
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.4,
                          height: 1.6,
                          color: ColorThemeStyle.black100
                        )
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)
                        ),
                        color: index == checkoutProvider.usedPromoIndex ? ColorThemeStyle.green100 : ColorThemeStyle.blue80
                      ),
                      padding: const EdgeInsets.only(left: 12, right: 14, top: 7, bottom: 7),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "KODE PROMO",
                            style: TextStyleWidget.bodyB1(
                              color: ColorThemeStyle.white100,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          index == checkoutProvider.usedPromoIndex
                          ? Container(
                              height: 32,
                              decoration: BoxDecoration(
                                color:  ColorThemeStyle.white100,
                                borderRadius: BorderRadius.circular(4)
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                                children: [
                                  Text(
                                    "Terpakai",
                                    style: TextStyleWidget.bodyB1(
                                      color: ColorThemeStyle.green100,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  const Icon(
                                    Icons.check,
                                    color: ColorThemeStyle.green100,
                                    size: 17,
                                  )
                                ],
                              ),
                            )
                          : GestureDetector(
                            onTap: (){
                              ScaffoldMessenger.of(context).hideCurrentSnackBar();
                              checkoutProvider.onCopyPromo(index);
                              Clipboard.setData(
                                ClipboardData(text: promoItem.kodeVoucher)).then((_){
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBarWidget.snackBarWidget(
                                      message: "Berhasil menyalin kode promo",
                                      duration: const Duration(seconds: 2)
                                    )
                                  );
                              });
                            },
                            child: Container(
                              height: 32,
                              decoration: BoxDecoration(
                                color: index == checkoutProvider.copyKodeIndex ? ColorThemeStyle.blue100 : ColorThemeStyle.white100,
                                borderRadius: BorderRadius.circular(4)
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                                children: [
                                  Text(
                                    promoItem.kodeVoucher.length > 15
                                    ? promoItem.kodeVoucher.substring(0,15)
                                    : promoItem.kodeVoucher,
                                    style: TextStyleWidget.bodyB1(
                                      color: index == checkoutProvider.copyKodeIndex ? ColorThemeStyle.white100 : ColorThemeStyle.black100,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  SvgPicture.asset(
                                    Assets.assetsIconsCopy,
                                    colorFilter: ColorFilter.mode(
                                      index == checkoutProvider.copyKodeIndex ? ColorThemeStyle.white100 : ColorThemeStyle.black100,
                                      BlendMode.srcIn
                                    ),
                                    width: 13,
                                    height: 13,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}